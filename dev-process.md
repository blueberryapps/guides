# Vývojový proces

Čistý kód sám o sobě nestačí, proces vývoje aplikací by měl mít strukturu
a řízení.


## GitHub

K verzování používáme [Git](http://git-scm.com/), [Github.com](
http://github.com) a [GitLab](http://gitlab.blueberry.cz). Všechny firemní 
projekty musí mít repozitář na Githubu nebo GitLabu, aby jej kdokoliv mohl 
dohledat.

### GitHub/GitLab Workflow

1. Vytvořit lokalní feature branch založenou na poslední verzi master branch
2. Píšeme testy, píšeme kód, testy, kód, ... :)
3. Push branch na Github/Gitlab
4. Vytvořit Pull Request
5. Code review
6. Po vyřešení všech komentářů a schválení PR probíhá merge
7. Merge do `master` branche

#### Git

Vytvoření feature branch:

```shell
git checkout master
git pull
git checkout -b my-new-feature
```

Při práci ve feature branch je potřeba čas od času provést merge změn, které
mezitím probíhají na `master` branch:

```shell
git fetch origin
git rebase origin/master
```

Push branche na Github:

```shell
git push origin my-new-feature
```

Nezapomínejte psát smysluplné [commit message](
http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html).

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

