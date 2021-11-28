%! ----------------------------------------------
%! Author：Mr. Kin
%! Email: im.misterkin@gmail.com
%! Blog: https://mister-kin.github.io
%! License: CC BY-NC-SA 4.0
%! ----------------------------------------------

%! ----------------------------------------------
%! 不要随便修改以下代码
%! 除非你懂得你在干什么
%! ----------------------------------------------

% -----------------------------------------------
% 文类版本设定
% -----------------------------------------------
\NeedsTeXFormat{LaTeX2e} % 该文类所需的 Tex 系统版本。
\ProvidesClass{doc}[2021/11/28 v2.1.3 General Document Template] % 该文类的名称、发布日期、版本序号等。（date 的写法格式为 YYYY/MM/DD，其中月和日不能写成一位。否则编译会报两个错误 Missing = inserted for \ifnum. 和 Missing number, treated as zero.）

% -----------------------------------------------
% 文类新选项设定
% -----------------------------------------------
\newif\ifPrintBlack\PrintBlackfalse % 新建变量 PrintBlack 并设置其值为 false。
\DeclareOption{print}{\PrintBlacktrue} % 声明文类新选项 print（选项启用时，设置 PrintBlack 为 true）。
\newif\ifLightDoc\LightDocfalse % 新建变量 LightDoc 并设置其值为 false。
\DeclareOption{light}{\LightDoctrue} % 声明文类新选项 light（选项启用时，设置 LightDoc 为 true）。
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}} % 处理未执行的选项，传递所有未知的选项到 ctexbook 文类。
\ProcessOptions\relax % 结束所有选项处理

% -----------------------------------------------
% 加载文类，并设定相关参数
% 字号为小四、行距为 1.5、倍纸张大小是 A4、双面排版、指定 \chapter 紧跟上一页开始、显式指定文档为 UTF-8 编码、禁用自动设定字库功能（消除 Redefining CJKfamily xxx 的警告）。
% 请注意：此处 1.5 倍行距与 MS Word 的并不相同。LaTeX 中的行距为两基线的间距：行距（\baselineskip）= 因子（\linespread）× 基础行距（\normalbaselineskip）。基础行距在 LaTeX 中为字号（长度）的 1.2 倍。所以在 LaTeX 中设置 linespread 为 1.5 时，最终的行距应为 1.5×1.2=1.8。然而 Word 的基础行距不是字号的 1.2 倍（甚至不是一个固定值），是和字体有关的一个值。因此要使 LaTeX 的行距与 Word 一样，只能根据具体字体设置去凑。
% -----------------------------------------------
\LoadClass[zihao=-4,linespread=1.5,a4paper,twoside,openany,UTF8,fontset=none]{ctexbook}

% -----------------------------------------------
% 字体设定
% -----------------------------------------------
\RequirePackage{fontspec} % 支持修改西文字体族。
\setmainfont{Source Serif 4}[Scale=1.1] % 缩放至 1.1 倍以适配中文字体。
\setsansfont{Source Sans 3}[Scale=1.1]
\setmonofont{Source Code Pro}[Scale=1.1]
\newfontfamily\IPAFont{Doulos SIL}[Scale=1.1] % 指定国际音标排版所需字体。
\RequirePackage{xeCJK} % 支持修改中文字体族。
\xeCJKsetup{AutoFakeSlant=true}  % 设置伪斜体属性，以支持生成斜体中文字体（需置于中文字体设置之前）。
\setCJKmainfont{思源宋体}
\setCJKsansfont{思源黑体}
\setCJKmonofont{思源黑体}
\RequirePackage{amsmath} % 支持复杂的数学公式排版。
\RequirePackage{unicode-math} % 支持输入 unicode 数学字符（该宏包需要置于数学或者字体相关的宏包之后）。
\setmathfont[Scale=MatchUppercase]{STIX Two Math} % 设置数学字体为 STIX Two Math，并缩放至西文字体大写字符大小。该字体与 Cambria Math 较为相似。

