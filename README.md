## My neovim settings for windows / powershell & for developement

### Programs to install

- Install chocolatey (https://chocolatey.org/install)

Run powershell with Administrator 
```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

- Install neovim using chocolatey
```bash
choco install neovim
```

### Setup neovim

- Make setup file for neovim (init.vim)

Default file location : ~/AppData/Local/nvim/init.vim
My [init.vim](init.vim)


