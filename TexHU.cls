\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TexHU}[2023/06/10 A LaTeX template for THUers.]

\LoadClass[12pt]{article}

\RequirePackage{iftex}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{pgfplots}
\RequirePackage{adjustbox}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{ulem}
\RequirePackage[yyyymmdd]{datetime}

% define fonts
\RequirePackage[fontset=none]{ctex}
\RequirePackage{xeCJK}
\RequirePackage{amsmath,amssymb}
\RequirePackage{unicode-math}
\RequirePackage{fontspec}

% specify Chinese fonts
\setCJKmainfont[BoldFont=HYQiHei_80S.ttf]{HYKaiTiS.ttf}
\setCJKmonofont{FZFSJW.TTF}
\setCJKfamilyfont{cfs}{HYCuFangSongJ.ttf}

% set English fonts to Times family, and Courier for mono.
\setmainfont{TeX Gyre Termes}
\setmathfont{TeX Gyre Termes Math}
\setmonofont{TeX Gyre Cursor}[Scale=0.85,FakeBold=3]

\newcommand{\cfs}{\CJKfamily{cfs}}
\newfontfamily\cfsEn{HYCuFangSongJ.ttf}
\newfontfamily\texgyrepagella{TeX Gyre Pagella}

% basic settings
\pgfplotsset{compat=1.18}
\renewcommand{\today}{\the\year/\twodigit{\the\month}/\twodigit{\the\day}}
\newcommand{\sectionDivider}{%
    \vspace{0.1in}
    \centerline{\dashuline{\hspace{0.4\linewidth}}}
}

% define styles of different titles
\titleformat{\section}{\normalfont\Large\bfseries}{}{0pt}{
    \color{black}$\blacksquare$~~
}
\titleformat{\subsection}{\normalfont\large\bfseries}{}{0pt}{
    \color{black}$\blacktriangleright$~~
}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{}{0pt}{
    \color{black}$\maltese$~~
}

\newcommand{\titleZh}[1]{\def\@titleZh{#1}}
\newcommand{\@titleZh}{中文标题}
\newcommand{\studentid}[1]{\def\@studentid{#1}}
\newcommand{\@studentid}{2020010688}

% redefine \maketitle
\renewcommand{\maketitle}{
    \begin{adjustbox}{width=\textwidth}
        \begin{minipage}[c]{\linewidth}
            \begin{tikzpicture}[remember picture, overlay]
                \draw[line width=0.1in] (0in,-0.5in) -- ++(0, -1in);
                \node [anchor=north west, align=left, minimum height=1in,,execute at begin node=\setlength{\baselineskip}{20pt}] at ([xshift=1.25in, yshift=-1.5in]current page.north west) {%
                    \huge\textbf{\@titleZh}\\
                    \texgyrepagella\Large\bfseries\textsc{\@title}
                };
                \node [anchor=north east] at ([xshift=-0.5in, yshift=-0.5in]current page.north east) {%
                    \includegraphics[height=0.95cm]{assets/thu.pdf}
                };
                \node [anchor=north west, align=left,execute at begin node=\setlength{\baselineskip}{10pt}] at ([xshift=0.5in, yshift=-0.5in]current page.north west) {%
                    \scriptsize \cfs 姓名：\underline{\@author} \\
                    \scriptsize \cfs 学号：\underline{\cfsEn \@studentid} \\
                    \scriptsize \cfs 日期：\underline{\cfsEn \today}
                };
            \end{tikzpicture}
            \vspace{2in}
        \end{minipage}
    \end{adjustbox}
}

% options edit
\DeclareOption{texList}{\def\@texList{true}}
\DeclareOption{hyper}{\def\@hyper{true}}

\ProcessOptions\relax

\ifdefined\@texList
    \RequirePackage{listings}
    \RequirePackage{tcolorbox}
    \tcbuselibrary{listings}
    \lstdefinestyle{texStyle}{
        backgroundcolor=\color{gray!10},
        frame=none,
        basicstyle=\ttfamily\footnotesize,
        breaklines=true,
        postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
        columns=fullflexible,
    }
    \newtcblisting[auto counter]{texList}[1][]{
        listing only,
        colback=gray!10,
        colframe=violet!10,
        listing options={style=texStyle},
        arc=2.5mm,
        boxrule=0.5pt,
        left=10pt,
        top=0pt,
        bottom=0pt,
        #1
    }
\fi
\ifdefined\@hyper
    \RequirePackage{hyperref}
    \hypersetup{
        colorlinks=true,
        linkcolor=violet,
        filecolor=blue,      
        urlcolor=red,
        citecolor=green,
    }
\fi

\endinput