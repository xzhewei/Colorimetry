

Colorimetry Version 0.0.1
===

此工具包主要实现了基本的色度学计算函数，如计算色坐标、相关色温、显色指数、色差等等。代码结构如下：

- data 实现色度计算的基本数据
  - source 一些光源的光谱数据
  - txt        色度学计算必须参数、CIE标准照明光源数据、CRI、CQS、MCC标准色彩样品数据
- io      实现data中数据的读写函数
- script 一些示例脚本
- test    测试脚本，验证工具包计算正确性
- uitl     色度学计算函数

大部分函数功能可以通过函数名进行判断，另外test中的测试脚本具有一定借鉴，后面文档会逐步完善。

欢迎提交bug和pull request。

Copyright 2016 Zhewei Xu.         [xzhewei-at-gmail.com]