

Primární vývojovou platformou pro webové aplikace a služby je 
[Ruby on Rails](http://www.rubyonrails.org).


## Všeobecná pravidla týkající se Ruby projektů:

* Na nové projekty nasazujeme Ruby 2.0.
* Dodržujeme jednotný styl kódu podle [Ruby style guide](https://github.com/bbatsov/ruby-style-guide)
* Ruby verzi na které projekt běží specifikujeme pomocí souboru `.ruby-version`


## Ruby on Rails

### Všeobecná pravidla Ruby on Rails projektů:

* Nepoužíváme Turbolinks, preferujeme PJAX.
* Preferujeme SQL databaze (MySQL, PostgreSQL) před NoSQL (MongoDB atd)
* Na každém větším projektu by se emaily mělo posílat mimo 
request-response cyklus, to znamená například pomocí Sidekiq


### Testování

Na všech Rails projektech píšeme testy pomocí frameworku Rspec.

### Unit testy modelů (spec/models)

Nejzásadnější v projektu jsou unit testy modelů. Každá veřejná metoda 
každém modelu by měla mít odpovídající test.

### Unit testy kontrolerů (spec/controllers)

### Akceptační testy

Z hlediska funkčnosti aplikace jsou nejdůležitější akceptační testy.
Lze použít 2 nástroje pro jejich psaní: Cucumber a samotný Rspec za 
pomocí Capybara.
Jediná výhoda Cucumber je čitelnost samotných testovacích scénářů. 
Nicméně vzhledem k tomu, že se scénáře akceptačních testů téměř nikdy
nedostanou ke klientovi, většinou tím pádem není důvodu Cucumber 
používat.


