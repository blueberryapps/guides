# Testování

"TAFT. Test All The Fucking Time."


## Nástroje

Následující nástroje používáme pro testování:

* Testovací framework: [Rspec](https://github.com/rspec/rspec)
* Vytváření AR objektů: [Factory Girl](
https://github.com/thoughtbot/factory_girl) 
a [Factory Girl Rails](https://github.com/thoughtbot/factory_girl_rails).
* Framework pro akceptační testování: [Capybara](
https://github.com/jnicklas/capybara)


## Druhy testů

### Unit testy modelů (spec/models)

Nejzásadnější v projektu jsou unit testy modelů. Každá veřejná metoda 
každém modelu by měla mít odpovídající test.

### Unit testy kontrolerů (spec/controllers)

### Request testy kontrolerů (spec/request)

Request testy kontrolerů jsou v integrační testy kontrolerů a rozhodně by
neměli chybět u žádné API akce.

### Akceptační testy

Z hlediska funkčnosti aplikace jsou nejdůležitější akceptační testy.
Lze použít 2 nástroje pro jejich psaní: Cucumber a samotný Rspec za 
pomocí Capybara.
Jediná výhoda Cucumber je čitelnost samotných testovacích scénářů. 
Nicméně vzhledem k tomu, že se scénáře akceptačních testů téměř nikdy
nedostanou ke klientovi, většinou tím pádem není důvodu Cucumber 
používat.

