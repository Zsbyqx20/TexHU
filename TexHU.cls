\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TexHU}[2023/06/10 A LaTeX template for THUers.]

\LoadClass{article}

\RequirePackage{iftex}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{pgfplots}
\RequirePackage{adjustbox}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{ulem}
\RequirePackage[yyyymmdd]{datetime}

% Determine the compiler type
\ifPDFTeX
    \usepackage{libertine}
    \usepackage{libertinust1math}
    \usepackage[T1]{fontenc}
\else
    \RequirePackage[fontset=none]{ctex}
    \RequirePackage{xeCJK}
    \RequirePackage{libertinus}
    \RequirePackage{fontspec}
    \setCJKmainfont[BoldFont=HYQiHei_80S.ttf, ItalicFont=HYKaiTiS.ttf]{FZFSJW.TTF}

    \setCJKfamilyfont{cfs}{HYCuFangSongJ}
    \newcommand{\cfs}{\CJKfamily{cfs}}
    \newfontfamily\cfsEn{HYCuFangSongJ}
\fi

% basic settings
\pgfplotsset{compat=1.18}
\renewcommand{\dateseparator}{/}
\newcommand{\sectionDivider}{%
    \vspace{0.1in}
    \centerline{\dashuline{\hspace{0.4\linewidth}}}
}
\titleformat{\section}{\normalfont\Large\bfseries}{}{0pt}{
    \color{black}\rule{\dimexpr\fontcharht\font`X}{\dimexpr\fontcharht\font`X}\quad
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
                    \Large\bfseries\textsc{\@title}
                };
                \node [anchor=north east] at ([xshift=-0.5in, yshift=-0.5in]current page.north east) {%
                    \includegraphics[height=0.95cm]{assets/thu.eps}
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

\endinput