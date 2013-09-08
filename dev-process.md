# Vývojový proces

Krásný a čistý kód je o ničem, pokud celý proces vývoje aplikace není
nejak strukturován a řízen.


## GitHub

K verzování používáme Git a Github.com. Všechny firemní projekty musí 
mít repozitář na Github.com, tak aby jej kdokoliv mohl dohledat.

### Workflow s Githubem

#### Feature branches

Jakékoliv změny v rámci repozitáře se mohou dělat pouze skrze tzv. 
"feature branch". V praxi to znamená, že pokud chcete cokoliv na upravit
v rámci repozitáře, nejdříve si vytvoříte novou branch (`git checkout 
my-new-branch`), v ní pak uděláte změny a pak ji pushnete (`git push origin
  my-new-branch`).
V rámci každého projektu existuje vždy pouze jedna osoba, která muže 
dělat změny přímo na `master` branch. Vždý se jedná o člověka, který
má daný projekt na starosti (code master).


#### Master branch

`master` branch musí vždy obsahovat kód, který je nasazený na produkci 
(vyjímku samozřejmě představují projekty, které ještě v produkci nejsou).




