\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TexHU}[2023/06/10 A LaTeX template for THUers.]

\LoadClass{article}

\RequirePackage{iftex}
\RequirePackage[margin=1in]{geometry}

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

% redefine \maketitle
% \renewcommand{\maketitle}{

% }

\endinput