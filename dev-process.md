# Vývojový proces

Krásný a čistý kód je o ničem, pokud celý proces vývoje aplikace není
nejak strukturován a řízen.


## GitHub

K verzování používáme Git a Github.com. Všechny firemní projekty musí 
mít repozitář na Github.com, tak aby jej kdokoliv mohl dohledat.

### Workflow s Githubem

1. Vytvořit feature branch
2. Vytvořit Pull Request s označením WIP - Work in Progress
3. Po dokončení změn odebrat WIP z názvu
4. Code review
5. Merge do `master` branche

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

#### Pull requesty

Všechny feature branch se musí do `master` branch dostat jedině přes Pull
Request. Veškerá diskuze nad změnami a code review pak probíhá v rámci
Pull requestu.

#### QA branch

V případech, kdy je potřeba otestovat funkcionalitu z několika feature 
branch najednou použijeme tzv. QA branch. QA branch se vytváří jako 
uplně nová z `master` a pak se do ní mergují jednotlivé feature branch 

```shell
git checkout -b qa-2013-09-09
git merge 001-feature-branch-one
git merge 002-feature-branch-two
git push origin qa-2013-09-09
cap -s branch=qa-2013-09-09 staging deploy
```

