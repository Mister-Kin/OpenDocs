Language: EN [CN][ReadmeCN]

[ReadmeCN]: ./README_CN.md

# OpenDocs

[![Texlive Version][]](https://tug.org/texlive/) [![License][]](./LICENSE) [![LaTeX Template Version][]](https://github.com/Mister-Kin/OpenDocs/releases)

[Texlive Version]: https://img.shields.io/badge/texlive-v2024-blue
[License]: https://img.shields.io/badge/license-CC%20BY--NC--SA%204.0-blue
[LaTeX Template Version]: https://img.shields.io/github/v/release/Mister-Kin/OpenDocs?include_prereleases&color=blue

## Introduction
A open document repository for posts of my personal blog.

*Note: Some important blog posts (e.g. software manuals or article series summaries) are accompanied by PDFs and LaTeX source code.*

## Table of Contents
- [File Structure in this Repository](#File-Structure-in-this-Repository)
- [Usage](#Usage)
  - [Get PDF E-Document](#Get-PDF-E-Document)
  - [Compile and Generate E-Document from LaTeX Source Code](#Compile-and-Generate-E-Document-from-LaTeX-Source-Code)
- [A few Notes](#A-few-Notes)
  - [Release Notes for New Document Class](#Release-Notes-for-New-Document-Class)
  - [Compilation Function for Multiple Files of Workflow](#Compilation-Function-for-Multiple-Files-of-Workflow)
  - [Problems of Converting Formats using Pandoc](#Problems-of-Converting-Formats-using-Pandoc)
  - [Why not Markdown Macro Package](#Why-not-Markdown-Macro-Package)
- [Author](#Author)

## File Structure in this Repository
Every single document project consists of a folder containing a PDF E-Document and its LaTeX source code, each with its own parent category. The folder's name is the project's name, and the main file's name is generally the same as the document project's name, i.e. the file name of the PDF E-Document and LaTeX source code‘s main file is the same as the folder's name.

For example, a folder named ToggleLanguage has a project named ToggleLanguage and is located in a parent folder named Manuals. The PDF E-Document and the main file of LaTeX source code are both named ToggleLanuage. The directory structure is as follows.
```
.
└── OpenDocs
    └── manuals
        └── toggle_language
            ├── resources
            │   ├── images
            │   │   ├── default_hint.png
            │   │   ├── developer_hint.png
            │   │   ├── enable_addon.png
            │   │   ├── installation.png
            │   │   ├── settings_for_loading_my_settings.png
            │   │   ├── translate_name_option_addon.png
            │   │   ├── translate_name_option_effect.png
            │   │   ├── translate_name_option_pref.png
            │   │   ├── ui.png
            │   │   ├── video_progress_bar_child_strip.png
            │   │   └── video_progress_bar_meta_strip.png
            │   └── reference.bib
            ├── toggle_language.pdf
            └── toggle_language.tex
```

## Usage
This repository only provides documents' source code (LaTeX).

**Note: In order to reduce the size of the repository, this repo will no longer provide electronic format files (PDF) as from 2021/6/28. PDF files will be synchronized and shared by Baidu Cloud.**

### Get PDF E-Document
PDF electronic documents are synchronized and shared by Baidu Cloud. PDF's name is the same as the LaTeX source code folder's name. Just download it directly.

[Baidu Cloud][Baidu Cloud Sharing] (Access Code: docs)

[Baidu Cloud Sharing]: https://pan.baidu.com/s/1Tn7qIO0raqvNoesgT8SKow

### Compile and Generate E-Document from LaTeX Source Code
**This method is not recommended if you are unfamiliar with LaTeX source code.**

Obtain the required LaTeX source code of the document project from the repository, and compile source code to generate PDF or others electronic formats by a compiler. My workflow is [VS Code][] + [LaTeXWorkshop][] + [TeX Live][].

**Preparation before Compilation:**
- Install the compiler, e.g. [TeX Live][].
- Install [Adobe Source Font][] (All Source Western Fonts are in OTF format, and Source Chinese Fonts are SC version of Language-specific OTFs).
  - Source Sans 3 (v3.052)
  - Source Serif 4 (v4.005)
  - Source Code Pro (v2.042/v1.062)
  - Source Han Sans SC (v2.004)
  - Source Han Serif SC (v2.002)
- Install [SIL Font][] (Current document class of LaTeX source code is using Doulos SIL Font)
  - Doulos SIL (v6.200)

**Compilation Process:**
1. Download the LaTeX source code required for your document project.
2. Download the public resources folder 「PublicResources」.
3. Store file correctly based on path of document directory structure (this step is not necessary if you are cloning the entire repository).
4. Compile the source code using the Tex engine: xelatex -> biber -> xelatex -> xelatex.

***P.S. Install GitZip, a browser plug-in, to download a individual folder or file from the repository instead of downloading or cloning the entire repository.***

GitZip for Firefox: [Jump to Installation Page][]

[Jump to Installation Page]: https://addons.mozilla.org/zh-CN/firefox/addon/gitzip/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
[TeX Live]: https://tug.org/texlive
[VS Code]: https://code.visualstudio.com
[LaTeXWorkshop]: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop#review-details
[Adobe Source Font]: https://github.com/adobe-fonts
[SIL Font]: https://software.sil.org/fonts/

## A few Notes
### Release Notes for New Document Class
- Using document class instead of introductory area settings: Accomplish LaTeX document class by writing CLS file.
- Remove subfile compilation style: For the new document class, I can't give a good solution for dealing conditional statements in underlying command of Tex yet, so the subfile compilation function of the old template is removed.
- Use compilation command arguments instead of synonly macro packages: use compilation command arguments to implement quickly compilation function for checking syntax, removing synonly macro package settings and commands.
- Further streamlining: the new document class uses relative path, following the tack of the old template, and apply it to all repetitive files so as to remove all redundant files as far as possible in the repository (the old template was only partially streamlined).

### Compilation Function for Multiple Files of Workflow
LaTexWorkshop can execute compilation commands on any files during multiple files compilation on current workflow which is [VS Code][] + [LaTeXWorkshop][] + [TeX Live][]. In other words, it's not necessary to specify the main file to execute the compilation commands, since it will automatically look for the main file.

[Jump to LaTeXWorkshop Wiki Page][] to see more details.

### Problems of Converting Formats using Pandoc
The LaTeX source code in this repository has a lot of complex underlying code, so the effect using [Pandoc][] to convert to other formats (e.g. md, docx) may be inconsistent with original typographic effect. Also, conversions using Pandoc may fail due to the complex code and the use of custom document class.

### Why not Markdown Macro Package
The Markdown macro package does not seem to support TeX command for expansion, so it's not being considered. Also, the current workflow of writing documents is very easy after optimizing the document structure with the new document class.

[Pandoc]: https://pandoc.org
[Jump to LaTeXWorkshop Wiki Page]: https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile#Multi-File-Projects

## Author
**OpenDocs** © Mr. Kin, all files released under the [CC BY-NC-SA 4.0][] license, except the image designed and created by myself (for example, the logo), the relevant created videos and other special claims.

Authored and maintained by Mr. Kin.

*Note: If you want to reprint, quote or make a second creation of this work, please read the content of the relevant agreement above (if you couldn't understand, please click the link to read further). In order to protect my rights, I will deal with the violators in accordance with the law! Please Note That! —— Mr. Kin*

![Search to Follow WeChat Official Accounts: MisterKin](./PublicResources/images/FollowMe/WeChatOfficialAccounts-En.png "Scan/Search to Follow WeChat Official Accounts: MisterKin")

> [Blog][] · [GitHub][] · [Weibo][] · [Zhihu][] · [AcFun][] · [Bilibili][] · [Youku][] · [Headline][] · [YouTube][]

[CC BY-NC-SA 4.0]: ./LICENSE
[Blog]: https://mister-kin.github.io
[GitHub]: https://github.com/mister-kin
[Weibo]: https://weibo.com/6270111192
[Bilibili]: http://space.bilibili.com/17025250?
[Youku]: http://i.youku.com/i/UNjA3MTk5Mjgw?spm=a2hzp.8253869.0.0
[YouTube]: https://www.youtube.com/@Mister-Kin
[Headline]: https://www.toutiao.com/c/user/835254071079053/#mid=1663279303982091
[Zhihu]: https://www.zhihu.com/people/drwu-94
[AcFun]: https://www.acfun.cn/u/73269306
