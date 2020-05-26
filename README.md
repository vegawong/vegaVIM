# vimConfig

vega 自用 vim 配置折腾，比较适用于前端开发

## 配置步骤

> 注意：该配置目前适用于 neovim，并在 MacOS 环境下安装测试过，其他平台可能出现不完全支持

1. 安装 neovim

```
$ brew install neovim
```

或参考`neovim`官网安装说明

[https://github.com/neovim/neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

2. 安装配置

```
$ curl -o- https://raw.githubusercontent.com/vegawong/vegaVIM/master/install.sh | bash
```

或者

```
$ wget -qO- https://raw.githubusercontent.com/vegawong/vegaVIM/master/install.sh | bash
```

3. 环境要求

- nodejs

  ```
  $ npm i -g neovim
  ```

- typescript

  ```bash
  $ npm i -g typescript
  ```

- python2

  ```
  $ brew intall python@2
  $ sudo pip2 install pynvim
  ```

- python3

  ```
  $ brew install python3
  $ sudo pip3 install --upgrade pynvim
  ```

- rg

  ```
  $ brew install ripgrep
  ```

- powerline-fonts
  [https://github.com/powerline/fonts](https://github.com/powerline/fonts)

- nerd-fonts
  [https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts](https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts)

## 快捷键

| 模式 | 快捷键 | 说明 |
| --- | --- | --- |
| I | `<C-b>` | 光标后退 |  
| I | `<C-f>` | 光标前进 |
| N, V | `YY` | 复制当前内容到系统粘贴板 |
| N | `,p` | 粘贴系统粘贴板的内容到当前光标 |
| N, V | `XX` | 切切当前内容到系统粘贴板 |
| N | `dd` | 替换原生dd，当时不占用寄存器（不能粘贴）|
| N | `ci` | 替换原生ci，不占用寄存器（不能粘贴）|  
| N | `[c` | 跳转到上一个警告 |
| N | `]c` | 跳转到下一个警告 |
| N | `gd` | 跳转到定义 | 
| N | `gy` | 跳转到类型定义 |
| N | `gi` | 跳转到实现的地方 |
| N | `gr` | 跳转到引用的地方 |
| N | `,rn` | 变量重命名 | 
| N | `K` | 展示文档说明 |
| N | `,f` | 快速打开文件，速记files |
| N | `,fg` | grep全局搜索，速记find grep | 
| N | `,b` | buffer列表， 速记buffers | 
| N | `,<C-f>` | 代码格式化 |
| N | `,fl` | 切换显示文件管理器, 速记file list`
| N | `,fll` | 快速定位当前buffer的文件管理器所在位置, 速记file list location |


## 文件管理器快捷键

| 快捷键 | 说明 |
| --- | --- |
| `<CR>` | 展开收起目录/打开文件 |
| `ad` | 新增目录 |
| `af` | 新增文件 |
| `rn` | 重命名 |
| `dd` | 删除 |
| `mv` | 剪切 |
| `cp` | 复制 |
| `p` | 粘贴 |