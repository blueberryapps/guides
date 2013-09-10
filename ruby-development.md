# Ruby & Ruby on Rails

## Ruby

### Všeobecná pravidla

* Na nové projekty nasazujeme Ruby 2.0.
* Dodržujeme jednotný styl kódu podle [Ruby style guide](
https://github.com/bbatsov/ruby-style-guide)
* Ruby verzi na které projekt běží specifikujeme pomocí souboru `.ruby-version`


## Ruby on Rails

### Všeobecná pravidla

* Preferujeme SQL databaze (MySQL, PostgreSQL) před NoSQL (MongoDB atd).
* Na každém větším projektu by se emaily mělo posílat mimo 
request-response cyklus, to znamená například pomocí Sidekiq
* Nepoužíváme Turbolinks, radši implementovat PJAX.
* Na všech projektech musí být nainstalován `exception_notifier` gem
* Pro testování emailů používáme `mailcatcher` gem
* K správě cron tasků používáme `whenever` gem

