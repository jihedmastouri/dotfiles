<div align='center'>
<img src="https://user-images.githubusercontent.com/25284659/190037137-c25a6f85-19e5-4bad-b82a-d2ee6de42307.gif" />
 <p> The commits in this repo illustrate my journey to build the best workflow a developer ever had.</p>
</div>


### About:
- Fedora + Gnome = A match made in Heaven!
- Neovim with native LSP and Lazy. (Shout out to all the amazing plugins ❤️)
- Terminal: Ghostty + ZSH + Tmux
- Other CLI/TUI tools include: `fzf`, `atuin`, `Delta`, `fd`, `Batcat`, `rg`, `lazygit`, `lazydocker`...
- Sometimes VS Code.

### Setup:

Clone the repo with all the submodules:

```
git clone --recursive --single-branch --depth 1  https://github.com/jihedmastouri/dotfiles .dotfiles
```

Use GNU Stow for symlinks:

```
chmod +x ./stow.sh && ./stow.sh -a
```

 Apply Gnome settings
```
dconf load / < dump.dconf
```
