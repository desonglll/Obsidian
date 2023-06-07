---
title: vims
date: 2023-06-07 14:10
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #Vim 

## Neovim&LunarVim

> <https://www.mintimate.cn/2023/01/10/guideForLunarvim/>

### 🍊 要先安装 rg

<https://github.com/BurntSushi/ripgrep>

[Neovim](https://github.com/neovim/neovim)最近几年的热度十分高，甚至我这个 Vim 用户，都开始转向使用 Neovim 了。相比之前使用 Vim（尤其是 Vim7.x 之前，还未使用异步任务时），Neovim 明显更快。同时 Neovim 使用[Lua](https://www.lua.org/)脚本化语言进行配置，确实更加方便。

但是手动配置 Neovim，总归有点麻烦。尤其是刚转向 Neovim，对 Lua 的语法还不是很熟悉的情况下，怎么才能快速配置，让它先跑起来呢？

答案很简单，就是用别人整合好的配置。网上有非常多别人整合好的 GitHub 仓库包，这里介绍一个特殊的项目：[LunarVim](https://www.lunarvim.org/)

通过 LunarVim 的配置，可以让你的 Neovim 瞬间在 Linux 服务器上变身成为 IDE。

### LunarVim

其实，LunarVim 的官网就有总结性的描述：

```
Interstellar Development Experience
The IDE that's too cool for planet Earth.
A stellar Neovim experience.
The universe's most lightweight IDE.
……
Copy
```

[![官网描述](https://imagehost.mintimate.cn/post_guideForLunarvim/lunarvimWebsite.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/lunarvimWebsite.jpg)

[官网描述](https://imagehost.mintimate.cn/post_guideForLunarvim/lunarvimWebsite.jpg)

这个可能是使用 Vim/Neovim，在没有安装插件时候的效果：
[![使用vim或neovim未安装插件](https://imagehost.mintimate.cn/post_guideForLunarvim/lunarvimWebsite.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/lunarvimWebsite.jpg)

[使用 vim 或 neovim 未安装插件](https://imagehost.mintimate.cn/post_guideForLunarvim/lunarvimWebsite.jpg)

这个就是使用 LunarVim 的效果：
[![使用lvim进行编辑](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimEditShell.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimEditShell.jpg)

[使用 lvim 进行编辑](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimEditShell.jpg)

不过，安装起来还是有点麻烦，主要的原因：

- 国内网络环境 GitHub 无法连接问题

本文就尽可能帮大家解决啦。

### 辅助视频

部分东西，还是视频比较清晰。

这里做个视频，主要内容：

- 如何安装 Nvim 和
- 如何卸载 Nvim 和 Lvim
- Lvim 的部分功能展示
- 使用建议

<iframe class="bilibili" src="https://player.bilibili.com/player.html?aid=350280775&amp;bvid=BV1hR4y1Y7CS&amp;cid=966982090&amp;page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="box-sizing: border-box; position: relative; width: 650.125px; height: 40em; max-width: 50em;"></iframe>

嘿嘿，做教程视频不易（B 站根本不会推荐引流），请务必**一键三连**嗷～ B 站视频地址：<https://www.bilibili.com/video/BV1hR4y1Y7CS>

### 支持创作

制作教程不易，如果热心的小伙伴，想支持创作，可以加入我们的「爱发电」电圈：

- Mintimate 的电圈: <https://afdian.net/a/mintimate>

当然，也欢迎在 B 站或 YouTube 上关注我们：

- Bilibili: <https://space.bilibili.com/355567627>
- YouTube: <https://www.youtube.com/@mintimate708/featured>

更多：

- [Mintimate's Blog 关于页面](https://www.mintimate.cn/about)

### 准备工具

其实就是个 Shell 工具，不管是 Linux 还是 macOS 都可以安装。（Windows 的话，就没试过了～～）

> Windwos 的 Neovim，LunarVim 也是支持；但是我用 Windows 很少，就算用…… 我一般也是直接用 Vscode 作为文本编辑。

[![我使用的镜像](https://imagehost.mintimate.cn/post_vimYouCompleteMe/35b7159441ad659a94cfd9bede0be55c.png)](https://imagehost.mintimate.cn/post_vimYouCompleteMe/35b7159441ad659a94cfd9bede0be55c.png)

[我使用的镜像](https://imagehost.mintimate.cn/post_vimYouCompleteMe/35b7159441ad659a94cfd9bede0be55c.png)

如果你并没有 Linux 设备，需要一个 Linux 设备来练手，强烈推荐：

- [腾讯云轻量应用服务器 Lighthouse](https://curl.mintimate.cn/1Hs6oSjemjg)
- [腾讯云轻量应用服务器学生优惠](https://curl.mintimate.cn/1Hs6pWtbEZz)

另外，为大家争取到优惠\*(੭ˊᵕˋ)੭ଘ：

- [本站专属腾讯云秒杀链接（可低价购买轻量应用服务器）](https://curl.mintimate.cn/1Hs6qNOVjJo)

### 安装用户

Lunarvim 是可以给 root 和非 root 用户安装的。但是用 root 用户操作，终归有点不安全。

建议给非 root 用户安装。比如：玩一般会在服务器上创建我自己的用户：

```
# 当前root用户
useradd -s /bin/zsh -m mintimate
# 设置用户密码
passwd mintimate
Copy
```

之后，根据自己喜好，决定是否添加到 sudo 权限内。并切换到用户，进行后续 neovim 和 lunarvim 的安装操作。

### Neovim 安装

首先我们需要安装 Neovim，安装的方法很多：

- 软件包管理器安装
- 软件包安装
- 编译安装

没有说那种方法就最好，但是如果说麻烦…… 还是编译安装麻烦点，但是目前 arm 架构的 Linux，目前只能用编译安装。

好在，编译安装的 Neovim 兼容性最好。

#### 软件包管理器

你可以使用软件包管理器进行安装：

```
# Debian(include Ubuntu)
apt install neovim
# CentOS
yum install neovim
# macOS(需要Homebrew支持)
brew install neovim
Copy
```

[![macOS安装Neovim](https://imagehost.mintimate.cn/post_guideForLunarvim/installNvimByHomebrew.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/installNvimByHomebrew.jpg)

[macOS 安装 Neovim](https://imagehost.mintimate.cn/post_guideForLunarvim/installNvimByHomebrew.jpg)

这样就安装完成了，并且版本是`V0.8.2`：

```
mintimate at MacBookPro in ~
$ nvim --version
NVIM v0.8.2
Build type: Release
LuaJIT 2.1.0-beta3
Compiled by brew@Ventura

Features: +acl +iconv +tui
See ":help feature-compile"

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/usr/local/Cellar/neovim/0.8.2/share/nvim"

Run :checkhealth for more info
Copy
```

[![Neovim版本](https://imagehost.mintimate.cn/post_guideForLunarvim/showVersion_macOS.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/showVersion_macOS.jpg)

[Neovim 版本](https://imagehost.mintimate.cn/post_guideForLunarvim/showVersion_macOS.jpg)

但是，有时候，软件包管理器若安装的 Neovim 版本过低，就需要下载软件包安装或者手动编译安装了。

#### 软件包

当然，有时候软件包管理器安装的 Neovim 过低，我们可以下载软件包安装。[Neovim 发布地址](https://github.com/neovim/neovim/releases)有提供 Debian 和 CentOS 的软件包：
[![Neovim发布包](https://imagehost.mintimate.cn/post_guideForLunarvim/softwarePackage.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/softwarePackage.jpg)

[Neovim 发布包](https://imagehost.mintimate.cn/post_guideForLunarvim/softwarePackage.jpg)

举个例子，我们在腾讯云的 Debian/Ubuntu 发行版本上进行安装：

```
# 下载发行版本
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
# 使用dpkg包管理器安装
dpkg -i nvim-linux64.deb
Copy
```

[![Neovim版本](https://imagehost.mintimate.cn/post_guideForLunarvim/showVersion_Linux.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/showVersion_Linux.jpg)

[Neovim 版本](https://imagehost.mintimate.cn/post_guideForLunarvim/showVersion_Linux.jpg)

当然，不支持 Arm 架构，所以在树莓派上安装是不行的：
[![Neovim安装失败](https://imagehost.mintimate.cn/post_guideForLunarvim/installNeovimFailInRaspberry.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/installNeovimFailInRaspberry.jpg)

[Neovim 安装失败](https://imagehost.mintimate.cn/post_guideForLunarvim/installNeovimFailInRaspberry.jpg)

那么？如何在树莓派上安装呢？

#### 编译安装

上文看到，无法在树莓派上使用软件包管理器或者软件包安装。这里我们就来介绍如何编译安装。

首先，克隆项目，通常我们使用稳定版本：

```
# 克隆项目
git clone https://github.com/neovim/neovim
# 进入项目内
cd neovim
# 切换分支为稳定版本
git checkout stable
Copy
```

[![Neovim项目克隆和切换分支](https://imagehost.mintimate.cn/post_guideForLunarvim/switchBranchToStable.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/switchBranchToStable.jpg)

[Neovim 项目克隆和切换分支](https://imagehost.mintimate.cn/post_guideForLunarvim/switchBranchToStable.jpg)

之后，使用 cmake 进行编译：

```
make CMAKE_BUILD_TYPE=RelWithDebInfo
Copy
```

[![项目cmake编译](https://imagehost.mintimate.cn/post_guideForLunarvim/makeCMAKE_BUILD_TYPE.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/makeCMAKE_BUILD_TYPE.jpg)

[项目 cmake 编译](https://imagehost.mintimate.cn/post_guideForLunarvim/makeCMAKE_BUILD_TYPE.jpg)

之后，使用命令进行安装：

```
sudo make install
Copy
```

[![make install](https://imagehost.mintimate.cn/post_guideForLunarvim/makeInstallInNeovim.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/makeInstallInNeovim.jpg)

[make install](https://imagehost.mintimate.cn/post_guideForLunarvim/makeInstallInNeovim.jpg)

通常情况下，这样就安装完成了：
[![neovim --version](https://imagehost.mintimate.cn/post_guideForLunarvim/neovimVersionRaspberry.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/neovimVersionRaspberry.jpg)

[neovim --version](https://imagehost.mintimate.cn/post_guideForLunarvim/neovimVersionRaspberry.jpg)

> 如果你想卸载 neovim，可以在当前目录下执行：`sudo cmake --build build/ --target uninstall`

### LunarVim 卸载

在安装之前，先教教大家如何卸载。以便在无法使用的情况下或者不需要的情况下，知道如何卸载。

LunarVim 安装不需要 root 权限，并且是对原有的 neovim 进行封装，所以只是会有一些仓库文件。最棒的是，它的安装非常合规：

- `$HOME/.config/lvim`：lvim 的个性化配置文件；
- `$HOME/.local/bin/lvim`：lvim 的执行文件；
- `$HOME/.cache/lvim`：lvim 的缓存目录；
- `$HOME/.config/lvim.old`：可能存在的 lvim 个性化文件备份

[![Lvim的文件](https://imagehost.mintimate.cn/post_guideForLunarvim/rmLvim.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/rmLvim.jpg)

[Lvim 的文件](https://imagehost.mintimate.cn/post_guideForLunarvim/rmLvim.jpg)

所以，卸载 LunarVim：

```
rm -rf ~/.config/lvim ~/.local/share/lunarvim ~/.local/bin/lvim ~/.config/lvim.old
```

这样就卸载好了，大道至简～～～

### LunarVim 安装

安装 Lunarvim 的方法，这里分两种：

- 官方脚本: 官方的脚本，直接安装上最新的 Lunarvim。当时需要连接 GitHub，如果网络环境不佳，建议看看`手动脚本`。
- 手动脚本: 使用 Gitee 替换 LunarVim 的主项目更新地址，但是一些附属的插件和初始化步骤还是会从 GitHub 进行抓取。如果改方法还是卡在初始化，可以下载我预打包的文件进行配合。

#### 官方脚本

我们的网络连接 GitHub 没有问题的话，用官方的脚本还是很方便的：

```
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

```shell
#!/usr/bin/env bash
set -eo pipefail

OS="$(uname -s)"

#Set branch to master unless specified by the user
declare -x LV_BRANCH="${LV_BRANCH:-"master"}"
declare -xr LV_REMOTE="${LV_REMOTE:-lunarvim/lunarvim.git}"
declare -xr INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

declare -xr XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -xr XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -xr XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -xr LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/lunarvim"}"
declare -xr LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/lvim"}"
declare -xr LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-"$XDG_CACHE_HOME/lvim"}"
declare -xr LUNARVIM_BASE_DIR="${LUNARVIM_BASE_DIR:-"$LUNARVIM_RUNTIME_DIR/lvim"}"

declare -xr LUNARVIM_LOG_LEVEL="${LUNARVIM_LOG_LEVEL:-warn}"

declare BASEDIR
BASEDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
BASEDIR="$(dirname -- "$(dirname -- "$BASEDIR")")"
readonly BASEDIR

declare ARGS_LOCAL=0
declare ARGS_OVERWRITE=0
declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1
declare ADDITIONAL_WARNINGS=""

declare -a __lvim_dirs=(
  "$LUNARVIM_CONFIG_DIR"
  "$LUNARVIM_RUNTIME_DIR"
  "$LUNARVIM_CACHE_DIR"
  "$LUNARVIM_BASE_DIR"
)

declare -a __npm_deps=(
  "neovim"
)
# treesitter installed with brew causes conflicts #3738
if ! command -v tree-sitter &>/dev/null; then
  __npm_deps+=("tree-sitter-cli")
fi

declare -a __pip_deps=(
  "pynvim"
)

declare -a __rust_deps=(
  "fd::fd-find"
  "rg::ripgrep"
)

function usage() {
  echo "Usage: install.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                               Print this help message"
  echo "    -l, --local                              Install local copy of LunarVim"
  echo "    -y, --yes                                Disable confirmation prompts (answer yes to all questions)"
  echo "    --overwrite                              Overwrite previous LunarVim configuration (a backup is always performed first)"
  echo "    --[no-]install-dependencies              Whether to automatically install external dependencies (will prompt by default)"
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -l | --local)
        ARGS_LOCAL=1
        ;;
      --overwrite)
        ARGS_OVERWRITE=1
        ;;
      -y | --yes)
        INTERACTIVE_MODE=0
        ;;
      --install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=1
        ;;
      --no-install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=0
        ;;
      -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
  done
}

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function confirm() {
  local question="$1"
  while true; do
    msg "$question"
    read -p "[y]es or [n]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        msg "Please answer [y]es or [n]o."
        ;;
    esac
  done
}

function stringify_array() {
  echo -n "${@}" | sed 's/ /, /'
}

function main() {
  parse_arguments "$@"

  print_logo

  msg "Detecting platform for managing any additional neovim dependencies"
  detect_platform

  check_system_deps

  if [ "$ARGS_INSTALL_DEPENDENCIES" -eq 1 ]; then
    if [ "$INTERACTIVE_MODE" -eq 1 ]; then
      if confirm "Would you like to install LunarVim's NodeJS dependencies: $(stringify_array ${__npm_deps[@]})?"; then
        install_nodejs_deps
      fi
      if confirm "Would you like to install LunarVim's Python dependencies: $(stringify_array ${__pip_deps[@]})?"; then
        install_python_deps
      fi
      if confirm "Would you like to install LunarVim's Rust dependencies: $(stringify_array ${__rust_deps[@]})?"; then
        install_rust_deps
      fi
    else
      install_nodejs_deps
      install_python_deps
      install_rust_deps
    fi
  fi

  remove_old_cache_files

  verify_lvim_dirs

  if [ "$ARGS_LOCAL" -eq 1 ]; then
    link_local_lvim
  else
    clone_lvim
  fi

  setup_lvim

  msg "$ADDITIONAL_WARNINGS"
  msg "Thank you for installing LunarVim!!"
  echo "You can start it by running: $INSTALL_PREFIX/bin/lvim"
  echo "Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts]"
}

function detect_platform() {
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge -tv"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

function print_missing_dep_msg() {
  if [ "$#" -eq 1 ]; then
    echo "[ERROR]: Unable to find dependency [$1]"
    echo "Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL $1"
  else
    local cmds
    cmds=$(for i in "$@"; do echo "$RECOMMEND_INSTALL $i"; done)
    printf "[ERROR]: Unable to find dependencies [%s]" "$@"
    printf "Please install any one of the dependencies and re-run the installer. Try: \n%s\n" "$cmds"
  fi
}

function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.8") | cquit | else | quit | endif'

  # exit with an error if min_version not found
  if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    echo "[ERROR]: LunarVim requires at least Neovim v0.8 or higher"
    exit 1
  fi
}

function verify_core_plugins() {
  msg "Verifying core plugins"
  if ! bash "$LUNARVIM_BASE_DIR/utils/ci/verify_plugins.sh"; then
    echo "[ERROR]: Unable to verify plugins, make sure to manually run ':Lazy sync' when starting lvim for the first time."
    exit 1
  fi
  echo "Verification complete!"
}

function validate_install_prefix() {
  local prefix="$1"
  case $PATH in
    *"$prefix/bin"*)
      return
      ;;
  esac
  local profile="$HOME/.profile"
  test -z "$ZSH_VERSION" && profile="$HOME/.zshenv"
  ADDITIONAL_WARNINGS="[WARN] the folder $prefix/bin is not on PATH, consider adding 'export PATH=$prefix/bin:\$PATH' to your $profile"

  # avoid problems when calling any verify_* function
  export PATH="$prefix/bin:$PATH"
}

function check_system_deps() {

  validate_install_prefix "$INSTALL_PREFIX"

  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
  check_neovim_min_version
}

function __install_nodejs_deps_pnpm() {
  echo "Installing node modules with pnpm.."
  pnpm install -g "${__npm_deps[@]}"
  echo "All NodeJS dependencies are successfully installed"
}

function __install_nodejs_deps_npm() {
  echo "Installing node modules with npm.."
  for dep in "${__npm_deps[@]}"; do
    if ! npm ls -g "$dep" &>/dev/null; then
      printf "installing %s .." "$dep"
      npm install -g "$dep"
    fi
  done

  echo "All NodeJS dependencies are successfully installed"
}

function __install_nodejs_deps_yarn() {
  echo "Installing node modules with yarn.."
  yarn global add "${__npm_deps[@]}"
  echo "All NodeJS dependencies are successfully installed"
}

function __validate_node_installation() {
  local pkg_manager="$1"
  local manager_home

  if ! command -v "$pkg_manager" &>/dev/null; then
    return 1
  fi

  if [ "$pkg_manager" == "npm" ]; then
    manager_home="$(npm config get prefix 2>/dev/null)"
  elif [ "$pkg_manager" == "pnpm" ]; then
    manager_home="$(pnpm config get prefix 2>/dev/null)"
  else
    manager_home="$(yarn global bin 2>/dev/null)"
  fi

  if [ ! -d "$manager_home" ] || [ ! -w "$manager_home" ]; then
    return 1
  fi

  return 0
}

function install_nodejs_deps() {
  local -a pkg_managers=("pnpm" "yarn" "npm")
  for pkg_manager in "${pkg_managers[@]}"; do
    if __validate_node_installation "$pkg_manager"; then
      eval "__install_nodejs_deps_$pkg_manager"
      return
    fi
  done
  echo "[WARN]: skipping installing optional nodejs dependencies due to insufficient permissions."
  echo "check how to solve it: https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally"
}

function install_python_deps() {
  echo "Verifying that pip is available.."
  if ! python3 -m ensurepip >/dev/null; then
    if ! python3 -m pip --version &>/dev/null; then
      echo "[WARN]: skipping installing optional python dependencies"
      return 1
    fi
  fi
  echo "Installing with pip.."
  for dep in "${__pip_deps[@]}"; do
    python3 -m pip install --user "$dep" || return 1
  done
  echo "All Python dependencies are successfully installed"
}

function __attempt_to_install_with_cargo() {
  if command -v cargo &>/dev/null; then
    echo "Installing missing Rust dependency with cargo"
    cargo install "$1"
  else
    echo "[WARN]: Unable to find cargo. Make sure to install it to avoid any problems"
    exit 1
  fi
}

# we try to install the missing one with cargo even though it's unlikely to be found
function install_rust_deps() {
  for dep in "${__rust_deps[@]}"; do
    if ! command -v "${dep%%::*}" &>/dev/null; then
      __attempt_to_install_with_cargo "${dep##*::}"
    fi
  done
  echo "All Rust dependencies are successfully installed"
}

function __backup_dir() {
  local src="$1"
  if [ ! -d "$src" ]; then
    return
  fi
  mkdir -p "$src.old"
  msg "Backing up old $src to $src.old"
  if command -v rsync &>/dev/null; then
    rsync --archive --quiet --backup --partial --copy-links --cvs-exclude "$src"/ "$src.old"
  else
    case "$OS" in
      Darwin)
        cp -R "$src/." "$src.old/."
        ;;
      *)
        cp -r "$src/." "$src.old/."
        ;;
    esac
  fi
}

function verify_lvim_dirs() {
  for dir in "${__lvim_dirs[@]}"; do
    if [ -d "$dir" ]; then
      if [ "$ARGS_OVERWRITE" -eq 0 ]; then
        __backup_dir "$dir"
      fi
      rm -rf "$dir"
    fi
    mkdir -p "$dir"
  done
}

function clone_lvim() {
  msg "Cloning LunarVim configuration"
  if ! git clone --branch "$LV_BRANCH" \
    "https://github.com/${LV_REMOTE}" "$LUNARVIM_BASE_DIR"; then
    echo "Failed to clone repository. Installation failed."
    exit 1
  fi
}

function link_local_lvim() {
  echo "Linking local LunarVim repo"

  # Detect whether it's a symlink or a folder
  if [ -d "$LUNARVIM_BASE_DIR" ]; then
    msg "Moving old files to ${LUNARVIM_BASE_DIR}.old"
    mv "$LUNARVIM_BASE_DIR" "${LUNARVIM_BASE_DIR}".old
  fi

  echo "   - $BASEDIR -> $LUNARVIM_BASE_DIR"
  ln -s -f "$BASEDIR" "$LUNARVIM_BASE_DIR"
}

function setup_shim() {
  make -C "$LUNARVIM_BASE_DIR" install-bin
}

function remove_old_cache_files() {
  local lazy_cache="$LUNARVIM_CACHE_DIR/lazy/cache"
  if [ -e "$lazy_cache" ]; then
    msg "Removing old lazy cache file"
    rm -f "$lazy_cache"
  fi
}

function setup_lvim() {

  msg "Installing LunarVim shim"

  setup_shim

  create_desktop_file

  [ ! -f "$LUNARVIM_CONFIG_DIR/config.lua" ] \
    && cp "$LUNARVIM_BASE_DIR/utils/installer/config.example.lua" "$LUNARVIM_CONFIG_DIR/config.lua"

  echo "Preparing Lazy setup"

  "$INSTALL_PREFIX/bin/lvim" --headless -c 'quitall'

  echo "Lazy setup complete"

  verify_core_plugins
}

function create_desktop_file() {
  # TODO: Any other OSes that use desktop files?
  ([ "$OS" != "Linux" ] || ! command -v xdg-desktop-menu &>/dev/null) && return
  echo "Creating desktop file"

  for d in "$LUNARVIM_BASE_DIR"/utils/desktop/*/; do
    size_folder=$(basename "$d")
    mkdir -p "$XDG_DATA_HOME/icons/hicolor/$size_folder/apps/"
    cp "$LUNARVIM_BASE_DIR/utils/desktop/$size_folder/lvim.svg" "$XDG_DATA_HOME/icons/hicolor/$size_folder/apps"
  done

  xdg-desktop-menu install --novendor "$LUNARVIM_BASE_DIR/utils/desktop/lvim.desktop" || true
}

function print_logo() {
  cat <<'EOF'

      88\                                                   88\
      88 |                                                  \__|
      88 |88\   88\ 888888$\   888888\   888888\ 88\    88\ 88\ 888888\8888\
      88 |88 |  88 |88  __88\  \____88\ 88  __88\\88\  88  |88 |88  _88  _88\
      88 |88 |  88 |88 |  88 | 888888$ |88 |  \__|\88\88  / 88 |88 / 88 / 88 |
      88 |88 |  88 |88 |  88 |88  __88 |88 |       \88$  /  88 |88 | 88 | 88 |
      88 |\888888  |88 |  88 |\888888$ |88 |        \$  /   88 |88 | 88 | 88 |
      \__| \______/ \__|  \__| \_______|\__|         \_/    \__|\__| \__| \__|

EOF
}

main "$@"

```

[![官方脚本安装](https://imagehost.mintimate.cn/post_guideForLunarvim/installLunarvimOfficial.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/installLunarvimOfficial.jpg)

[官方脚本安装](https://imagehost.mintimate.cn/post_guideForLunarvim/installLunarvimOfficial.jpg)

如果网络有问题，正常会有一些报错，比如：无法校验插件完整

```
[ERROR]: Unable to verify plugins, make sure to manually run ':PackerSync' when starting lvim for the first time.
Copy
```

[![无法校验插件](https://imagehost.mintimate.cn/post_guideForLunarvim/unableToVerifyPlugins.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/unableToVerifyPlugins.jpg)

[无法校验插件](https://imagehost.mintimate.cn/post_guideForLunarvim/unableToVerifyPlugins.jpg)

这个解决方法很简单，当时能不能有效，取决于网络能不能连接 GitHub 上插件的各个库。因为造成这样的原因，是 Lunarvim 基于[packer](https://github.com/wbthomason/packer.nvim)进行插件的管理（安装、更新）。而它就是同步下载 GitHub 上各个项目的仓库地址。

如果已经解决网络问题，或者想重新尝试。可以在 Lunarvim 激活时(lvim 命令)，使用 packer 的`:PackerSync`命令进行更新。

首先，使用`lvim`命令进入 Lunarvim，如果实现没有配置环境变量，通常找不到命令：
[![找不到命令](https://imagehost.mintimate.cn/post_guideForLunarvim/commandNotFind.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/commandNotFind.jpg)

[找不到命令](https://imagehost.mintimate.cn/post_guideForLunarvim/commandNotFind.jpg)

我们需要把当前用户“家目录”下的`.local/bin`添加到环境变量：

```
# 如果你使用bash
echo "export PATH=\$PATH:\$HOME.local/bin" >> ~/.zshrc
# 如果你使用zsh
echo "export PATH=\$PATH:\$HOME.local/bin" >> ~/.zshrc
Copy
```

之后，重载环境变量，应该就可以使用`lvim`命令：
[![添加到环境变量](https://imagehost.mintimate.cn/post_guideForLunarvim/addLocalPath.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/addLocalPath.jpg)

[添加到环境变量](https://imagehost.mintimate.cn/post_guideForLunarvim/addLocalPath.jpg)

使用命令：

```
lvim
Copy
```

进入 Luarnvim，会出现错误：
[![lvim错误](https://imagehost.mintimate.cn/post_guideForLunarvim/initErrorInLvim.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/initErrorInLvim.jpg)

[lvim 错误](https://imagehost.mintimate.cn/post_guideForLunarvim/initErrorInLvim.jpg)

这个时候，其实是处于`命令模式`,我们输入：

```
:PackerSync
Copy
```

进行手动初始化（插件拉取载入）：
[![拉去载入](https://imagehost.mintimate.cn/post_guideForLunarvim/restartInit.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/restartInit.jpg)

[拉去载入](https://imagehost.mintimate.cn/post_guideForLunarvim/restartInit.jpg)

嗯…… 如果网络还是无法连接 GitHub……。应该还是一堆的报错：
[![拉取错误](https://imagehost.mintimate.cn/post_guideForLunarvim/fullOfError.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/fullOfError.jpg)

[拉取错误](https://imagehost.mintimate.cn/post_guideForLunarvim/fullOfError.jpg)

这个时候，也不用慌。实在无法解决，可以参考`手动脚本`的下载预编译库进行替换初始化。

#### 手动脚本

首先介绍一下脚本的原理：

- 替换`lunarvim.git`为 Gitee 镜像源。
- 汉化一些步骤提示
- 使用基于 CloudFare 提供的网络 CDN 进行附属仓库的下载(为了不影响后续服务器上 Git，在安装完后，会重置会默认。如果手动终止脚本运行，记得看看下文的恢复 Git 重定向)

安装脚本：

```
bash <(curl -s https://api.host.mintimate.cn/fileHost/public/download/NMAd)
Copy
```

[![安装开始](https://imagehost.mintimate.cn/post_guideForLunarvim/autoShellStart.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/autoShellStart.jpg)

[安装开始](https://imagehost.mintimate.cn/post_guideForLunarvim/autoShellStart.jpg)

[![安装成功](https://imagehost.mintimate.cn/post_guideForLunarvim/autoShellFinish.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/autoShellFinish.jpg)

[安装成功](https://imagehost.mintimate.cn/post_guideForLunarvim/autoShellFinish.jpg)

如果你卡在`启用CloudFare加速`步骤：
[![卡在加速步骤](https://imagehost.mintimate.cn/post_guideForLunarvim/waitingCloudFare.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/waitingCloudFare.jpg)

[卡在加速步骤](https://imagehost.mintimate.cn/post_guideForLunarvim/waitingCloudFare.jpg)

可以按`Ctril+C`终止进程，并**恢复 Git**：

```
git config --global --unset url."https://fast.github.flyinbug.top/mintimate/https://github.com/".insteadOf "https://github.com/"
Copy
```

并使用我提前打包的镜像文件替换自己的文件。

如果觉得有用或者需要帮助，可以联系我哦：

- [支持创作](https://www.mintimate.cn/2023/01/10/guideForLunarvim/#支持创作)

##### 镜像文件替换

如果使用`官方脚本`或者`手动脚本`**出现任何问题**。可以使用我预先安装打包的文件进行替换，没什么特别的，就是：

- 提前克隆所有 LunarVim 所有插件库（共 45 个）
- 打包并上传

我会不定期更新，下载地址：
<https://alist.flyinbug.top/PublicShare/LunarvimStatic/latest>

[![获取镜像文件](https://imagehost.mintimate.cn/post_guideForLunarvim/mirrorFile.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/mirrorFile.jpg)

[获取镜像文件](https://imagehost.mintimate.cn/post_guideForLunarvim/mirrorFile.jpg)

之后，在终端依次执行：

```
# 进入仓库文件存放地址
cd ~/.local/share
# 下载镜像文件
wget -O lunarvim.tar-gz [地址存在Token，请自行复制]
# 删除原本未克隆成功的仓库
rm -rf lunarvim
# 解压文件替换
tar -xf lunarvim.tar-gz
# 归属文件为当前用户
chown -R `whoami`:`whoami` lunarvim
Copy
```

[![获取镜像文件](https://imagehost.mintimate.cn/post_guideForLunarvim/getMirror.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/getMirror.jpg)

[获取镜像文件](https://imagehost.mintimate.cn/post_guideForLunarvim/getMirror.jpg)

之后，编辑文件，如果出现[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)库的**警告**(这个其实是警告，实际上是 LSP 不工作，但是 Lvim 还是可以用的)，比如：
[![nvim-treesitter库的警告](https://imagehost.mintimate.cn/post_guideForLunarvim/needReloadTreesitter.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/needReloadTreesitter.jpg)

[nvim-treesitter 库的警告](https://imagehost.mintimate.cn/post_guideForLunarvim/needReloadTreesitter.jpg)

解决方法很简单啦: 更新 Packer、更新编译器：

```
:PackerSync
:TSUpdate
Copy
```

[![lvim内执行:PackerSync](https://imagehost.mintimate.cn/post_guideForLunarvim/updateByPackerSync.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/updateByPackerSync.jpg)

[lvim 内执行:PackerSync](https://imagehost.mintimate.cn/post_guideForLunarvim/updateByPackerSync.jpg)

[![lvim内执行:TSUpdate](https://imagehost.mintimate.cn/post_guideForLunarvim/updateByTSUpdate.jpg)lvim 内执行:TSUpdate](https://imagehost.mintimate.cn/post_guideForLunarvim/updateByTSUpdate.jpg)

##### Lvim 初始化

现在，我们进行初始化更新。

可以在 Lunarvim 激活时(lvim 命令)，`:LvimUpdate`命令进行更新。

首先，使用`lvim`命令进入 Lunarvim，如果实现没有配置环境变量，通常找不到命令：
[![找不到命令](https://imagehost.mintimate.cn/post_guideForLunarvim/commandNotFind.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/commandNotFind.jpg)

[找不到命令](https://imagehost.mintimate.cn/post_guideForLunarvim/commandNotFind.jpg)

我们需要把当前用户“家目录”下的`.local/bin`添加到环境变量：

```
# 如果你使用bash
echo "export PATH=\$PATH:\$HOME.local/bin" >> ~/.zshrc
# 如果你使用zsh
echo "export PATH=\$PATH:\$HOME.local/bin" >> ~/.zshrc
Copy
```

之后，重载环境变量，应该就可以使用`lvim`命令：
[![添加到环境变量](https://imagehost.mintimate.cn/post_guideForLunarvim/addLocalPath.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/addLocalPath.jpg)

[添加到环境变量](https://imagehost.mintimate.cn/post_guideForLunarvim/addLocalPath.jpg)

更新操作：
[![更新](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimUpdate.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimUpdate.jpg)

[更新](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimUpdate.jpg)

### Lvim 配置文件

现在我们来看看 Lvim(LunarVim)的配置文件：
首先，Lvim 的配置，官方为了不与 Neovim 的配置文件冲突。Lvim 的配置文件为：

- $HOME/.config/lvim/config.lua

配置在原有 neovim 的基础上，增加了 Lvim 的个性化配置。
[![Lvim的配置](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimConfig.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimConfig.jpg)

[Lvim 的配置](https://imagehost.mintimate.cn/post_guideForLunarvim/lvimConfig.jpg)

你可以添加一些 vim 或者 neovim 的配置,比如：

```
vim.opt.backup = false -- 创建配置文件
vim.opt.clipboard = "unnamedplus" -- 允许属于unnamedplus插件，共享系统剪贴板
vim.opt.cmdheight = 2 -- 更多的空间展示neovim的信息（默认：1）
vim.opt.fileencoding = "utf-8" -- 设置UTF-8编码
vim.opt.number = true -- 设置行表
vim.opt.relativenumber = false -- 设置相对行标
vim.opt.scrolloff = 8 -- 设置光标发生滚动的距离值
vim.opt.sidescrolloff = 8 -- 设置光标和边距发生滚动的距离值
Copy
```

当然，还有一些 Lvim 的专属配置，比如：<https://www.lunarvim.org/docs/configuration/keybindings>

### Lvim 使用

简单介绍一下 Lvim 的使用吧。毕竟官方的使用指南是完完整整的一个文档，一篇博客，能简单入门就很不错了。

首先是“文件管理树”：[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

Lvim 默认安装了 nvim-tree 插件，并且使用`<leader>`和`e`键进行绑定（`<leader>`键默认为空格）。

在 Lvim 成功配置的情况下，可以按上述组合键，呼出“文件管理树”，配合鼠标和键盘进一步实现 IDE 的效果：
[![Lvim的tree](https://imagehost.mintimate.cn/post_guideForLunarvim/tree.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/tree.jpg)

[Lvim 的 tree](https://imagehost.mintimate.cn/post_guideForLunarvim/tree.jpg)

其次是内置终端：[ToggleTerm](https://github.com/akinsho/toggleterm.nvim)

使用`Ctrl+4`可以快速呼出：
[![Lvim的toggleterm](https://imagehost.mintimate.cn/post_guideForLunarvim/toggleterm.jpg)](https://imagehost.mintimate.cn/post_guideForLunarvim/toggleterm.jpg)

[Lvim 的 toggleterm](https://imagehost.mintimate.cn/post_guideForLunarvim/toggleterm.jpg)

最后，就是自带的 LSP 了。Lvim 使用[treesitter](https://github.com/nvim-treesitter/nvim-treesitter)进行语法提升并下载支持。

所以在编辑文件，Lvim 就会自动下载，如果不需要或者想自定义，可以关闭配置文件内的：

```
-- treesitter自动下载
lvim.builtin.treesitter.auto_install = true
-- LSP自动下载
lvim.lsp.automatic_servers_installation = true
Copy
```

具体可以参考：<https://www.lunarvim.org/docs/languages>

### Q&A

其实问题基本都是网络问题比较多。目前先留个空白目录吧，到时候看看大家遇到什么问题，做个追加～～

如果小伙伴对 Vim 的基础命令不熟悉，可以参考教程：

- [终端文本编辑神器–Vim 命令详解。如何配置 Vim 以及 Vim 插件？](https://www.mintimate.cn/2021/08/25/vim/)
- [12 分钟入门文本编辑利器 Vim，并学会如何安装 Vim 插件（Windows/macOS/Linux）](https://www.bilibili.com/video/BV1kq4y197t4)

### END

到此，Lvim 和它的“好朋友们”就安装并配置完成了。

你也可以配合 ZSH，获得更好的 Shell 体验：

[![编辑ZSH配置文件](https://imagehost.mintimate.cn/post_vimYouCompleteMe/6c251f8f0728f52c86c5fb46bdb00431.png)](https://imagehost.mintimate.cn/post_vimYouCompleteMe/6c251f8f0728f52c86c5fb46bdb00431.png)

[编辑 ZSH 配置文件](https://imagehost.mintimate.cn/post_vimYouCompleteMe/6c251f8f0728f52c86c5fb46bdb00431.png)

[![ZSH](https://imagehost.mintimate.cn/post_vimYouCompleteMe/ced47f3ecebc263de383aa19b0c0db42.png)](https://imagehost.mintimate.cn/post_vimYouCompleteMe/ced47f3ecebc263de383aa19b0c0db42.png)

[ZSH](https://imagehost.mintimate.cn/post_vimYouCompleteMe/ced47f3ecebc263de383aa19b0c0db42.png)

参考教程：

- [Linux/Mac 通过 Oh-my-zsh 配置 Zsh 插件，让你的终端更加强大且智能](https://www.mintimate.cn/2021/02/05/configZsh/)

---

有些人可能会说，用 Vscode、IDEA 之类的编辑器或者集成开发工具不好么？当然好，而且很方便；但是 Neovim 安装 Lvim，是让你的 neovim 支持更多功能；**有时候，我们可能需要修改 Python 脚本内某些数据，直接在 Lighthouse 服务器上用 Neovim 就可以直接操作，亦或者直接编辑 Nginx 文件，还是挺方便的。**

多一个方法，多条路；可不是让你丢弃开发环境，全部使用 neovim 进行开发哦。

> 这篇文章这么长…… 会不会劝退很多人呢？那就先点赞、收藏，以后再看吧～～～

---

## My lunarvim

### My repositories

<https://github.com/desonglll/lvim>

```shell
git@github.com:desonglll/lvim.git
```

Clone my settings

```shell
rm -rf lvim
git clone git@github.com:desonglll/lvim.git
```

### Install

#### [Prerequisites](https://www.lunarvim.org/docs/installation#prerequisites)

- Make sure you have installed the latest version of [`Neovim v0.8.0+`](https://github.com/neovim/neovim/releases/latest).
- Have [`git`](https://cli.github.com/), [`make`](https://www.gnu.org/software/make/), [`pip`](https://pypi.org/project/pip/), [`python`](https://www.python.org/) [`npm`](https://npmjs.com/), [`node`](https://nodejs.org/) and [`cargo`](https://www.rust-lang.org/tools/install) installed on your system.
- [Resolve `EACCES` permissions when installing packages globally](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally) to avoid error when installing packages with npm.
- [`PowerShell 7+`](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2) (for Windows)

#### [Installation scripts](https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)

`bash install.sh`

```bash
#!/usr/bin/env bash
set -eo pipefail

OS="$(uname -s)"

#Set branch to master unless specified by the user
declare -x LV_BRANCH="${LV_BRANCH:-"master"}"
declare -xr LV_REMOTE="${LV_REMOTE:-lunarvim/lunarvim.git}"
declare -xr INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

declare -xr XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -xr XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -xr XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -xr LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/lunarvim"}"
declare -xr LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/lvim"}"
declare -xr LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-"$XDG_CACHE_HOME/lvim"}"
declare -xr LUNARVIM_BASE_DIR="${LUNARVIM_BASE_DIR:-"$LUNARVIM_RUNTIME_DIR/lvim"}"

declare -xr LUNARVIM_LOG_LEVEL="${LUNARVIM_LOG_LEVEL:-warn}"

declare BASEDIR
BASEDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
BASEDIR="$(dirname -- "$(dirname -- "$BASEDIR")")"
readonly BASEDIR

declare ARGS_LOCAL=0
declare ARGS_OVERWRITE=0
declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1
declare ADDITIONAL_WARNINGS=""

declare -a __lvim_dirs=(
  "$LUNARVIM_CONFIG_DIR"
  "$LUNARVIM_RUNTIME_DIR"
  "$LUNARVIM_CACHE_DIR"
  "$LUNARVIM_BASE_DIR"
)

declare -a __npm_deps=(
  "neovim"
)
# treesitter installed with brew causes conflicts #3738
if ! command -v tree-sitter &>/dev/null; then
  __npm_deps+=("tree-sitter-cli")
fi

declare -a __pip_deps=(
  "pynvim"
)

declare -a __rust_deps=(
  "fd::fd-find"
  "rg::ripgrep"
)

function usage() {
  echo "Usage: install.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                               Print this help message"
  echo "    -l, --local                              Install local copy of LunarVim"
  echo "    -y, --yes                                Disable confirmation prompts (answer yes to all questions)"
  echo "    --overwrite                              Overwrite previous LunarVim configuration (a backup is always performed first)"
  echo "    --[no-]install-dependencies              Whether to automatically install external dependencies (will prompt by default)"
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -l | --local)
        ARGS_LOCAL=1
        ;;
      --overwrite)
        ARGS_OVERWRITE=1
        ;;
      -y | --yes)
        INTERACTIVE_MODE=0
        ;;
      --install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=1
        ;;
      --no-install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=0
        ;;
      -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
  done
}

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function confirm() {
  local question="$1"
  while true; do
    msg "$question"
    read -p "[y]es or [n]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        msg "Please answer [y]es or [n]o."
        ;;
    esac
  done
}

function stringify_array() {
  echo -n "${@}" | sed 's/ /, /'
}

function main() {
  parse_arguments "$@"

  print_logo

  msg "Detecting platform for managing any additional neovim dependencies"
  detect_platform

  check_system_deps

  if [ "$ARGS_INSTALL_DEPENDENCIES" -eq 1 ]; then
    if [ "$INTERACTIVE_MODE" -eq 1 ]; then
      if confirm "Would you like to install LunarVim's NodeJS dependencies: $(stringify_array ${__npm_deps[@]})?"; then
        install_nodejs_deps
      fi
      if confirm "Would you like to install LunarVim's Python dependencies: $(stringify_array ${__pip_deps[@]})?"; then
        install_python_deps
      fi
      if confirm "Would you like to install LunarVim's Rust dependencies: $(stringify_array ${__rust_deps[@]})?"; then
        install_rust_deps
      fi
    else
      install_nodejs_deps
      install_python_deps
      install_rust_deps
    fi
  fi

  remove_old_cache_files

  verify_lvim_dirs

  if [ "$ARGS_LOCAL" -eq 1 ]; then
    link_local_lvim
  else
    clone_lvim
  fi

  setup_lvim

  msg "$ADDITIONAL_WARNINGS"
  msg "Thank you for installing LunarVim!!"
  echo "You can start it by running: $INSTALL_PREFIX/bin/lvim"
  echo "Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts]"
}

function detect_platform() {
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge -tv"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

function print_missing_dep_msg() {
  if [ "$#" -eq 1 ]; then
    echo "[ERROR]: Unable to find dependency [$1]"
    echo "Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL $1"
  else
    local cmds
    cmds=$(for i in "$@"; do echo "$RECOMMEND_INSTALL $i"; done)
    printf "[ERROR]: Unable to find dependencies [%s]" "$@"
    printf "Please install any one of the dependencies and re-run the installer. Try: \n%s\n" "$cmds"
  fi
}

function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.8") | cquit | else | quit | endif'

  # exit with an error if min_version not found
  if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    echo "[ERROR]: LunarVim requires at least Neovim v0.8 or higher"
    exit 1
  fi
}

function verify_core_plugins() {
  msg "Verifying core plugins"
  if ! bash "$LUNARVIM_BASE_DIR/utils/ci/verify_plugins.sh"; then
    echo "[ERROR]: Unable to verify plugins, make sure to manually run ':Lazy sync' when starting lvim for the first time."
    exit 1
  fi
  echo "Verification complete!"
}

function validate_install_prefix() {
  local prefix="$1"
  case $PATH in
    *"$prefix/bin"*)
      return
      ;;
  esac
  local profile="$HOME/.profile"
  test -z "$ZSH_VERSION" && profile="$HOME/.zshenv"
  ADDITIONAL_WARNINGS="[WARN] the folder $prefix/bin is not on PATH, consider adding 'export PATH=$prefix/bin:\$PATH' to your $profile"

  # avoid problems when calling any verify_* function
  export PATH="$prefix/bin:$PATH"
}

function check_system_deps() {

  validate_install_prefix "$INSTALL_PREFIX"

  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
  check_neovim_min_version
}

function __install_nodejs_deps_pnpm() {
  echo "Installing node modules with pnpm.."
  pnpm install -g "${__npm_deps[@]}"
  echo "All NodeJS dependencies are successfully installed"
}

function __install_nodejs_deps_npm() {
  echo "Installing node modules with npm.."
  for dep in "${__npm_deps[@]}"; do
    if ! npm ls -g "$dep" &>/dev/null; then
      printf "installing %s .." "$dep"
      npm install -g "$dep"
    fi
  done

  echo "All NodeJS dependencies are successfully installed"
}

function __install_nodejs_deps_yarn() {
  echo "Installing node modules with yarn.."
  yarn global add "${__npm_deps[@]}"
  echo "All NodeJS dependencies are successfully installed"
}

function __validate_node_installation() {
  local pkg_manager="$1"
  local manager_home

  if ! command -v "$pkg_manager" &>/dev/null; then
    return 1
  fi

  if [ "$pkg_manager" == "npm" ]; then
    manager_home="$(npm config get prefix 2>/dev/null)"
  elif [ "$pkg_manager" == "pnpm" ]; then
    manager_home="$(pnpm config get prefix 2>/dev/null)"
  else
    manager_home="$(yarn global bin 2>/dev/null)"
  fi

  if [ ! -d "$manager_home" ] || [ ! -w "$manager_home" ]; then
    return 1
  fi

  return 0
}

function install_nodejs_deps() {
  local -a pkg_managers=("pnpm" "yarn" "npm")
  for pkg_manager in "${pkg_managers[@]}"; do
    if __validate_node_installation "$pkg_manager"; then
      eval "__install_nodejs_deps_$pkg_manager"
      return
    fi
  done
  echo "[WARN]: skipping installing optional nodejs dependencies due to insufficient permissions."
  echo "check how to solve it: https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally"
}

function install_python_deps() {
  echo "Verifying that pip is available.."
  if ! python3 -m ensurepip >/dev/null; then
    if ! python3 -m pip --version &>/dev/null; then
      echo "[WARN]: skipping installing optional python dependencies"
      return 1
    fi
  fi
  echo "Installing with pip.."
  for dep in "${__pip_deps[@]}"; do
    python3 -m pip install --user "$dep" || return 1
  done
  echo "All Python dependencies are successfully installed"
}

function __attempt_to_install_with_cargo() {
  if command -v cargo &>/dev/null; then
    echo "Installing missing Rust dependency with cargo"
    cargo install "$1"
  else
    echo "[WARN]: Unable to find cargo. Make sure to install it to avoid any problems"
    exit 1
  fi
}

# we try to install the missing one with cargo even though it's unlikely to be found
function install_rust_deps() {
  for dep in "${__rust_deps[@]}"; do
    if ! command -v "${dep%%::*}" &>/dev/null; then
      __attempt_to_install_with_cargo "${dep##*::}"
    fi
  done
  echo "All Rust dependencies are successfully installed"
}

function __backup_dir() {
  local src="$1"
  if [ ! -d "$src" ]; then
    return
  fi
  mkdir -p "$src.old"
  msg "Backing up old $src to $src.old"
  if command -v rsync &>/dev/null; then
    rsync --archive --quiet --backup --partial --copy-links --cvs-exclude "$src"/ "$src.old"
  else
    case "$OS" in
      Darwin)
        cp -R "$src/." "$src.old/."
        ;;
      *)
        cp -r "$src/." "$src.old/."
        ;;
    esac
  fi
}

function verify_lvim_dirs() {
  for dir in "${__lvim_dirs[@]}"; do
    if [ -d "$dir" ]; then
      if [ "$ARGS_OVERWRITE" -eq 0 ]; then
        __backup_dir "$dir"
      fi
      rm -rf "$dir"
    fi
    mkdir -p "$dir"
  done
}

function clone_lvim() {
  msg "Cloning LunarVim configuration"
  if ! git clone --branch "$LV_BRANCH" \
    "https://github.com/${LV_REMOTE}" "$LUNARVIM_BASE_DIR"; then
    echo "Failed to clone repository. Installation failed."
    exit 1
  fi
}

function link_local_lvim() {
  echo "Linking local LunarVim repo"

  # Detect whether it's a symlink or a folder
  if [ -d "$LUNARVIM_BASE_DIR" ]; then
    msg "Moving old files to ${LUNARVIM_BASE_DIR}.old"
    mv "$LUNARVIM_BASE_DIR" "${LUNARVIM_BASE_DIR}".old
  fi

  echo "   - $BASEDIR -> $LUNARVIM_BASE_DIR"
  ln -s -f "$BASEDIR" "$LUNARVIM_BASE_DIR"
}

function setup_shim() {
  make -C "$LUNARVIM_BASE_DIR" install-bin
}

function remove_old_cache_files() {
  local lazy_cache="$LUNARVIM_CACHE_DIR/lazy/cache"
  if [ -e "$lazy_cache" ]; then
    msg "Removing old lazy cache file"
    rm -f "$lazy_cache"
  fi
}

function setup_lvim() {

  msg "Installing LunarVim shim"

  setup_shim

  create_desktop_file

  [ ! -f "$LUNARVIM_CONFIG_DIR/config.lua" ] \
    && cp "$LUNARVIM_BASE_DIR/utils/installer/config.example.lua" "$LUNARVIM_CONFIG_DIR/config.lua"

  echo "Preparing Lazy setup"

  "$INSTALL_PREFIX/bin/lvim" --headless -c 'quitall'

  echo "Lazy setup complete"

  verify_core_plugins
}

function create_desktop_file() {
  # TODO: Any other OSes that use desktop files?
  ([ "$OS" != "Linux" ] || ! command -v xdg-desktop-menu &>/dev/null) && return
  echo "Creating desktop file"

  for d in "$LUNARVIM_BASE_DIR"/utils/desktop/*/; do
    size_folder=$(basename "$d")
    mkdir -p "$XDG_DATA_HOME/icons/hicolor/$size_folder/apps/"
    cp "$LUNARVIM_BASE_DIR/utils/desktop/$size_folder/lvim.svg" "$XDG_DATA_HOME/icons/hicolor/$size_folder/apps"
  done

  xdg-desktop-menu install --novendor "$LUNARVIM_BASE_DIR/utils/desktop/lvim.desktop" || true
}

function print_logo() {
  cat <<'EOF'

      88\                                                   88\
      88 |                                                  \__|
      88 |88\   88\ 888888$\   888888\   888888\ 88\    88\ 88\ 888888\8888\
      88 |88 |  88 |88  __88\  \____88\ 88  __88\\88\  88  |88 |88  _88  _88\
      88 |88 |  88 |88 |  88 | 888888$ |88 |  \__|\88\88  / 88 |88 / 88 / 88 |
      88 |88 |  88 |88 |  88 |88  __88 |88 |       \88$  /  88 |88 | 88 | 88 |
      88 |\888888  |88 |  88 |\888888$ |88 |        \$  /   88 |88 | 88 | 88 |
      \__| \______/ \__|  \__| \_______|\__|         \_/    \__|\__| \__| \__|

EOF
}

main "$@"
```

#### After installation

##### Add a alia name

```
/Users/mikeshinoda/.local/bin/lvim
```

##### Install ripgrep

<https://github.com/BurntSushi/ripgrep>

```shell
brew install ripgrep
```

### Uninstall

```bash
bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh
```

or

```bash
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
```
