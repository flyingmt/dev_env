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

### Setup neovim

- Make setup file for neovim (init.vim)

Default file location : ~/AppData/Local/nvim/init.vim

My [init.vim](init.vim)


- Setup nvim-lspconfig (Language Server)

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
