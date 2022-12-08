# Git hooks

> inspiration : https://www.viget.com/articles/two-ways-to-share-git-hooks-with-your-team/
> and https://stackoverflow.com/a/61341619/2627873

This is a pure-bash way of managing git hooks. Git hooks can now be versioned with the project.

## Getting started

For this example, we chose to put our githooks in a `.hooks` folder.

So let's create our folder : `mkdir .hooks`

We copy the files from this repo into this newly created folder.

Make sure that every hook script is executable : `chmod +x .hooks/**/*`

## Edit your git config

- you can edit the local git config (only the current repo) with : `git config --local core.hooksPath .hooks`

- or this command to change the global config : `git config --global core.hooksPath .hooks`

- or manually edit the git config to add :

```
[core]
    hooksPath = .hooks
```

## Examples

You can find some examples in `pre-commit.d` and `pre-push.d`.

## Alternatives

- [https://pre-commit.com/](https://pre-commit.com/)
