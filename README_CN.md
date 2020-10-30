语言: [英][Readme] 中

[Readme]: ./README.md

# 开放文档

[![texlive version][]](https://tug.org/texlive/) [![license][]](./LICENSE_CN)

[texlive version]: https://img.shields.io/badge/texlive-v2020-blue
[license]: https://img.shields.io/badge/license-CC%20BY--NC--SA%204.0-blue

## 介绍
一个关于我本人写作、学习笔记和翻译文档的仓库。

> ⛛ 可能是一个包罗万象（误(ಡωಡ)）的文档仓库。

## 目录
- [背景](#背景)
- [用法](#用法)
  - [本 Repo 中各项目文件存储格式](#本-Repo-中各项目文件存储格式)
  - [获取 PDF 电子文档](#获取-PDF-电子文档)
  - [使用 LaTex 源代码编译生成电子文档](#使用-LaTex-源代码编译生成电子文档)
    - [准备工作](#准备工作)
    - [编译流程](#编译流程)
- [文档项目分类项](#文档项目分类项)
  - [文章](#文章)
  - [书籍](#书籍)
  - [学习笔记](#学习笔记)
  - [翻译](#翻译)
- [为何不用 synonly 和 markdown 宏包](#为何不用-synonly-和-markdown-宏包)
- [作者](#作者)

## 背景
本人涉猎广泛，起初是想着做学习笔记以便日后复盘，但随着自己博客计划的扩展，这个仓库的想法逐渐成形，慢慢地形成了*书籍*，*翻译*等诸多分类的结构。换而言之，这只是一个关于个人学习记录的文档仓库。

*注：博客一般会有相对应文档项目的文章，但所有文档的更新都是以 GitHub 仓库优先。*

## 本仓库的文件结构
单个文档项目本身由一个含有 PDF 电子文档及其 LaTeX 源码的文件夹组成，均有其父分类。文件夹的名称就是该项目的名称，主文件名一般与文档项目名一致，即 PDF 电子文档和 LaTeX 源码主文件的文件名与文件夹名称相同。

例如名为 ToggleLanguage 文件夹的项目名称就是 ToggleLanguage，位于名为 Articles 的父文件夹下。其 PDF 电子文档和 LaTeX 源码的文件名均为 ToggleLanuage。目录结构如下：
```
|-- Articles
    |-- ToggleLanguage
        |-- resources
            |-- images
        |-- ToggleLanguage.pdf
        |-- ToggleLanguage.tex
```

## 用法
本仓库只提供电子格式（PDF）及其源码（LaTeX）。

### 获取 PDF 电子文档
PDF 电子文档直接存放在各个文档项目文件夹根目录下，PDF 和文件夹同名，直接下载即可。

***P.S. 安装浏览器插件 GitZip，可下载仓库中单个文件夹或者单个文件，而无需下载整个仓库。***

### 由 LaTeX 源代码编译生成电子文档
**不熟悉 LaTeX 语法的话，不推荐使用此方法**

从仓库获取文档项目所需的 LaTeX 源码后，利用编译程序编译生成 PDF 等电子格式。本人的工作流是 [VS Code][] + [LaTeXWorkshop][] + [TeX Live][]。

**编译前的准备工作：**
- 准备好编译程序，例如 [TeX Live][]。
- 安装好[思源字体][]（思源西文字体均采用 OTF 格式，思源中文字体采用 Language-specific OTFs 中的 SC 版本）。
  - Source Serif Pro
  - Source Sans Pro
  - Source Code Pro
  - Source Han Serif
  - Source Han Sans
- 安装下列 [SIL 字体][]中的一个（当前文类模板使用的是 Gentium Plus 字体）
  - Doulos SIL
  - Charis SIL
  - Gentium Plus

**编译流程：**
1. 下载文档项目所需的 LaTeX 源码。
2. 下载公共源码文件夹「PublicResources」。
3. 按文档目录结构存放好（若是克隆整个仓库，则无需此步操作）
4. 使用 Tex 引擎编译文档。

[TeX Live]: https://tug.org/texlive
[VS Code]: https://code.visualstudio.com
[LaTeXWorkshop]: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop#review-details
[思源字体]: https://github.com/adobe-fonts
[SIL 字体]: https://software.sil.org/fonts/

## 文档项目分类项
[跳转文档项目分类页][]

### 文章
此类别记录了本人的小篇幅著作。详细文档列表请看分类介绍。[跳转文章仓库页][]

### 书籍
此类别记录了本人的大篇幅著作。详细文档列表请看分类介绍。[跳转书籍仓库页][]

### 学习笔记
此类别记录了本人的学习笔记。详细文档列表请看分类介绍。[跳转学习笔记仓库页][]

### 翻译
此类别记录了本人翻译的文档。详细文档列表请看分类介绍。[跳转翻译仓库页][]

[跳转文档项目分类页]: ./
[跳转文章仓库页]: ./Articles
[跳转书籍仓库页]: ./Books
[跳转学习笔记仓库页]: ./LearningNotes
[跳转翻译仓库页]: ./Translations

## 几点说明
### 新模板文类的更新说明
- 使用文类替代导言区设置：使用 CLS 文件编写 LaTeX 的文类。
- 进一步精简：新模板文类沿袭旧模板中相对路径的思路，将其应用于所有重复性文件，做到最大程度精简仓库的冗余文件（旧模板只是部分精简）。
- 取消子文件编译功能：对于新模板文类，因 Tex 底层命令 if 条件语句判断功能暂没想到好的方案解决，故抛弃了旧模板的子文件编译功能。
- 使用编译命令参数替代 synonly 宏包：使用编译命令参数实现快速编译检查语法的功能，删除 synonly 宏包的设置和命令。

### 工作流的子文件编译功能
在当前 [VS Code][] + [LaTeXWorkshop][] + [TeX Live][] 的工作流上，直接编译子文件时，LaTeXWorkshop 会自动寻找主文件，并非一定需要编译主文件。

### 使用 [Pandoc][] 转换格式的几点问题
本仓库的 LaTeX 源码有不少底层的复杂代码，因此使用 [Pandoc][] 转换成其他格式（如 md，docx）的效果可能与原排版效果有出入。同时，因复杂的代码和使用自定义模板文类的缘故，可能会导致 Pandoc 转换失败。

### 为何不用 markdown 宏包
markdown 宏包貌似不支持 TeX 命令拓展，因此暂不予考虑。并且，在使用新模板文类进行文档结构优化之后，目前编写文档的工作流也很简便。

[Pandoc]: https://pandoc.org

## 作者
**开放文档** © Mr. Kin，所有文件，除个人设计创作的图像（如 logo 等）和相关的视频创作及其他特别声明外，均采用 [知识共享 署名—非商业性使用—相同方式共享 4.0][] 许可协议进行发布。

由 Mr. Kin 著作并维护。

*注：若想对本作品进行转载、引用亦或是进行二次创作时，请详细阅读上述相关协议内容（若不理解，请点击链接跳转阅读）。为保障本人权利，对于违反者，本人将依法予以处理！望周知！ —— Mr. Kin*

![微信公众号](./PublicResources/images/FollowMe/WechatOfficialAccounts.png)

> [博客][] · [Github][] · [微博][] · [知乎][] · [B站][] · [优酷][] · [头条][] · [油管][]

[知识共享 署名—非商业性使用—相同方式共享 4.0]: ./LICENSE_CN
[博客]: https://mister-kin.github.io
[Github]: https://github.com/mister-kin
[微博]: https://weibo.com/6270111192/profile?topnav=1&wvr=6&is_all=1
[知乎]: https://www.zhihu.com/people/drwu-94
[B站]: http://space.bilibili.com/17025250?
[优酷]: http://i.youku.com/i/UNjA3MTk5Mjgw?spm=a2hzp.8253869.0.0
[油管]: https://www.youtube.com/channel/UCNhtdG6whC5mlRDkrhQ0wLA?view_as=public
[头条]: https://www.toutiao.com/c/user/835254071079053/#mid=1663279303982091
