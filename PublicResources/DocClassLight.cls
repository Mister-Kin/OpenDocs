%! ----------------------------------------------
%! 作者：Mr. Kin
%! Email: im.misterkin@gmail.com
%! License: CC BY-NC-SA 4.0
%! ----------------------------------------------

%! ----------------------------------------------
%! 不要随便修改以下代码
%! 除非你懂得你在干什么
%! ----------------------------------------------

% -----------------------------------------------
% 版本设定
% -----------------------------------------------
\NeedsTeXFormat{LaTeX2e} % 该文类所需的 Tex 系统版本。
\ProvidesClass{DocClassLight}[2020/9/13 v1.2 General Document Template Light] %该文类的名称、发布日期、版本序号等。

% -----------------------------------------------
% 加载文类，并设定相关参数。
% 字体磅值为 11，纸张大小是 A4，单面排版（避免封面后一页为空白页），指定 \chapter 紧跟上一页开始，显式指定文档为 UTF-8 编码，fontset 设置为 none 以消除 Redefining CJKfamily xxx 的警告（不影响下面的字体设定）。
% -----------------------------------------------
\LoadClass[11pt,a4paper,oneside,openany,UTF8,fontset=none]{ctexbook}

% -----------------------------------------------
% 字体设定
% -----------------------------------------------
\RequirePackage{fontspec} % 支持修改西文字体族。
\setmainfont{Source Serif Pro}
\setsansfont{Source Sans Pro}
\setmonofont{Source Code Pro}
\RequirePackage{xeCJK} % 支持修改中文字体族。
\xeCJKsetup{AutoFakeSlant=true}  % 设置伪斜体属性，以支持生成斜体中文字体（需置于中文字体设置之前）。
\setCJKmainfont{思源宋体}
\setCJKsansfont{思源黑体}
\setCJKmonofont{思源黑体}

% -----------------------------------------------
% 一些信息设定
% -----------------------------------------------
% 文档信息
\newtoks\DocumentTitle
\newtoks\DocumentCreatedDate
% 文档作者信息
\newtoks\AuthorName

% -----------------------------------------------
% 封面设定
% -----------------------------------------------
\renewcommand{\maketitle}{%
    \thispagestyle{empty}
    {\sffamily%
    \vspace{10ex}
    \begin{flushright}
        \begin{tabular}{rl}
            Created : & \hspace{-0.7em} \the\DocumentCreatedDate \\
            Edited : & \hspace{-0.7em} \number\year/\number\month/\number\day \\
        \end{tabular}
    \end{flushright}
    \vspace{25ex}

    \begin{center}
        {\huge\bfseries \the\DocumentTitle}

        \vspace{3ex}
        Written by \textbf{\the\AuthorName}
        \vspace{3ex}
    \end{center}%
    }%
}

% -----------------------------------------------
% 文档布局设定
% -----------------------------------------------
\RequirePackage[margin=1in]{geometry} % 支持设置页面布局，页边距设置为 1 英寸。

% -----------------------------------------------
% 自定义环境设定
% -----------------------------------------------
% intro 环境，用以章节开头的文字介绍。排版上比普通正文多缩进两个文字。
\newenvironment{intro}{\narrower\sffamily}{\par\vspace*{2ex plus 2.5ex minus 1.5ex}}

% -----------------------------------------------
% 标题和目录设定
% -----------------------------------------------
% 全部标题设定为无衬线字体，即思源黑体。
% 其中，为不改变原标题样式，使用 += 在原基础上追加命令。
\ctexset{
    part/format+=\sffamily,
    chapter/format+=\sffamily,
    section/format+={\sffamily\raggedright},
    subsection/format+=\sffamily,
    subsubsection/format+=\sffamily,
    paragraph/format+=\sffamily,
    subparagraph/format+=\sffamily
}
% 修改目录排版样式。注意，tocloft 和 subfigure 宏包一起调用时，需指定 subfigure 参数。
\RequirePackage[subfigure]{tocloft}
\renewcommand{\cfttoctitlefont}{\huge\sffamily}
\renewcommand{\cftpartfont}{\bfseries\sffamily}
\renewcommand{\cftchapfont}{\bfseries\sffamily}
\renewcommand{\cftsecfont}{\sffamily}
\renewcommand{\cftsubsecfont}{\sffamily}
\renewcommand{\cftsubsubsecfont}{\sffamily}

