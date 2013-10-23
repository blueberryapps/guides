# Travis CI

## Continuous deploy

1. Vytvorime SSH deploy klic

```sh
ssh-keygen -f deploykey
```

2. Přídáme vygenerovaný deploy klíč do `.ssh/authorized_keys` na serveru.

3. Ziskame veřejný klíč, pomocí kterého Travis stahuje buildy.

```shell
curl -u <username> https://api.github.com/repos/blueberryapps/<repo>/keys | grep -B 4 travis-ci\\.com | grep '"key":' | perl -pe 's/^[ ]+"key": //; s/^"//; s/",$//' > id_travis.pub
ssh-keygen -e -m PKCS8 -f id_travis.pub > id_travis.pub.pem
```

4. Zašifrujeme privátní klíč, který jsme vygenerovali v kroku 1.

```shell
password=`cat /dev/urandom | head -c 10000 | openssl sha1`
openssl aes-256-cbc -k "$password" -in deploykey.pem -out deploykey.pem.enc -a
echo "$password" | openssl rsautl -encrypt -pubin -inkey id_travis.pub.pem -out secret
```

5. Vytvorime slozku `.travis` v repozitáři a nakopírujeme do ní soubory `secret` a `deploykey.pem.enc`.

6. Upravíme `.travis.yml`.

```yaml
before_script:
  - secret=`openssl rsautl -decrypt -inkey ~/.ssh/id_rsa -in .travis/secret`
  - openssl aes-256-cbc -k "$secret" -in .travis/deploy_key.pem.enc -d -a -out .travis/deploy_key.pem
after_success:
  - |
    if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
      chmod 600 .travis/deploy_key.pem
      ssh-add .travis/deploy_key.pem
      bundle exec cap staging deploy
    fi
```

