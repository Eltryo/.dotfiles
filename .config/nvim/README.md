# nvim-settings

### Description
This is my Neovim setup. Feel free to clone it.

### Requirements
This setup requires nvim v0.9.0 to run correctly. Run the following command to install the required version.

```sh
sudo snap install nvim --classic
```

Install packer.

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Installation
```sh
git clone https://github.com/Eltryo/nvim-settings.git ~/.config/nvim
```

Open ```~/.config/nvim/lua/packer.lua``` and run ```:PackerSync```.
For more information about Packer check out https://github.com/wbthomason/packer.nvim.
