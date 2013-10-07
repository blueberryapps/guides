# Ruby & Ruby on Rails

## Ruby

### Všeobecná pravidla

* Dodržujeme jednotný styl kódu podle [Ruby style guide](
https://github.com/bbatsov/ruby-style-guide)
* Na nové projekty nasazujeme vždy poslední stabilní verzi Ruby
* Ruby verzi na které projekt běží specifikujeme pomocí souboru `.ruby-version`
(včetně patch verze)


## Ruby on Rails

Všechny nové projekty musí používat [blueberry_rails](
https://github.com/blueberryapps/blueberry_rails) šablonu. Nejdříve je nutné 
nainstalovat `blueberry_rails` gem:

    $ gem install blueberry_rails

Pak už jen vygenerovat projekt pomocí příkazu `blueberry_rails` (má 
stejné možnosti jako `rails` příkaz):

    $ blueberry_rails newproject


### Všeobecná pravidla

* Preferujeme SQL databaze (PostgreSQL, MySQL) před NoSQL (MongoDB atd) pokud
není k nasazení NoSQL opravdu pádný důvod.
* Na každém větším projektu by se emaily mělo posílat mimo 
request-response cyklus, to znamená například pomocí [Sidekiq](
https://github.com/mperham/sidekiq).
* Nepoužíváme ActiveRecord finders (where, etc) v kontrolerech.
* Vždy používat překlady (i18n) pro všechny texty (šablony, atd.)
* Preferujte šablonovací jazyk [slim](http://slim-lang.com/) oproti HAML a ERB.

### Bundler

* Vždy vyspecifikujte verzi Ruby v `Gemfile`
* Používejte přesnou verzi u gemů, u kterých hrozí problémy s 
kompatabilitou budoucích verzí
* Používejte pesimistický lock na verzi (`~>`) u všech ostatních gemů

### Doporučené gemy

Předtím, než se pustíte do implementace, je dobré se podívat, zdali 
stejný problém už neřešil někdo před vámi.

* [cancan](https://github.com/ryanb/cancan) - autorizace uživatelů 
* [carrierwave](https://github.com/jnicklas/carrierwave) - upload souborů
* [devise](https://github.com/plataformatec/devise) - kompletní řešení autentizace
* [exception_notification](https://github.com/smartinez87/exception_notification) -
 zasílání vyjímek na email
* [guard](https://github.com/guard/guard) - automatické spouštění testů při vývoji
* [newrelic_rpm](https://github.com/newrelic/rpm) - performance monitoring nejenom v produkci
* [mailcatcher](http://mailcatcher.me/) - testování emailů
* [money_rails](https://github.com/RubyMoney/money-rails) - knihovna pro práci a 
formátování monetárních hodnot
* [state_machine](https://github.com/pluginaweek/state_machine) - knihovna pro práci se stavy 
(finite state machine) v Ruby třídách
* [sidekiq](https://github.com/mperham/sidekiq) - background jobs
* [slim](http://slim-lang.com/) - šablonovací jazyk podobný HAMLu
* [simple_form](https://github.com/plataformatec/simple_form) - DSL pro HTML formuláře
* [whenever](https://github.com/javan/whenever) - správa cron tasků

#### Problémové gemy

Následující gemy nepoužívat na žádných projektech.

* turbolinks - implicitní součást Rails 4, která působí víc problémů 
než užitku. [pjax](https://github.com/defunkt/jquery-pjax) je lepší 
alternativa.

### Deploy

Deploy se většinou provádí po schválení pull requestu code masterem do `master`
branch do produkčního, anebo jakékoliv testovací branche do staging prostředí.

#### Deploy config

Následující config je už jen pro Rails 4, pro starší je config napsaný a zřejmě
se nebude měnit. Pro deploy používáme kromě `capistrano` na rozlišení stages 
gem `capistrano-ext` a poté (nově) pro ruby2 server (81.0.240.110) ještě gem
`rvm-capistrano`.  Ten zajistí deploy pomocí správné verze Ruby, která je na 
serveru nainstalována a případně ji zvládne i pomocí rvm nainstalovat (netestováno).

#### Vzorový deploy config

Převzato z projektu segwaypoint-backend. Další možnost je přidat třeba `whenever` 
apod. *Všimněte si přítomnosti nastavení group_writable*.

Nastavení v následujících souborech:
* [config/deploy.rb](examples/deploy.rb)
* [config/deploy/production.rb](examples/deploy-production.rb)

