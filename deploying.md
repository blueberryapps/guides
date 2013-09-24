# Deploying

Deploy se většinou provádí po schválení pull requestu code masterem do `master`
branch do produkčního, anebo jakékoliv testovací branche do staging prostředí.

## Deploy config

Následující config je už jen pro Rails 4, pro starší je config napsaný a zřejmě
se nebude měnit. Pro deploy používáme kromě `capistrano` na rozlišení stages 
gem `capistrano-ext` a poté (nově) pro ruby2 server (81.0.240.110) ještě gem
`rvm-capistrano`.  Ten zajistí deploy pomocí správné verze Ruby, která je na 
serveru nainstalována a případně ji zvládne i pomocí rvm nainstalovat (netestováno).

## Vzorový deploy config

Převzato z projektu segwaypoint-backend. Další možnost je přidat třeba `whenever` 
apod. *Všimněte si přítomnosti nastavení group_writable*.

Nastavení v následujících souborech:
* [config/deploy.rb](examples/deploy.rb)
* [config/deploy/production.rb](examples/deploy-production.rb)