% -----------------------------------------------
% 一些信息的数据结构设定（符号列表 - Token Lists）
% -----------------------------------------------
% 文档信息
\newtoks\DocumentTitle
\newtoks\DocumentSubtitle
\newtoks\DocumentCreatedDate
% 文档作者信息
\newtoks\AuthorName
\newtoks\AuthorEmail
\newtoks\AuthorBlog
\newtoks\AuthorBlogMirror
% 文档相关链接
\newtoks\LinkBlogPost
\newtoks\LinkBlogPostMirror
\newtoks\LinkPDF
\newtoks\LinkPDFAccessCode
\newtoks\LinkLaTeX
\newtoks\LinkVideo
% 用以处理判断文档相关链接是否为空的临时变量
\newtoks\LinkBlogPostText
\newtoks\LinkBlogPostMirrorText
\newtoks\LinkPDFText
\newtoks\LinkLaTeXText
\newtoks\LinkVideoTextLeft
\newtoks\LinkVideoTextRight
% 公共资源的相对路径
\newtoks\PathPublicResources

% 用以检测 Token 是否为空（该语句可以嵌套使用）
\newif\ifToksEmpty
\def\DetectToksEmpty#1{\edef\1{\the#1}%
  \ifx \1\empty \ToksEmptytrue % from plain.tex: \def\empty{}
  \else\ToksEmptyfalse \fi}

% 定义用来注释的判断语句。\ifcomment (注释内容) \fi
% 尽量避免使用  \iftrue 和 \iffalse，因为 \iffalse（TeX 仍会检测内部是否有 \iftrue，因而可能会导致 iffalse 没有 \fi 匹配，最近原则）\fi ）
\newif\ifcomment\commentfalse

