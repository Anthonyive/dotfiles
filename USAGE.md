# USAGE

Backup/sync dotfiles in my main computer using [Git Bare Repository](https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b). In case of the post is not accessible, I will just copy its content below for future reference.

## Getting started

1 .Create a `.dotfiles` folder in `$HOME`, which we'll use to track your dotfiles

```bash
git init --bare $HOME/.dotfiles
```

2. Create an alias called `dotfiles`

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

3. Set git status to hide untracked files

```bash
dotfiles config --local status.showUntrackedFiles no
```

4. Add the alias to .bashrc (or .zshrc) so you can use it later

```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Usage

Now you can use regular git commands such as:

```bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles commit -am "<commit-message>" # equivalent to `-a -m`
dotfiles push
```

Note that `dotfiles` command should be used in `$HOME` like `~`.

## Setup environment in a new computer

Make sure to have git installed, then:

1. Clone your github repository

```bash
git clone --bare https://github.com/anthonyive/dotfiles.git $HOME/.dotfiles
```

2. Define the alias in the current shell scope

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

3. Checkout the actual content from the git repository to your $HOME

```bash
dotfiles checkout
```

Note that if you already have some of the files you'll get an error message. You can either (1) delete them or (2) back them up somewhere else. It's up to you.
Awesome! You’re done.
