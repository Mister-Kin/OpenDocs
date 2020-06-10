<div class="align-right">
语言:
<a href="./README.md">英</a>
中
</div>

# 开放文档

> ⛛ 包罗万象（误(ಡωಡ)）的文档仓库。

[![Texlive Version](https://img.shields.io/badge/texlive-v2020-blue)](https://tug.org/texlive/) [![license](https://img.shields.io/badge/license-CC%20BY--NC--SA%204.0-blue)](./LICENSE_CN)

## 介绍
一个关于我本人写作、学习笔记和翻译文档的仓库。

## 目录
- [背景](#背景)
- [用法](#用法)
  - [本repo各项目文件存储格式](#本repo各项目文件存储格式)
  - [获取PDF电子文档](#获取PDF电子文档)
  - [使用Tex源代码编译生成电子文档](#使用Tex源代码编译生成电子文档)
- [文档项目分类项](#文档项目分类项)
  - [文章](#文章)
  - [书籍](#书籍)
  - [学习笔记](#学习笔记)
  - [本科学习](#本科学习)
  - [翻译](#翻译)
- [作者](#作者)

## 背景
因本人接触的事物蛮多，初期本是想着做学习笔记以便日后复盘，但随着自己博客计划的扩展，这个仓库的想法逐渐成形，慢慢地添加了*书籍*，*翻译*等诸多项目。换而言之，这只是关于我接触过并记录的学习文档。因此，关于其将会涵括的知识范围，我也不清楚。

*注：博客应该会有相对应的文档项目链接，但所有文档的更新都是以GitHub优先。具体文档项目可查看本仓库Github Pages。*

## 用法
本仓库只提供相关文档的电子格式（PDF）及其源码（Tex）。

### 本repo各项目文件存储格式
每个文档项目本身由一个文件夹组成，均有其父分类，例如*Articles*, *Books*等。每个文档项目文件夹内都存放着PDF电子文档及其Tex源码。

### 获取PDF电子文档
PDF电子文档直接存放在每个文档项目文件夹根目录下，直接下载即可。

### 使用Tex源代码编译生成电子文档
**不熟悉Tex源码的，不推荐使用此方法**

从仓库中获取所需的文档项目文件夹，使用可以编译Tex源码的程序进行编译生成PDF等电子格式，例如[Texlive][]或者[Pandoc][]。相关编译及转换操作请详细查看软件手册。本人的工作流是[VS Code][] + [LaTexWorkshop][] + [Texlive][]。

Tex格式说明：本仓库下的每个文档项目下的Tex一般都是采用分文件编译法，即拆分文件编写文档，这个效果有点类似C语言的条件编译。每个分文件均可独立进行编译，但需要生成完整文档项目的电子文档时，请找到主文件进行编译（主文件名一般与文档项目名一致）。（子文件源码中首行均有这么一行代码"% !TEX root = Main.tex %指定主文件"，若找不到主文件则可用此法排除子文件。）

**（很重要）注：因每个文档都会有版权和作者页面，则每个项目之间都会有一些相同的资源，例如“版权页面”中引用的图片。为减小本项目的体积，将这部份相同的资源存放至公共资源文件夹 - [resources][] 中，而不重复存放在每个项目中。因此使用Tex源码编译文档前，请下载好共用资源文件夹的内容，并将其与文档项目下的resources文件夹合并，之后再编译文档。**

**编译流程：**
**下载一个单独的文档项目文件夹 → 下载公共资源文件夹 [resources][] → 使用Tex引擎编译文档**

*注：文档项目Tex源码有着不少复杂排版代码，因此，使用Pandoc将转成为其他格式（如md，docx）时效果可能比不上原排版效果。*

## 文档项目分类项

### 文章
此分类集合了本人的小篇幅著作。详细文档列表请看分类介绍。[跳转文章页][]

### 书籍
此分类集合了本人的大篇幅著作。详细文档列表请看分类介绍。[跳转书籍页][]

### 学习笔记
此分类集合了本人的学习笔记。详细文档列表请看分类介绍。[跳转学习笔记页][]

### 本科学习
此分类集合了本人的本科学习笔记。详细文档列表请看分类介绍。[跳转本科学习页][]

### 翻译
此分类集合了本人翻译的文档。详细文档列表请看分类介绍。[跳转翻译页][]

## 作者
**开放文档** © Mr. Kin，所有文件，除个人设计创作的图像（如 logo 等）和相关的视频创作及其他特别声明外，均采用 [知识共享 署名—非商业性使用—相同方式共享 4.0][] 许可协议进行发布。

由 Mr. Kin 著作并维护。

*注：若想对本作品进行转载、引用亦或是进行二次创作时，请详细阅读上述相关协议内容（若不理解，请点击链接跳转阅读）。为保障本人权利，对于违反者，本人将依法予以处理！望周知！ —— Mr. Kin*

![微信公众号](./resources/images/FollowMe/WechatOfficialAccounts.png)

> [博客][] · [Github][] · [微博][] · [知乎][] · [B站][] · [优酷][] · [头条][] · [油管][]

[Texlive]: https://tug.org/texlive
[Pandoc]: https://pandoc.org
[VS Code]: https://code.visualstudio.com
[LaTexWorkshop]: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop#review-details
[resources]: ./resources
[跳转文章页]: ./Articles
[跳转书籍页]: ./Books
[跳转学习笔记页]: ./LearningNotes
[跳转本科学习页]: ./UndergraduateLearning
[跳转翻译页]: ./Translations
[知识共享 署名—非商业性使用—相同方式共享 4.0]: ./LICENSE_CN
[博客]: https://mister-kin.github.io
[Github]: https://github.com/mister-kin
[微博]: https://weibo.com/6270111192/profile?topnav=1&wvr=6&is_all=1
[B站]: http://space.bilibili.com/17025250?
[优酷]: http://i.youku.com/i/UNjA3MTk5Mjgw?spm=a2hzp.8253869.0.0
[油管]: https://www.youtube.com/channel/UCNhtdG6whC5mlRDkrhQ0wLA?view_as=public
[头条]: https://www.toutiao.com/c/user/835254071079053/#mid=1663279303982091
[知乎]: https://www.zhihu.com/people/drwu-94

<style type="text/css">
.align-right{
    text-align: right;
}
</style>
