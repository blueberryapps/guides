# Shell tipy

## Mazání QA branchí

Vymaže všechny branche na `origin` (remote), které začínají na `qa-`:

```shell
git branch -r | grep origin/qa- | awk -F '/' '{ print $2 }' | xargs -I % git push origin :%
```

Smazání lokálních brancí je jednodušší:

```shell
git branch | grep qa- | xargs git branch -D
```

