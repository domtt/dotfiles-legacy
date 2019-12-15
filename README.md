# Dotfiles

If you'd like to set up your own dot files, check out [this article](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b).

![screenshot](./Pictures/screenshot.png)

## Prerequisites

This config has been tested on the following:
 * **Ubuntu** (19.10)

## Setup on a new computer

```
curl https://tdom.dev/dotfiles.sh | bash
```

## Post Installation

The following shortcuts have to be configured by you manually:
 - `meta+t` - alacritty

NeoVim also requires you to install the plugins yourself:

```
:PlugInstall
:coc#util#install()
```




## My configuration

| Name | App |
| -- | -- |
| Terminal | Alacritty |
| Theme | Dracula |
| Editors | NeoVim, VsCode |
| Languages | Python, Node.js, Rust, Dart, Go |
| Note Taking | TexLive, Pandoc |


