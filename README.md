# dotfiles

 <div align="center" >

![Neovim](https://img.shields.io/static/v1?style=flat-square&message=Neovim&color=1273b1&logo=Neovim&logoColor=FFFFFF&label=)
![Alacritty](https://img.shields.io/static/v1?style=flat-square&message=Alacritty&color=black&logo=GNOME%20Terminal&logoColor=FFFFFF&label=)
![tmux](https://img.shields.io/static/v1?style=flat-square&message=tmux&color=1BB91F&logo=tmux&logoColor=FFFFFF&label=)
![ZSH](https://img.shields.io/static/v1?style=flat-square&message=ZSH&color=322&logo=GNU+Bash&logoColor=FFF&label=)
![Fedora](https://img.shields.io/static/v1?style=flat-square&message=Fedora&color=51A2DA&logo=Fedora&logoColor=FFFFFF&label=)
![GNOME](https://img.shields.io/static/v1?style=flat-square&message=GNOME&color=4A86CF&logo=GNOME&logoColor=FFFFFF&label=)
![Firefox](https://img.shields.io/static/v1?style=flat-square&message=Firefox&color=FF7139&logo=Firefox+Browser&logoColor=FFFFFF&label=)
![Vim](https://img.shields.io/static/v1?style=flat-square&message=Vim&color=019733&logo=Vim&logoColor=FFFFFF&label=)
![Visual Studio Code](https://img.shields.io/static/v1?style=flat-square&message=VS+Code&color=007ACC&logo=Visual+Studio+Code&logoColor=FFFFFF&label=)

 The commits in this repo illustrate my journey to build the best workflow a developer ever had.

</div>


<div align='center'>
<img src="https://user-images.githubusercontent.com/25284659/190037137-c25a6f85-19e5-4bad-b82a-d2ee6de42307.gif" />
</div>

### About:
- Fedora + Gnome = A match made in Heaven!
- Neovim with native LSP and Lazy. (Shoutout to all the amazing plugins ❤️)
- Terminal: Alacritty + FiraCode + ZSH + Tmux
- Other CLI/TUI tools include: `fzf`, `atuin`, `Delta`, `fd`, `Batcat`,`rg`...
- Sometimes VS Code.

### Setup:

Clone the repo with all the submodules:

```
git clone --recursive https://github.com/jihedmastouri/dotfiles .dotfiles
```

Use GNU Stow for symlinks:

```
chmod +x ./stow.sh && ./stow.sh -a
```

 Apply Gnome settings
```
dconf load / < dump.dconf
```

#### All patched and working thanks to the endeavors of many people and organizations such as:

<div align="center" >

![GNU](https://img.shields.io/static/v1?style=for-the-badge&message=GNU&color=A42E2B&logo=GNU&logoColor=FFFFFF&label=)
![Linux](https://img.shields.io/static/v1?style=for-the-badge&message=Linux&color=222222&logo=Linux&logoColor=FCC624&label=)
![Apache](https://img.shields.io/static/v1?style=for-the-badge&message=Apache&color=D22128&logo=Apache&logoColor=FFFFFF&label=)
![Mozilla](https://img.shields.io/static/v1?style=for-the-badge&message=Mozilla&color=000000&logo=Mozilla&logoColor=FFFFFF&label=)
![GNOME](https://img.shields.io/static/v1?style=for-the-badge&message=GNOME&color=4A86CF&logo=GNOME&logoColor=FFFFFF&label=)
![KDE](https://img.shields.io/static/v1?style=for-the-badge&message=KDE&color=1D99F3&logo=KDE&logoColor=FFFFFF&label=)

</div>
