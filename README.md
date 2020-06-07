<div align="right">
Language:
EN
<a href="./README-zh_CN.md">ZH</a>
</div>

# OpenDocs

> ⛛ An all-inclusive (maybe(ಡωಡ)) document repository.

[![Texlive Version](https://img.shields.io/badge/Texlive-v2020-blue)](https://tug.org/texlive/) [![License](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-blue)](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode)

## Introduction
A repository for my personal writing, learning notes and translated documents.

## Table of Contents
- [Background](#Background)
- [Usage](#Usage)
  - [Storage Format for Files of each Project in this Repo](#Storage-Format-for-Files-of-each-Project-in-this-Repo)
  - [Get PDF E-Document](#Get-PDF-E-Document)
  - [Compile and Generate E-Document by Tex Source Code](#Compile-and-Generate-E-Document-by-Tex-Source-Code)
- [Category of Documents](#Category-of-Documents)
  - [Articles](#Articles)
  - [Books](#Books)
  - [LearningNotes](#LearningNotes)
  - [UndergraduateLearning](#UndergraduateLearning)
  - [Translates](#Translations)
- [Author](#Author)

## Background
Since I have met a lot of things, I originally want to take learning notes for future review. However, with the expansion of my own blog plan, the idea of ​​this repository gradually improves, and many projects were added progressively in it, such as *Books*, *Translations*, etc. In other words, it's just about the learning documents I've met and taken notes for. Therefore, about the scope of knowledge it will cover, I don't know either.

*Note: My blog should have corresponding links of document project, but all documents will update firstly on the Github.See specific document projects on the Github Pages of this repository.*

## Usage
This repository only provides the relevant documents in electronic format (PDF) and its source code (Tex).

### Storage Format for Files of each Project in this Repo
Each document Project consists of a folder with its parent category, such as *Articles*, *Books*, etc. Each document project folder stores PDF electronic documents and their Tex source code.

### Get PDF E-Document
PDF electronic documents are stored directly in the root directory of each document project folder. Just download it directly.

### Compile and Generate E-Document by Tex Source Code
**If you are unfamiliar with Tex source code, this method is not recommended.**

Obtain the required document project folder from the repo, and compile it with a program that could compile Tex source code to generate PDF or others electronic formats, such as [Texlive][] or [Pandoc][]. Please refer to the software manual for detailed compilation and conversion operations. My workflow is [VS Code][] + [LaTexWorkshop][] + [Texlive][].

Tex format description: Tex under each document projects in this repo generally uses the method of separate file compilation, which splits file to write documents. The effect is just similar to conditional compilation in C language. Each sub-file can be compiled independently. However, if you want to generate the electronic documents of the entire document project, please find the main file for compilation (the name of main file is generally the same as the name of document project). (There is such a line of code "%! TEX root = Main.tex% specifies the main file" in the first line of the sub-file source code. If you couldn't find the main file, you may use this method to exclude the sub-file.)

**(Important) Note: since each document will have pages for copyright and author, there will be some common resources between each project, such as the quoted images in the copyright page. To reduce the size of project, I store the same resources in the public resources folder - [resources][], instead of each project. So before compiling a document using the Tex source code, please download the files of common resources folder, and merge it with the resources folder in the document project, and then compile the document.**


**Compilation Process:**

**Download a Separate Document Project Folder → Download the Common Resources Folder [resources][] → Compile Documents by Using the Tex Engine**

*P.S. The Tex source code in document project has a lot of complicated codes for typography. Therefore, the effect of using Pandoc to convert tex to other formats (such as md, docx) may not be as good as the original typographic effect.*

## Category of Documents

### Articles
This category has my short documents. For a detailed list of documents, please read the introduction of category. [Jump Page *Articles*][]

### Books
This category has my extensive work. For a detailed list of documents, please read the introduction of category. [Jump Page *Books*][]

### LearningNotes
This category has my study notes. For a detailed list of documents, please read the introduction of category. [Jump Page *LearningNotes*][]

### UndergraduateLearning
This category has my undergraduate study notes. For a detailed list of documents, please read the introduction of category. [Jump Page *UndergraduateLearning*][]

### Translations
This category has the documents translated by me. For a detailed list of documents, please see the category introduction. [Jump Page *Translations*][]

## Author
**OpenDocs** © Mr. Kin, All files released under the [CC BY-NC-SA 4.0][] license, except the image designed and created by myself (for example, the logo), the relevant created videos and other special claims.

Authored and maintained by Mr. Kin.

*Note: If you want to reprint, quote or make a second creation of this work, please read the content of the relevant agreement above (if you couldn't understand, please click the link to read further). In order to protect my rights, I will deal with the violators in accordance with the law! Please Note That! —— Mr. Kin*

![WechatOfficialAccounts](./resources/images/FollowMe/WechatOfficialAccounts-En.png)

> [Blog][] · [Github][] · [Weibo][] · [Zhihu][] · [Bilibili][] · [Youku][] · [Headline][] · [Youtube][]

[Texlive]: https://tug.org/texlive
[Pandoc]: https://pandoc.org
[VS Code]: https://code.visualstudio.com
[LaTexWorkshop]: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop#review-details
[resources]: ./resources
[Jump Page *Articles*]: ./Articles
[Jump Page *Books*]: ./Books
[Jump Page *LearningNotes*]: ./LearningNotes
[Jump Page *UndergraduateLearning*]: ./UndergraduateLearning
[Jump Page *Translations*]: ./Translations
[CC BY-NC-SA 4.0]: ./LICENSE
[Blog]: https://mister-kin.github.io
[Github]: https://github.com/mister-kin
[Weibo]: https://weibo.com/6270111192/profile?topnav=1&wvr=6&is_all=1
[Bilibili]: http://space.bilibili.com/17025250?
[Youku]: http://i.youku.com/i/UNjA3MTk5Mjgw?spm=a2hzp.8253869.0.0
[Youtube]: https://www.youtube.com/channel/UCNhtdG6whC5mlRDkrhQ0wLA?view_as=public
[Headline]: https://www.toutiao.com/c/user/835254071079053/#mid=1663279303982091
[Zhihu]: https://www.zhihu.com/people/drwu-94
