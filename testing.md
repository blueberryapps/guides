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
používá by měly být mock objekty. Unit testy zároveň nemají pracovat s
databází.

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
describe Order do
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

Integrační testy modelů testují spolupráci objektů mezi sebou a s nižšími
vrstvami, to mimojiné znamená, že integrační testy musí pracovat s databazí.

### Request testy kontrolerů (spec/request)

Request testy kontrolerů jsou v integrační testy kontrolerů a rozhodně by
neměli chybět u žádné API akce. Je důležité také otestovat chybové stavy, tzn.
stavy při kterých se předávají do kontrolerů neplatné hodnoty.

### Akceptační testy

Z hlediska funkčnosti aplikace jsou nejdůležitější akceptační testy, protože
mají testovat aplikaci z pohledu uživatele. Pro každou functionalitu v projektu
musí existovat odpovídající akceptační test. Jedině tak, lze předejít hodinám
neustáleho testování a ujištování, že nová functionalita nerozbije tu 
stávající.
Preferovaný způsob psaní akceptačních testů je pomocí RSpec a Capybara, příklad:

```ruby
require 'spec_helper'
require 'capybara/rspec'

feature "user sign in" do

  let(:user) { create :user }

  before do
    navigate_to_sign_in
  end

  scenario "user doesn't fill anything" do
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario "user fills correct credentials" do
    sign_in_with user.email, user.password
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Balance: $0.0'
  end

  def navigate_to_sign_in
    visit "/mobile/home"
    click_link 'Sign In'
  end
  
  def sign_in_with(email, password)
    fill_in 'Email',    with: email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end

end
```
