# Git hooks

> inspiration : https://www.viget.com/articles/two-ways-to-share-git-hooks-with-your-team/
> and https://stackoverflow.com/a/61341619/2627873

## Getting started

For this example, we chose to put our githooks in a `.githooks` folder.

So let's create our folder : `mkdir .githooks`

Make sure that every hook script is executable : `chmod +x .githooks/**/*`

### Edit your git config

- edit your git config to add :

```
[core]
    hooksPath = .githooks
```

- or use this command to set-up the current project : `git config core.hooksPath .githooks`

- or this command to set-up every project :  `git config --global core.hooksPath .githooks`


## Alternatives

- [https://pre-commit.com/](https://pre-commit.com/)