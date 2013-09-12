# Ruby & Ruby on Rails

## Ruby

### Všeobecná pravidla

* Dodržujeme jednotný styl kódu podle [Ruby style guide](
https://github.com/bbatsov/ruby-style-guide)
* Na nové projekty nasazujeme Ruby 2.0.
* Ruby verzi na které projekt běží specifikujeme pomocí souboru `.ruby-version`


## Ruby on Rails

### Všeobecná pravidla

* Preferujeme SQL databaze (MySQL, PostgreSQL) před NoSQL (MongoDB atd).
* Na každém větším projektu by se emaily mělo posílat mimo 
request-response cyklus, to znamená například pomocí Sidekiq
* Nepoužíváme ActiveRecord finders (where, etc) v kontrolerech.

### Gemy

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
* [simple_form](https://github.com/plataformatec/simple_form) - DSL pro HTML formuláře
* [whenever](https://github.com/javan/whenever) - správa cron tasků

#### Problémové gemy

Následující gemy nepoužívat na žádných projektech.

* turbolinks - implicitní součást Rails 4, která působí víc problémů 
než užitku. [pjax](https://github.com/defunkt/jquery-pjax) je lepší 
alternativa.
