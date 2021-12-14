## My development settings for windows / powershell / neovim


### Fonts to install

- Coding Font : D2Coding ligature (https://github.com/naver/d2codingfont)
    - Visual Studio Code Font, must activate Ligature

- Terminal Font : Caskaydia Cove Nerd Font (https://www.nerdfonts.com/font-downloads)
    - Direct Download [Link](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip)
    - Set the Termainl Font to this


### Programs to install

- Install powershell (From Windows Store)

- Install Window Terminal (From Windows Store)
    - Set powershell to default

- Install Git (using winget)

```bash
winget install -e --id Git.Git
```

- Install OhMyPost (using winget)

```bash
winget install  JanDeDobbeleer.OhMyPosh
```

- Install chocolatey (https://chocolatey.org/install)

Run powershell with Administrator 
```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

- Inatll Fxf (Fuzzy finder)
```bash
choco install fzf
```

- Install neovim using chocolatey
```bash
choco install neovim
```

- Install nvm for node/npm/yarn using chocolatey
```bash
choco install nvm
nvm install latest
nvm install 16.13.0
nvm ls
nvm use 16.13.0
```

- Install rustup for rust
```bash
choco install rustup.install
```

- Install go 
```
choco install golang
```

### Setup powershell

- Make profile file for powershell (Microsoft.PowerShell_profile.ps1)

Default file location and filename : echo $PROFILE

My [Microsoft.PowerShell_profile.ps1](Microsoft.PowerShell_profile.ps1)

- Install Oh My Posh (Prompt theme engine)

```bash
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
```

- Customize prompt (Path) (my.omp.json)

Default file location : Same as Microsoft.PowerShell_profile.ps1

My [my.omp.json](my.omp.json)

- Install Ternminal-Icons

```bash
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
```

- Install PSReadLine

```bash
Install-Module PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
```

- Install z

```bash
Install-Module z -Force
```

- Install Fzf 

```bash
Install-Modele -Name PSFzf -Scope CurrentUser -Force
```

### Setup neovim

- Make setup file for neovim (init.vim)

Default file location : ~/AppData/Local/nvim/init.vim

My [init.vim](init.vim)


- Install vim-plug for neovim plugin management (https://github.com/junegunn/vim-plug)
```bash
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

```

- Install plugs in neovim

Must run in neovim
```bash
:PlugInstall
```


### Setup nvim-lspconfig (Language Server)

Reference : [nvim-lsconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

- Javascript & Typescript (tsserver)
```bash
npm install -g typescript typescript-language-server
```

- RUST (rls)
```bash
rustup component add rls rust-analysis rust-src
```

- GoLang (golangci_lint_ls, gopls)
```bash
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1
go install golang.org/x/tools/gopls@latest
```
