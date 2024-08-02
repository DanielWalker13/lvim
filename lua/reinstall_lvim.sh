
rm -rf ~/.local/share/lunarvim
rm -rf ~/.cache/lvim
rm -rf ~/.local/bin/lvim

LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

