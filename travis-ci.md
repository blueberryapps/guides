# Travis CI

## Continuous integration

Nastavení pro Travis CI se ukládá v souboru `.travis.yml` v samotném 
repozitáří.

Příklad nastavení pro Rails projekt:

```yaml
language: ruby
cache: bundler
rvm:
  - 1.9.3
  - 2.0.0
services:
  - postgresql
before_script:
  - cp config/database.test.yml config/database.yml
  - psql -c 'create database avservis_fm_test;' -U postgres
  - psql -c 'create database avservis_fm_development;' -U postgres
```


## Continuous deploy

1. Vytvoříme SSH klíč pro deploy (bez hesla):

```shell
ssh-keygen -f deploy-C deploy@travis
```

2. Přídáme vygenerovaný deploy klíč (`deploy.pub`) do `.ssh/authorized_keys` na serveru.

3. Ziskame veřejný klíč, pomocí kterého Travis stahuje buildy.

```shell
curl -u <username> https://api.github.com/repos/blueberryapps/<repo>/keys | grep -B 4 travis-ci\\.com | grep '"key":' | perl -pe 's/^[ ]+"key": //; s/^"//; s/",$//' > id_travis.pub
ssh-keygen -e -m PKCS8 -f id_travis.pub > id_travis.pub.pem
```

4. Zašifrujeme privátní klíč, který jsme vygenerovali v kroku 1.

```shell
password=`cat /dev/urandom | head -c 10000 | openssl sha1`
openssl aes-256-cbc -k "$password" -in deploy -out deploy.pem.enc -a
echo "$password" | openssl rsautl -encrypt -pubin -inkey id_travis.pub.pem -out secret
```

5. Vytvorime slozku `.travis` v repozitáři a nakopírujeme do ní soubory `secret` a `deploy.pem.enc`.

6. Upravíme `.travis.yml`.

```yaml
before_script:
  - secret=`openssl rsautl -decrypt -inkey ~/.ssh/id_rsa -in .travis/secret`
  - openssl aes-256-cbc -k "$secret" -in .travis/deploy.pem.enc -d -a -out .travis/deploy.pem
after_success:
  - |
    if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
      chmod 600 .travis/deploy.pem
      ssh-add .travis/deploy.pem
      bundle exec cap staging deploy
    fi
```

