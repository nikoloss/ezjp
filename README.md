
# EZJP - Easy Jump

[English](#english) | [中文](#中文-ezjp--easy-jump)

## English

`EZJP` is a tool designed to simplify multi-layer SSH jump server login processes. With simple commands and auto-completion, you can quickly switch between various predefined environments without repeatedly typing cumbersome SSH commands or passwords.

### Features

- **Easy Installation**: Install effortlessly using a single script.
- **Auto Completion**: Press `TAB` after typing `ezjp` to list available predefined environments.
- **Multi-layer SSH Jumping**: Supports defining multi-layer SSH jumps in a single configuration file, allowing quick access from a jump server to the final target server.
- **Automatic Update Check**: Detects updates on startup and prompts for upgrading.
- **Multi Shell Support**: Compatible with common shell environments like `bash` and `zsh`.

### Installation

#### Install via HTTP

```bash
sh -c "git clone https://github.com/nikoloss/ezjp.git; cd ezjp && ./install.sh"
```

#### Install via SSH

```bash
sh -c "git clone git@github.com:nikoloss/ezjp.git; cd ezjp && ./install.sh"
```

After installation, restart your terminal to load the necessary environment variables and auto-completion configurations.

### Usage

#### Jump to a Predefined Environment

Enter `ezjp` followed by your environment name in the terminal. For example:

```bash
ezjp mydev
```

`EZJP` will automatically SSH into the corresponding server(s) based on your predefined SSH path (supports multi-layer jumps if configured).

#### Auto Completion

After typing `ezjp`, press the `TAB` key to auto-complete available environment names defined in the `$EZJP_HOME/h` directory. For example:

```bash
ezjp [TAB]
# Possible options:
x86dev armdev x86pub armpub
```

### SSH Configuration Example

Each file in the `$EZJP_HOME/h` directory represents an environment configuration. Each line within these files defines an SSH jump in the following format:

```
#host         port    user    passwd
10.10.10.10   36000   root    ihatecpp    # Jump Server
11.11.11.11   36000   root    ihatecpp    # Target Server (e.g., ECS or CVM)
```

`EZJP` will initiate SSH connections starting from the first line, proceeding through each defined jump until reaching the final specified server.

### Automatic Update

When executing `ezjp`, the script checks for remote updates. If a new version is found, it will prompt you to update. Selecting `y` will perform an automatic `git pull` to update the tool.

### Uninstall

To uninstall, first edit your shell configuration file:

- **For `bash` users**: Edit `~/.bash_profile`
- **For `zsh` users**: Edit `~/.zshrc`

Remove the lines related to `EZJP`:

```bash
export EZJP_HOME="/Users/luigiluo/.oh-my-jp" && . /Users/luigiluo/.oh-my-jp/rc/ezjp.rc
```

Then, delete the entire `ezjp` project directory to complete the uninstallation.


---

## 中文 ezjp -- Easy Jump

`EZJP` 是一个旨在简化多层 SSH 跳板机登录流程的工具。通过简单的命令和自动补全，你可以快速地在各种预定义环境之间跳转，无需频繁输入繁琐的 SSH 命令或密码。

### 特性 Highlights

- **简单安装**：通过一键脚本轻松安装。  
- **自动补全**：输入 `ezjp` 后按下 `TAB` 键即可列出已有的预配置环境。  
- **多层 SSH 跳转**：支持在一条配置文件中定义多层 SSH 跳转，让你能快速从一个跳板机直通至最终服务器。  
- **自动更新检测**：启动时可检测更新并选择是否升级。  
- **多 Shell 支持**：兼容 `bash` 和 `zsh` 等常见 Shell 环境。

### 安装 Installation

#### 使用 HTTP 安装

```bash
sh -c "git clone https://github.com/nikoloss/ezjp.git; cd ezjp && ./install.sh"
```

#### 使用 SSH 安装

```bash
sh -c "git clone git@github.com:nikoloss/ezjp.git; cd ezjp && ./install.sh"
```

安装完成后，请重启终端，以便加载相关环境变量和自动补全配置。

### 使用方法 Usage

#### 跳转到预定义环境

在终端中输入 `ezjp` 加上你的环境名称。例如：

```bash
ezjp mydev
```

此时 `ezjp` 将按照预定义的 SSH 路径自动登陆对应服务器（若包含多层跳板，则将按照预先配置好的步骤逐层跳转）。

#### 自动补全

在输入 `ezjp` 后按下 `TAB` 键，将自动补全你在 `$EZJP_HOME/h` 目录下定义的可用环境名称。例如：

```bash
ezjp [TAB]
# 可能会列出以下选项：
x86dev armdev x86pub armpub
```

### SSH 配置示例

在 `$EZJP_HOME/h` 目录下的每个文件代表一种环境配置。文件中的每一行表示一次 SSH 跳转，格式如下：

```
#host         port    user    passwd
10.10.10.10   36000   root    ihatecpp    # 跳板机
11.11.11.11   36000   root    ihatecpp    # 目标机器（例如 ECS 或 CVM）
```

`EZJP` 将从第一行开始逐层 SSH 登录，直至到达最后一台指定机器。

### 自动更新

在执行 `ezjp` 时，脚本会检测是否有远程更新。当发现有新版本时，会询问用户是否更新。选择 `y` 即可完成自动 `git pull` 更新。

### 卸载 Uninstall

若需卸载，首先编辑你的 Shell 配置文件：  
- 使用 `bash` 用户请编辑 `~/.bash_profile`，删除其中关于 `EZJP` 的导出和加载配置。  
- 使用 `zsh` 用户请编辑 `~/.zshrc`，删除其中关于 `EZJP` 的导出和加载配置。

例如，删除如下行：

```bash
export EZJP_HOME="/Users/luigiluo/.oh-my-jp" && . /Users/luigiluo/.oh-my-jp/rc/ezjp.rc
```

然后删除整个 `ezjp` 项目目录，即可完成完全卸载。


