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

- powerline-fonts
  [https://github.com/powerline/fonts](https://github.com/powerline/fonts)