\RequirePackage{tocbibind} % 支持添加目录本身和参考文献进目录中。
\RequirePackage[toc]{multitoc} % 支持排版多栏 toc 目录页，默认双栏。
\setcounter{tocdepth}{3} % 目录深度设定为 3。
\setcounter{secnumdepth}{3} % 章节编号深度设定为 3。

% -----------------------------------------------
% 参考文献和图片设定，及其相关路径设定。
% -----------------------------------------------
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex} % 支持排版参考文献。设置文献样式为符合中文文献著录标准的 GB/T 7714-2015 样式）, 使用默认的后端程序 biber（其支持更好，包括 UTF-8 等，而 [backend=bibtex] 后端程序只支持 ascii 编码）。
\addbibresource{resources/reference.bib} % 相对路径，指定参考文献数据库文件路径。

\RequirePackage{graphicx} % 支持插入图片。
\graphicspath{{resources/images/}} % 相对地址，指定文档路径下的图片路径。

% -----------------------------------------------
% 列表环境 list 设定
% -----------------------------------------------
\RequirePackage{enumitem} % 支持设置列表环境。
\setlist{
    nosep, % 去除垂直空白空间。
    left=0pt, % 去除缩进。
}

% -----------------------------------------------
% 图表环境设定
% -----------------------------------------------
% 图表说明文字 caption 设定
\RequirePackage{caption} % 支持生成不带编号的图片等说明文字。
\captionsetup[figure]{skip=2pt} % 缩小 caption 和 figure 环境中图片的距离至 3pt，默认为 10pt。
\captionsetup[table]{skip=2pt} % 缩小 caption 和 table 环境中图表的距离至 3pt，默认为 10pt。

\RequirePackage{wrapfig} % 支持图文并排。
\RequirePackage{subfigure} % 支持子图表和子标题，可做瀑布流排版。
\RequirePackage{tikz,tikz-qtree} % 支持画图。
\RequirePackage{multirow} % 支持纵向合并列表。
\RequirePackage{booktabs} % 支持排版三线表。
\RequirePackage{array} % 支持扩展表格列格式，如修改字体族或添加特定符号
\RequirePackage{colortbl} % 支持修改表格的行、列、单元格的颜色。
\RequirePackage{makecell} % 支持在单元格里排版多行内容（嵌套一个单列的小表格）。
\RequirePackage{diagbox} % 排版斜线表头。
\RequirePackage{longtable} % 提供排版跨页长表格的 longtable 环境。

% -----------------------------------------------
% 其他宏包
% -----------------------------------------------
\RequirePackage{xcolor} % 支持生成颜色。
\RequirePackage{ulem} % 支持删除线等。
\RequirePackage{multicol} % 支持多栏排版。
\RequirePackage{amsmath} % 支持复杂的数学公式排版。

% -----------------------------------------------
% 页眉页脚设定
% -----------------------------------------------
\RequirePackage{fancyhdr} % 为避免宏包冲突，一般在最后设置。调用 fancyhdr 宏包，以设置页眉页脚，文档风格设为：页眉为标题在左，页码在右；页脚为博客地址。
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{— \ \thepage \ —}
\setlength{\headheight}{13.6pt} % 消除 headheight 值过小的警告。
% part、chapter 首页的页眉页脚是由 plain style 决定的。
\fancypagestyle{plain}
{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{— \ \thepage \ —}
}

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
    backgroundcolor=\color{gray!5}, % 代码框背景颜色：5% 的灰色。
    breaklines=true,% 代码过长时则换行。
    gobble=8, % 去掉代码前多余的缩进。
}

% -----------------------------------------------
% 超链接和书签设定
% -----------------------------------------------
\RequirePackage[bookmarks=true]{hyperref} % 为不引起宏包冲突，hyperref 宏包一般在最后调用。调用 hyperref 宏包，bookmark 参数只能在调用时指定。
\hypersetup{
    colorlinks=true, % 设置超链接文件带颜色。
    bookmarksopen=true, % 书签展开。
    bookmarksnumbered=true, % 书签带章节编号。
}
