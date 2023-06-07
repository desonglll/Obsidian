---

title: neovim-based-on-lua
date: 2023-06-07 14:14
author: Leo Song
categories:

- Markdown
  tags:

---

标签

- #Vim
- #lua

基于 Lua 的 NeoVim 配置可以提供更强大的扩展性和灵活性。以下是基于 Lua 的 NeoVim 配置步骤：

1. 确保你的 NeoVim 版本支持 Lua。你可以通过运行 `nvim --version` 命令来检查。

2. 打开终端并进入 NeoVim 的配置目录。通常情况下，该目录位于 `~/.config/nvim/`。

3. 如果目录不存在，可以创建它：

   ```
   mkdir -p ~/.config/nvim/
   ```

4. 创建或编辑 `init.lua` 文件：

   ```
   nvim ~/.config/nvim/init.lua
   ```

5. 在 `init.lua` 文件中，你可以编写 Lua 代码来配置 NeoVim。例如，以下是一个简单的示例配置：

   ```lua
   -- 启用插件管理器（使用 Packer）
   require('packer').startup(function()
       -- 插件列表
       use 'tpope/vim-sensible' -- 示例插件
   end)

   -- 设置基本选项
   vim.cmd('syntax on')
   vim.cmd('filetype plugin indent on')
   vim.cmd('set number')

   -- 设置键映射
   vim.api.nvim_set_keymap('n', '<Leader>h', ':help<CR>', { noremap = true, silent = true })
   ```

   在此示例中，我们使用 Packer 插件管理器，并添加了一个示例插件 `vim-sensible`。我们还设置了一些基本选项（如语法高亮、文件类型识别和行号），以及一个键映射（`<Leader>h` 映射到帮助命令）。

6. 保存并退出 `init.lua` 文件。

7. 重新启动 NeoVim，它将加载你的 Lua 配置并应用更改。

这只是一个简单的示例，你可以根据自己的需求进一步扩展和定制你的 NeoVim 配置。

## **Github** repository link

:star:This is link: [`https://github.com/desonglll/neovim-lua`](https://github.com/desonglll/neovim-lua)

> Every :star: marked is necessary for installations.
>
> Make sure everything be installed!!!

## Necessary to install

### Install Homebrew 2022.07.13

Official wesite of Homebrew [https://brew.sh/](https://brew.sh/)

#### 1. Set mirror by using USTC

```shell
HOMEBREW_CORE_GIT_REMOTE=https://mirrors.ustc.edu.cn/homebrew-core.git
```

#### 2. Install Homebrew

```shell
/bin/bash -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ineo6/homebrew-install/install.sh)"
```

#### 3. Add Homebrew to $PATH

```shell
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$your username$/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Install yarn

```shell
brew install yarn
```

### Install Neovim

```shell
brew install neovim
```

## Steps to go

### :star:Clone this repository

`git clone git@github.com:desonglll/neovim-lua.git ~/.config/nvim`

### :star:Install Packer

`git clone --depth 1 git@github.com:wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

### :star:Install lazygit

`brew install lazygit`

### :star:Install LSP configuration

#### Python

Install Python language server

`npm i -g pyright`

In `./lua/lsp-config.lua`

```lua
require'lspconfig'.pyright.setup{}
```

#### Clangd

[Installation for Clangd](https://clangd.llvm.org/installation.html)

In `./lua/lsp-config.lua`

```lua
require'lspconfig'.clangd.setup{}
```

#### Jdtls

```lua
-- Official download page: http://download.eclipse.org/jdtls/snapshots/?d
require('lspconfig')['jdtls'].setup{
    on_attach = on_attach,
    cmd = {
      "jdtls",
      -- path to jdt-language-server-latest bin directory.
      '$HOME/.config/nvim/sources/jdtls/jdt-language-server-latest/bin',
      "~/.config/nvim/sources/jdtls/jdt-language-server-latest/bin",
    },
    single_file_support = true,
}
```

```.zprofile
# .zprofile

export PATH=$(npm prefix -g)/bin:$PATH

export PATH="/Users/mikeshinoda/.local/lib/node_modules/typescript-language-server/lib:$PATH"
export PATH="/opt/homebrew/bin/pylsp$PATH"

export PATH="/Users/mikeshinoda/.config/nvim/sources/jdtls/jdt-language-server-latest/bin:$PATH"
export PATH="$HOME/.config/nvim/sources/lsp-server/sumneko_lua/extension/server/bin:$PATH"
```

### :star:Config

press `nvim` and `:PackerSync` to sync.

## Plugins

### p-vsnip

This command means setting vsnip's default directory.

```lua
vim.g['vsnip_snippet_dir'] = '~/.config/nvim/.vsnip'
```

### :star:Markdown Preview Enhanced

```shell
cd ~/.local/share/nvim/site/pack/packer/start/
git clone https://github.com/iamcco/markdown-preview.nvim.git
cd markdown-preview.nvim
yarn install
yarn build
```

Using yarn to install.

### nvim-surround(YSW)

```txt
2.1. The Basics                                         *nvim-surround.basics*

The primary way of adding a new pair to the buffer is via the normal-mode *ys*
operator, which stands for "you surround". It can be used via
`ys{motion}{char}`, which surrounds a given {motion} with a delimiter pair
associated with {char}. For example, `ysa")` means "you surround around quotes
with parentheses".

In all of the following examples, the `*` denotes the cursor position:

    Old text                    Command         New text ~
    local str = H*ello          ysiw"           local str = "Hello"
    require"nvim-surroun*d"     ysa")           require("nvim-surround")
    char c = *x;                ysl'            char c = 'x';
    int a[] = *32;              yst;}           int a[] = {32};

Furthermore, there are insert-mode *<C-g>s* and visual-mode *S* mappings, that
add the delimiter pair around the cursor and visual selection, respectively.
In all of the following examples, we will use `|` to demarcate the start and
end of a visual selection:

    Old text                    Command         New text ~
    local str = *               <C-g>s"         local str = "*"
    local tab = *               <C-g>s}         local str = {*}
    local str = |some text|     S'              local str = 'some text'
    |div id="test"|</div>       S>              <div id="test"></div>

To delete a delimiter pair, use the *ds* operator, which stands for "delete
surround". It is used via `ds[char]`, deleting the surrounding pair associated
with {char}. For example, `ds)` means "delete surrounding parentheses".

    Old text                    Command         New text ~
    local x = ({ *32 })         ds)             local x = { 32 }
    See ':h h*elp'              ds'             See :h help
    local str = [[Hell*o]]      ds]             local str = [Hello]

To change a delimiter pair, use the *cs* operator, which stands for "change
surround". It is used via `cs{target}{replacement}`, changing the surrounding
pair associated with {target} to a pair associated with {replacement}. For
example, `cs'"` means "change the surrounding single quotes to double quotes".

    Old text                    Command         New text ~
    '*some string'              cs'"            "some string"
    use<*"hello">               cs>)            use("hello")
    `some text*`                cs`}            {some text}

--------------------------------------------------------------------------------
```

### :star:Preitter

```shell
cd /Users/mikeshinoda/.local/share/nvim/site/pack/packer/start/vim-prettier.git && yarn install
```

### :star:Autoformat

First, install `pynvim`.

```shell
python3 -m pip install pynvim
```

### Install jedi

```bash
pip3 install jedi
```

## Others

### keymaps repeat

In command line: `verbose map <key>` can see mapping of `<key>`.

### Setting workplace of neovim

```lua
vim.opt.runtimepath:append("$HOME/.config/nvim/sources/treesitter")
```