% -----------------------------------------------
% 封面设定
% -----------------------------------------------
\renewcommand{\maketitle}{%
    \pagenumbering{Roman} % 大写罗马字母样式页码，区别 \frontmatter 的小写罗马字母样式。
    \pdfbookmark[1]{封面}{cover} % 添加进 PDF 书签，「cover」该项参数只是作为内部锚点名称使用，可随意设定，但必须是唯一的。

    \begin{titlepage}
        \sffamily%
        {\zihao{5} © \the\AuthorName\ ——\ All Rights Reserved}
        \begin{flushright}
            \begin{tabular}{rl}
                Created: & \hspace{-0.8em} \the\DocumentCreatedDate \\
                Edited: & \hspace{-0.8em} \number\year/\number\month/\number\day \\
            \end{tabular}
        \end{flushright}
        \vspace{25ex}

        \begin{center}
            {\zihao{2}\bfseries \the\DocumentTitle}

            \DetectToksEmpty\DocumentSubtitle
            \ifToksEmpty
                \relax
            \else
                ——\the\DocumentSubtitle
            \fi

            \vspace{3ex}
            Written by \textbf{\the\AuthorName}
            \vspace{3ex}

            \ifLightDoc
                \relax
            \else
                \begin{tabular}{rl}
                    Author's Email: & \hspace{-0.8em} \href{mailto:\the\AuthorEmail}{\color{black} \the\AuthorEmail} \\
                    Author's Blog: & \hspace{-0.8em} \href{\the\AuthorBlog}{\color{black} \the\AuthorBlog} \\
                    Author's Blog Mirror: & \hspace{-0.8em} \href{\the\AuthorBlogMirror}{\color{black} \the\AuthorBlogMirror} \\
                \end{tabular}
            \fi

            \DetectToksEmpty\LinkBlogPost
            \ifToksEmpty
                \LinkBlogPostText{链接暂空}
            \else
                \LinkBlogPostText{\href{\the\LinkBlogPost}{\color{black} 点击跳转}}
            \fi
            \DetectToksEmpty\LinkBlogPostMirror
            \ifToksEmpty
                \LinkBlogPostMirrorText{链接暂空}
            \else
                \LinkBlogPostMirrorText{\href{\the\LinkBlogPostMirror}{\color{black} 点击跳转}}
            \fi
            \DetectToksEmpty\LinkPDF
            \ifToksEmpty
                \LinkPDFText{链接暂空}
            \else
                \DetectToksEmpty\LinkPDFAccessCode
                \ifToksEmpty
                    \LinkPDFText{\href{\the\LinkPDF}{\color{black} 点击跳转}}
                \else
                    \LinkPDFText{\href{\the\LinkPDF}{\color{black} 点击跳转}（提取码：\the\LinkPDFAccessCode）}
                \fi
            \fi
            \DetectToksEmpty\LinkLaTeX
            \ifToksEmpty
                \LinkLaTeXText{链接暂空}
            \else
                \LinkLaTeXText{\href{\the\LinkLaTeX}{\color{black} 点击跳转}}
            \fi
            \DetectToksEmpty\LinkVideo
            \ifToksEmpty
                \relax
            \else
                \LinkVideoTextLeft{视频链接：}
                \LinkVideoTextRight{\href{\the\LinkVideo}{\color{black} 点击跳转}}
            \fi

            \ifLightDoc
                \vspace{5ex}
            \else
                \vspace{10ex}
            \fi
            本文相关链接\\
            \vspace{-2.2ex}

            \DetectToksEmpty\LinkPDFAccessCode
            \ifToksEmpty
                \tikz[thick]{\draw (0,0) -- (8,0);}

                \hspace{-2.8em}
                \ifLightDoc
                    \begin{tabular}{rl}
                        PDF链接：& \the\LinkPDFText \\
                        LaTeX源码链接：& \the\LinkLaTeXText \\
                    \end{tabular}
                \else
                    \begin{tabular}{rl}
                        博文链接：& \the\LinkBlogPostText \\
                        博文镜像链接：& \the\LinkBlogPostMirrorText \\
                        PDF链接：& \the\LinkPDFText \\
                        LaTeX源码链接：& \the\LinkLaTeXText \\
                        \the\LinkVideoTextLeft & \the\LinkVideoTextRight \\
                    \end{tabular}
                \fi
            \else
                \tikz[thick]{\draw (0,0) -- (10.5,0);}

                \hspace{4em}
                \ifLightDoc
                    \begin{tabular}{rl}
                        PDF链接：& \the\LinkPDFText \\
                        LaTeX源码链接：& \the\LinkLaTeXText \\
                    \end{tabular}
                \else
                    \begin{tabular}{rl}
                        博文链接：& \the\LinkBlogPostText \\
                        博文镜像链接：& \the\LinkBlogPostMirrorText \\
                        PDF链接：& \the\LinkPDFText \\
                        LaTeX源码链接：& \the\LinkLaTeXText \\
                        \the\LinkVideoTextLeft & \the\LinkVideoTextRight \\
                    \end{tabular}
                \fi
            \fi
        \end{center}
    \end{titlepage}%

    %\addcontentsline{toc}{chapter}{封面} % 因为清除封面后的空白页（即 cleardoublepage 改为 clearpage），程序无法正确处理封面的页码，故将封面从目录中删除，只添加进 PDF 书签（见上 \pdfbookmark）。（atbegshi 宏包清除空白页的命令 \AtBeginShipoutNext {\AtBeginShipoutDiscard} 也无法正确处理页码的问题）
}

% -----------------------------------------------
% 抑制双面排版时封面和目录后的空白页的设定
% -----------------------------------------------
\if@twoside
    % 重定义 \frontmatter 命令
    \renewcommand\frontmatter{%
        %\cleardoublepage % book.cls 中的原定义
        \clearpage
    \@mainmatterfalse
    \pagenumbering{roman}}
    % 重定义 \mainmatter 命令
    \renewcommand\mainmatter{%
        %\cleardoublepage % book.cls 中的原定义
        \clearpage
    \@mainmattertrue
    \pagenumbering{arabic}}
\else
    \relax
\fi

