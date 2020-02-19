# 开放文档

> ⛛ 包罗万象（误(ಡωಡ)）的文档仓库。

[![tex](https://img.shields.io/ctan/v/tex)](https://tug.org/texlive/)

## 介绍
一个关于我本人写作、学习笔记和翻译文档的仓库。

## 目录
- [背景](#背景)
- [用法](#用法)
  - [本repo各项目文件存储格式](#本repo各项目文件存储格式)
  - [获取PDF电子文档](#获取PDF电子文档)
  - [从Tex源代码编译生成电子文档（高级）](#从Tex源代码编译生成电子文档（高级）)
- [文档项目分类项](#文档项目分类项)
  - [文章](#文章)
  - [书籍](#书籍)
  - [学习笔记](#学习笔记)
  - [本科学习](#本科学习)
  - [翻译](#翻译)
- [作者&许可](#作者&许可)

## 背景
因本人接触的事物蛮多，初期本是想着做学习笔记以便日后复盘。后面随着自己博客计划的扩展，这个仓库的想法逐渐成形，慢慢地添加了翻译项等诸多项目。换而言之，这只是关于我接触过并记录的学习文档。因此，关于其将会涵括的知识范围，我也不清楚。

*注：博客应该会有相对应的文档项目链接，但所有文档的更新都是以GitHub优先，且本仓库并不会准备Github相关页面的Markdown页面。*

## 用法
本仓库只提供相关文档的电子格式（PDF）及其源码（Tex）。

### 本repo各项目文件存储格式
所有文档项目本身由一个文件夹组成，均有其分类的文件夹，例如Articles, Books等。每个文档项目文件夹内都存放着PDF电子文档及其Tex源码。

---
~~以下为原存放格式设计（考虑到后续可能会更改其他渠道啦存放PDF电子文档，为减轻后续的可能带来的维护负担，因此放弃该设计的想法）~~

~~每个文档项目文件夹内都会有两样东西：~~
- ~~PDF电子文档~~
- ~~SourceCode（一个子文件夹，用于存放Tex源码）~~
---

### 获取PDF电子文档
PDF电子文档直接存放在每个文档项目文件夹根目录下，直接下载即可。

### 从Tex源代码编译生成电子文档（高级）
**不熟悉Tex源码的，不推荐使用此方法**

从仓库中获取所需的文档项目文件夹，使用可以编译Tex源码的程序进行编译生成PDF等电子格式，例如[Texlive][]或者[Pandoc](https://pandoc.org/)。相关编译及转换操作请详细查看软件手册。本人的工作流是[VS Code](https://code.visualstudio.com/) + [LaTexWorkshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop#review-details) + [Texlive](https://tug.org/texlive/)。

Tex格式说明：本仓库下的所有文档项目下的Tex一般都是采用分文件编译法，即拆分文件编写文档，这个效果有点类似C语言的条件编译。每个分文件均可独立进行编译，但子文件源码中的目录设置我并未做过多优化，其目录的排版效果可能会与主文件的不相同。需要整个生成文档项目的电子文档，请找到主文件进行编译（主文件名一般与文档项目名一致）。（子文件源码中首行均有这么一行代码"% !TEX root = Main.tex %指定主文件"，若找不到主文件则可用此法排除子文件）

**（很重要）注：因每个文档都会有版权和作者页面，则每个项目之间都会有一些相同的资源，例如“版权页面”中引用的图片。为减小本项目的体积，将这部份相同的资源存放至公共资源文件夹 - [<resources>](https://github.com/Mister-Kin/OpenDocs/resources/) 中，而不重复存放在每个项目中。因此使用Tex源码编译文档前，请下载好共用资源文件夹的内容，并将其与文档项目下的resources文件夹合并，之后再编译文档。**

**编译流程：**
**下载一个单独的文档项目文件夹 → 下载公共资源文件夹 [<resources>](https://github.com/Mister-Kin/OpenDocs/resources/) → 使用Tex引擎编译文档**

*注：文档项目Tex源码有着不少复杂排版代码，因此，使用Pandoc将转成为其他格式如md，docx时效果可能比不上原排版效果。*

## 文档项目分类项

### 文章
此分类集合了本人的小篇幅著作。详细文档列表请看分类介绍。[跳转请点](https://github.com/Mister-Kin/OpenDocs/Articles/)

### 书籍
此分类集合了本人的大篇幅著作。详细文档列表请看分类介绍。[跳转请点](https://github.com/Mister-Kin/OpenDocs/Books/)

### 学习笔记
此分类集合了本人的学习笔记。详细文档列表请看分类介绍。[跳转请点](https://github.com/Mister-Kin/OpenDocs/LearningNotes/)

### 本科学习
此分类集合了本人的本科学习笔记。详细文档列表请看分类介绍。[跳转请点](https://github.com/Mister-Kin/OpenDocs/UndergraduateLearning/)

### 翻译
此分类集合了本人的翻译文档。详细文档列表请看分类介绍。[跳转请点](https://github.com/Mister-Kin/OpenDocs/Translations/)

## 作者&许可
**开放文档** © Mr. Kin，采用 [CC BY-NC-SA 4.0](/LICESNSE) 许可协议进行发布。
由Mr. Kin著作并维护。

*注：若想对本作品进行转载、引用亦或是进行二次创作时，请详细阅读上述相关协议内容（若
不理解，请点击链接跳转阅读）。为保障本人权利，对于违反者，本人将依法予以处理！望周知！
—— Mr. Kin*

> [博客](https://mister-kin.github.io/) · [GitHub](https://github.com/mister-kin) · [微博](https://weibo.com/6270111192/profile?topnav=1&wvr=6&is_all=1) · [B站](http://space.bilibili.com/17025250?) · [优酷](http://i.youku.com/i/UNjA3MTk5Mjgw?spm=a2hzp.8253869.0.0) · [油管](https://www.youtube.com/channel/UCNhtdG6whC5mlRDkrhQ0wLA?view_as=public)

[Texlive]: https://tug.org/texlive/ "Texlive"