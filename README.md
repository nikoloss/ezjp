### EZJP -- Easy Jump@v1.0


#### 1.安装/Install
via http
```bash
$/>sh -c "git clone https://github.com/nikoloss/ezjp.git;cd ezjp&&./install.sh"
```
via ssh
```bash
$/>sh -c "git clone git@github.com:nikoloss/ezjp.git;cd ezjp&&./install.sh"
```

#### 2.重启终端加载函数/Restart your terminal
#### 3.跳到环境/Jump to Env
```bash
$/>ezjp mydev
```
#### 4.自动提示/Auto completion
```bash
$/>ezjp [TAB]
x86dev armdev x86pub armpub
```
使用tab键

#### 5.ssh配置/ssh configurations
在$EZJP_HOME/h下面，代表了不同环境的登录
```
#host		port	user		passwd
10.10.10.10	36000	root		ihatecpp    #跳板机
11.11.11.11	36000	root		ihatecpp    #ecs or cvm?
```
每一行代表一次ssh连接，可支持无限层跳跃


#### 6. 卸载/Uninstall
如果你使用zsh，则编辑~/.zshrc。如果使用的bash则编辑~/.bash_profile。把其中关于EZJP的加载语句删除
```
export EZJP_HOME="/Users/luigiluo/.oh-my-jp"
. /Users/luigiluo/.oh-my-jp/rc/ezjp.rc
```
然后删除目录即可完全卸载