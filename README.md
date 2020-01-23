# dotfiles
Configurations en tout genre

# zsh & oh-my-zsh
Using oh-my-zsh `completions` and `functions` directories in $ZSH are automatically added to `fpath`.
For instance adding `rustup` completions can be done using
```
rustup completions zsh > $ZSH/functions/_rustup
```
instead of creating the `.zfunc` directory and manually adding it up to `fpath` as recommended by the rustup documentation.