% -----------------------------------------------
% 脚注设定：序号用带圈的数字表示，文章正文标记时的序号为上标形式，脚注正文内的序号是和其他文字对齐（非上标）。
% -----------------------------------------------
% 通过 tikz 宏包将脚注的序号（计数器）绘制成带圈的数字：scale=0.8 是为了保持序号与文字大小相同；yshift 是沿 Y 轴向上移动，避免序号与脚注正文不对齐，因为 number.base 坐标系并非对齐字符的中部。
% \newcommand 之后通过 \DeclareRobustCommand 声明， 可以不需要在使用前加 \protect（直接去掉 \protect 会导致编译卡住）。
% 以 current bounding box 为坐标系时，想要基线对齐文字的垂直中部，需设置 baseline={([yshift=-0.7ex] current bounding box.center)}，-0.8ex 参数可能更佳，一个大写字母大概是 1.6ex。
\newcommand*\circled[1]{\tikz[baseline={([yshift=-0.17ex]number.base)}]{%
                \node[shape=circle,draw,inner sep=0.5pt,scale=0.8] (number) {#1};}}
\renewcommand\thefootnote{\protect\circled{\arabic{footnote}}}

% 脚注正文的设定。
\makeatletter
\renewcommand{\@makefntext}[1]{%
  \noindent\@thefnmark\enskip#1 %序号和正文相隔半个汉字符的宽度，这里设置为\enskip。
  \setlength {\hangindent}{0.8em+0.5em} % 悬挂缩进，脚注序号已经被 scale 到 0.8 倍，且 \enskip 为 0.5em。
  \linespread{1.2}\selectfont % 脚注内容行距调整为 1.2 倍。
}
\makeatother

% -----------------------------------------------
% 自定义环境设定
% -----------------------------------------------
% intro 环境，用以章节开头的文字介绍。排版上比普通正文多缩进两个文字。
\newenvironment{intro}{\narrower\sffamily}{\par}

% -----------------------------------------------
% 自定义命令设定
% -----------------------------------------------
% 定义插入 About 和 Copyright 页面的命令
% 出于特殊的安全设置，\include 命令无法使用相对路径，因为需要读写权限以给 included file 写 aux 文件，而 \input 命令只需要读权限。
\newcommand{\inputPubulicText}{\input{\the\PathPublicResources/public_text}}
% 定义生成目录页的命令。
\newcommand{\inputToc}{{\centering \tableofcontents}}
% 定义生成参考文献的命令
\newcommand{\inputBibliography}{\nocite{*} % 不使用 cite 也能生成参考文献。
                                \printbibliography % 生成参考文献排版。
                                \addcontentsline{toc}{chapter}{参考文献} % 添加参考文献进目录。
                                }

% 定义用以排版音标的命令。
\newcommand{\ipa}[1]{{\IPAFont /#1/}}

% 定义由阿拉伯数字输出大小写罗马数字的命令。
\newcommand{\romannum}[1]{\romannumeral #1}
\newcommand{\Romannum}[1]{\uppercase\expandafter{\romannumeral #1}}

% 定义 print 选项启用时统一输出黑色的颜色命令
\newcommand{\mycolor}[1]{\ifPrintBlack\color{black}\else\color{#1}\fi} % 此处用 \relax 会导致表格等环境的垂直间距发生变化，故用 \color {black}。
\newcommand{\mytextcolor}[2]{\ifPrintBlack\textcolor{black}{#2}\else\textcolor{#1}{#2}\fi}

% 定义 note 命令
\newcommand{\note}[1]{{\zihao{5}\noindent\em 注：#1 \par}} % 用分段命令 \par 修正行距问题。行距只有分段时才能生效，不像字号即时生效。
\newcommand{\enote}[1]{{\zihao{5}\noindent\em P.S. #1 \par}}
\newcommand{\rednote}[1]{{\zihao{5}\noindent\mycolor{red}\em 注：#1 \par}}
\newcommand{\redenote}[1]{{\zihao{5}\noindent\mycolor{red}\em P.S. #1 \par}}

% 定义 myref 命令，解决当前环境下无法处理 \ref 命令前后的空格问题。
% 已尝试过多种 patch 代码的手段，均无法实现自动添加空格，只能通过自定义新命令解决。
\newcommand{\myref}[1]{ \ref{#1} }

% 定义可重复执行命令的命令：\repeated{重复次数}{重复命令}
\newcounter{RepeatedTimes}
\newcommand{\repeated}[2]{%
    \setcounter{RepeatedTimes}{0}%
    \loop%
    \ifnum\value{RepeatedTimes}<#1%
    #2%
    \stepcounter{RepeatedTimes}%
    \repeat%
}

% 定义样例文本 - 测试排版
\newcommand{\sampletext}{滚滚长江东逝水，浪花淘尽英雄。是非成败转头空，青山依旧在，几度夕阳红。白发渔樵江渚上，惯看秋月春风。一壶浊酒喜相逢，古今多少事，都付笑谈中。}
\newcommand{\sampletexten}{The quick brown fox jumps over the lazy dog. }

% -----------------------------------------------
% 文档布局设定
% -----------------------------------------------
\RequirePackage[margin=1in]{geometry} % 支持设置页面布局，页边距设置为 1 英寸。

% -----------------------------------------------
% 标题和目录设定
% -----------------------------------------------
% 全部标题设定为无衬线字体。
% 其中，为不改变原标题样式，会使用 += 在原基础上追加命令。
\ctexset{
    part/format += \sffamily,
    chapter = {
        format     += \zihao{3}\sffamily, % 3 号字体，无衬线字体
        name        = {,}, % 移除标题的中文字符。
        number      = \arabic{chapter}, % 修改编号为阿拉伯数字。
        beforeskip  = 8pt, % 标题前的垂直间距
        afterskip   = 20pt, % 标题后的垂直间距
        fixskip     = true, % 抑制多余的间距
    },
    section = {
        format     += \zihao{-3}\sffamily\raggedright,
        beforeskip  = 20pt,
        afterskip   = 18pt plus 1pt minus 1pt,
        fixskip     = true,
    },
    subsection = {
        format     += \zihao{4}\sffamily,
        beforeskip  = 18pt plus 1pt minus 1pt,
        afterskip   = 16pt plus 1pt minus 1pt,
        fixskip     = true,
    },
    subsubsection = {
        format     += \zihao{-4}\sffamily,
        beforeskip  = 16pt plus 1pt minus 1pt,
        afterskip   = 14pt plus 1pt minus 1pt,
        fixskip     = true,
    },
    paragraph = {
        format     += \sffamily,
        beforeskip  = 14pt plus 1pt minus 1pt,
        afterskip   = 12pt plus 1pt minus 1pt,
        fixskip     = true,
    },
    subparagraph = {
        format     += \sffamily,
        beforeskip  = 12pt plus 1pt minus 1pt,
        afterskip   = 10pt plus 1pt minus 1pt,
        fixskip     = true,
    }
}
% 修改目录排版样式。注意，tocloft 和 subfigure 宏包一起调用时，需指定 subfigure 参数。
\RequirePackage[subfigure]{tocloft}
\renewcommand{\cfttoctitlefont}{\zihao{3}\bfseries\sffamily}
\renewcommand{\cftpartfont}{\zihao{-4}\bfseries\sffamily}
\renewcommand{\cftchapfont}{\zihao{-4}\bfseries\sffamily}
\renewcommand{\cftsecfont}{\zihao{-4}\sffamily}
\renewcommand{\cftsubsecfont}{\zihao{-4}\sffamily}
\renewcommand{\cftsubsubsecfont}{\zihao{-4}\sffamily}

\RequirePackage{tocbibind} % 支持添加目录本身和参考文献进目录中。
%\RequirePackage[toc]{multitoc} % 支持排版多栏 toc 目录页，默认双栏。(小四号字体不适合双栏排版)
% 移除 subsubsection 标题编号
%\setcounter{tocdepth}{3} % 目录深度设定为 3。
%\setcounter{secnumdepth}{3} % 章节编号深度设定为 3。

% -----------------------------------------------
% 参考文献和图片设定，及其相关路径设定。
% -----------------------------------------------
% 参考文献设定
\RequirePackage[backend=biber, style=gb7714-2015]{biblatex} % 支持排版参考文献。设置文献样式为现行中文文献著录标准的 GB/T 7714-2015 样式）, 使用默认的后端程序 biber（其支持更好，包括 UTF-8 等，而 [backend=bibtex] 后端程序只支持 ascii 编码）。
\addbibresource{resources/reference.bib} % 相对路径，指定参考文献数据库文件路径。
% -----------------------------------------------
% 修改 \printbibliography 命令的部分排版参数
% biblatex.def 中相关原定义
% \newcommand*{\bibfont}{\normalfont\normalsize}
% \setlength{\bibhang}{\ifnumequal{\parindent}{0}{1em}{\parindent}}
% \setlength{\biblabelsep}{2\labelsep}
% \setlength{\bibitemsep}{\itemsep}
% -----------------------------------------------
\renewcommand*{\bibfont}{\normalfont\zihao{5}} % 设置字体大小为 5 号。
\setlength{\biblabelsep}{\labelsep} % 设置 label 间距为一倍的 \labelsep。
\setlength{\bibitemsep}{0pt} % 移除多余的垂直间距。
\setlength{\bibhang}{\labelsep} % 修正 \biblabelse 被设置为一倍的 \labelsep 时的问题：label 向右移动 \label 间距。

% 图片设定
\RequirePackage{graphicx} % 支持插入图片。
\graphicspath{{resources/images/},% 相对地址，指定文档路径下的图片路径。
                {\the\PathPublicResources/images/}, % 相对地址，指定文档路径外的公共图片路径。
                {\the\PathPublicResources/images/follow_me/}, % 相对地址，指定文档路径外的公共图片路径。
                }

% -----------------------------------------------
% 页眉页脚设定
% -----------------------------------------------
\RequirePackage{fancyhdr} % 调用 fancyhdr 宏包，以设置页眉页脚，文档风格设为：页眉偶数页为博客地址，奇数页为文档名称；页脚为页码 + 版权声明。
\pagestyle{fancy}
\fancyhf{} % 清空页眉页脚的设置
\ifLightDoc
    \fancyhead[C]{\zihao{5}\ttfamily \the\DocumentTitle}
\else
    \fancyhead[CE]{\zihao{5}\ttfamily Author's Blog: \href{\the\AuthorBlog}{\color{black} \the\AuthorBlog}}
    \fancyhead[CO]{\zihao{5}\ttfamily \the\DocumentTitle}
\fi
\renewcommand{\headrulewidth}{0.75pt} % 页眉横线粗细为 0.75 磅值
\fancyfoot[C]{\zihao{5}— \ \thepage \ —}
\fancyfoot[R]{\zihao{-5}\sffamily © \the\AuthorName\ ——\ All Rights Reserved} % 字体大小设置为小五，避免作者名过长时与页码重叠
\setlength{\headheight}{14.5pt} % 增加 headheight，以消除 headheight 值过小的警告，默认为 12pt。
\addtolength{\topmargin}{-2.5pt} % 缩小 topmargin，作为 headheight 增加的补偿。
% part、chapter 首页的页眉页脚是由 plain style 决定的。
\fancypagestyle{plain}
{
    \fancyhf{}
    \ifLightDoc
        \fancyhead[C]{\zihao{5}\ttfamily \the\DocumentTitle}
    \else
        \fancyhead[CE]{\zihao{5}\ttfamily Author's Blog: \href{\the\AuthorBlog}{\color{black} \the\AuthorBlog}}
        \fancyhead[CO]{\zihao{5}\ttfamily \the\DocumentTitle}
    \fi
    \renewcommand{\headrulewidth}{0.75pt}
    \fancyfoot[C]{\zihao{5}— \ \thepage \ —}
    \fancyfoot[R]{\zihao{-5}\sffamily © \the\AuthorName\ ——\ All Rights Reserved}
}

% -----------------------------------------------
% 超链接和书签设定
% -----------------------------------------------
\RequirePackage[bookmarks=true]{hyperref} % 调用 hyperref 宏包，bookmark 参数只能在调用时指定。
% token not allowed in a pdf string (unicode) removing xxx (token 命令). hyperref 宏包中 \texorpdfstring 命令无法解决，故不添加 pdftitle 和 pdfauthor 属性
\hypersetup{
    colorlinks=true, % 设置超链接文件带颜色。
    bookmarksopen=true, % 书签展开。
    bookmarksnumbered=true, % 书签带章节编号。
    citecolor=red, % 设置 cite 引用颜色为红色。
    urlcolor=red, % 设置 url 链接颜色为红色。
}

% 若 print 选项启用，将超链接颜色统一输出黑色。
\ifPrintBlack
    \hypersetup{allcolors=black}
\else
    \relax
\fi

% -----------------------------------------------
% 代码环境设定
% -----------------------------------------------
\RequirePackage{listings} % 支持订制代码排版环境。
\lstset{
    basicstyle=\ttfamily, % 基本代码指定等宽字体。
    keywordstyle=\bfseries, % 关键字指定加粗。
    commentstyle=\ttfamily\slshape\color{gray}, % 注释指定灰色等宽斜体。
    stringstyle=\ttfamily,% 字符串指定等宽字体。
    %numbers=left, % 行号的位置在左边，启用后不方便复制代码。
    %numberstyle=\ttfamily, % 行号等宽字体。
    %xleftmargin=\parindent, % 代码左边框起始位置（启用行号时建议启用这个）。
    %frame=trBL, % 代码框类型，t下，r右，b下，l左，大写时为两条线。
    %frameround=fttt, % 控制代码框是否为圆角。
    frameshape={{ryrynyyyy}{yny}{yny}{ryrynyyyy}}, % 控制边框样式，上下边是每三个字母段控制一条边框。
    backgroundcolor=\color{gray!10}, % 代码框背景颜色：10% 的灰色。
    breaklines=true,% 代码过长时则换行。
    gobble=4, % 移除代码前多余的缩进，默认行头和代码的缩进距离为 0。
    aboveskip=-2pt, % 调整 listings 环境上方的垂直距离。
    belowskip=9pt, % 调整 listings 环境下方的垂直距离。
}

% -----------------------------------------------
% 列表环境 list 设定
% -----------------------------------------------
\RequirePackage{enumitem} % 支持设置列表环境。
\setlist{
    nosep, % 移除多余的垂直间距。
    left=0pt, % 移除缩进。
}

% -----------------------------------------------
% 图表环境设定
% -----------------------------------------------
% 图表说明文字 caption 设定
% position 参数只是告诉 caption 宏包 \caption 命令的位置（它会根据位置自动调整一些间距，但实际测试时却无区别），并无法由该命令指定 \caption 的实际位置。
\RequirePackage{caption} % 支持生成不带编号的图片等说明文字。
\captionsetup[figure]{position=below, skip=1pt} % 缩小 caption 和 figure 环境中图片的距离至 1pt，默认为 10pt。
\captionsetup[table]{position=above, skip=1pt} % 缩小 caption 和 table 环境中表格的距离至 1pt，默认为 10pt。
\captionsetup{font=small} % 设置 caption 字体大小为 5 号。

% 浮动体的垂直距离调整（以下设置只针对正文之间的浮动体，无法应对所有排版状况，如标题之下直接就是浮动体，排版异常请手动用 vspace 调整）。
\setlength{\intextsep}{7pt plus 1pt minus 1pt} % 该长度涉及浮动体的 h 参数。
\RequirePackage{etoolbox}
\AtBeginEnvironment{figure}{\vspace*{5pt}}
\AtEndEnvironment{figure}{\vspace*{-5pt}}
\AtEndEnvironment{table}{\vspace*{-4pt}}

% 跨页表格环境的垂直距离调整。
\RequirePackage{longtable} % 提供排版跨页长表格的 longtable 环境。
\setlength{\LTpre}{9pt plus 1pt minus 1pt}
\setlength{\LTpost}{3pt plus 1pt minus 1pt}

% 加载其他的图表相关宏包。
\RequirePackage{wrapfig} % 支持图文并排。
\RequirePackage{subfigure} % 支持子图表和子标题，可做瀑布流排版。
\RequirePackage{tikz,tikz-qtree} % 支持画图。
\RequirePackage{multirow} % 支持纵向合并列表。
\RequirePackage{booktabs} % 支持排版三线表。
\RequirePackage{array} % 支持扩展表格列格式，如修改字体族或添加特定符号
\RequirePackage{colortbl} % 支持修改表格的行、列、单元格的颜色。
\RequirePackage{makecell} % 支持在单元格里排版多行内容（嵌套一个单列的小表格）。
\RequirePackage{diagbox} % 排版斜线表头。

% -----------------------------------------------
% 其他宏包
% -----------------------------------------------
\RequirePackage{xcolor} % 支持生成颜色。
\RequirePackage[normalem]{ulem} % 支持删除线等，normalem 选项禁止 ulem 宏包重定义 \emph 命令（ulem 定义 \emph 为下划线）。
\RequirePackage{multicol} % 支持多栏排版。
\RequirePackage{fontawesome} % 支持 fontawesome 图标排版。
