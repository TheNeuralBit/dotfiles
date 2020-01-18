Dotfiles managed with GNU Stow based on Brandon Invergo's
[excellent guide](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

To link files from a particular directory, dir, run `stow <dir>`, for example,
to set up bash and vim config:

```
$ stow bash vim
```

Hacky self-installing script:
```
$ bash <(curl https://raw.githubusercontent.com/TheNeuralBit/dotfiles/master/init.sh)
```

# Dependencies
xautolock, i3lock, fzf

``` sh
$ sudo pacman -S i3lock xautolock fzf
$ sudo apt install i3lock xautolock fzf
```

cquery
[Build Instructions](https://github.com/cquery-project/cquery/wiki/Building-cquery)
