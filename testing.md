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
každém modelu by měla mít odpovídající test. Unit testy se vyznačují
především tím, že testují pouze kód jednoho objektu a žádných dalších.
V praxi to znamená, že všechny ostatní objekty, které testovaný objekt
používá by měly být mock objekty. 

Příklad:

```ruby
class Order < ActiveRecord::Base

  def free_shipping?(shipping_policy)
    total_price >= shipping_policy.free_shipping_limit
  end

end
```

Test s použití mock (double) objektů:

```ruby
describe Order
  describe '#free_shipping?' do
    context "total price over free shipping limit" do

      it "returns true" do
        order = Order.new(total_price: 5000)
        policy = double 'ShippingPolicy', free_shipping_limit: 3000
        expect(order.free_shipping?(policy)).to be_true
      end

    end
  end
end
```

### Integrační testy modelů

Pokud jsou všechny modely testovány pomocí mock objektů je potřeba 
přidat testy, které 

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

