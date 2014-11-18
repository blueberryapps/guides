# Instalace Ruby na MacOS X

Návod na to, jak co nejkratší cestou k funkčnímu Ruby prostředí na Macu.

## Instalace Homebrew

Homebrew slouží k instalaci a správě balíčků na MacOS X.

```shell
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

## Databáze, knihovny apod.

```shell
# Primární databáze pro nové projekty:
brew install postgres --no-python
initdb /usr/local/var/postgres -E utf8
# Redis - key value databáze
brew install redis
# ImageMagick slouží pro práci s obrázky
brew install imagemagick
# QT je potřeba pro akceptační testy
brew install qt
```

## Pow

Pow je Rack server, díky kterému není potřeba startovat Rails aplikace
ručně.

```shell
curl get.pow.cx | sh
```

## Rbenv

Rbenv slouží k správě různých verzí Ruby v systému:

```shell
brew install rbenv
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
brew install rbenv-gem-rehash
brew install ruby-build
```

## Ruby & gems

Nainstalujeme poslední verzi Ruby a pár základních gemů:

```shell
rbenv install 2.1.5
rbenv global 2.1.5
rbenv rehash
gem update --system
gem install bundler pg rails --no-document
```

