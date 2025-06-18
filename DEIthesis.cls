%% DEIthesis.cls
%% Cleaned-up LaTeX class for a Master's Thesis at University of Padua, DEI

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DEIthesis}[2025 DEI Thesis Class]

%% Base class
\LoadClass[12pt, a4paper, oneside]{book}

%% Page Geometry
\RequirePackage[
  top=2.5cm,
  bottom=3cm,
  left=2.5cm,
  right=2.5cm,
  headheight=14pt,
  footskip=1.5cm,
  a4paper
]{geometry}

%% Fonts and Encoding
\RequirePackage{newpxtext,newpxmath}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}

%% Essential Packages
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{amsmath}
\RequirePackage{hyperref}
\RequirePackage{pdfx}
\RequirePackage{colorprofiles}
\RequirePackage{watermark}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{adjustbox}
\RequirePackage{booktabs} 
\RequirePackage[backend=biber]{biblatex}
\addbibresource{references.bib}
\RequirePackage{listings}
\RequirePackage{acronym}



%% Define UniPD Red
\definecolor{UniPDColor}{RGB}{155, 0, 20}

%% Chapter, Section, Subsection Formatting
\titleformat{\chapter}[display]
  {\Huge\filleft}
  {\minsizebox{!}{70pt}{\colorbox{UniPDColor}{\color{white} \thechapter}}}
  {1.2ex}
  {}

\titleformat{\section}[hang]
  {\Large}
  {\colorbox{UniPDColor}{\color{white} \thesection}}
  {1ex}
  {\scshape}

\titleformat{\subsection}[hang]
  {\large}
  {\colorbox{UniPDColor}{\color{white} \thesubsection}}
  {1ex}
  {\scshape}

\titleformat{\subsubsection}[hang]
  {\normalsize}
  {}
  {0ex}
  {\bfseries\scshape}

\titleformat{\paragraph}[block]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}

%% Fancyhdr Setup
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RO]{\footnotesize\leftmark}
\fancyhead[LE]{\footnotesize\rightmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}

%% Title Page
\def\title#1{\gdef\@title{#1}}
\def\author#1{\gdef\@author{#1}}
\def\studentId#1{\gdef\@studentId{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\university#1{\gdef\@university{#1}}
\def\mastername#1{\gdef\@mastername{#1}}
\def\academicYear#1{\gdef\@academicYear{#1}}

\renewcommand{\maketitle} {
  \newgeometry{
    top=1cm,
    bottom=1.5cm,
    inner=2cm,
    outer=2cm,
    headheight=1cm,
    includehead,
    includefoot,
  }

  \setlength{\headwidth}{\textwidth}
  \thiswatermark{\centering\put(-380,-700){\includegraphics[width=1.4\linewidth]{res/unipdbg}}}
  \thispagestyle{empty}

  \fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
  }

  \begin{center}
    \begin{minipage}{0.45\textwidth}
      \raggedright
      \includegraphics[height=3cm]{res/ltunipd}
    \end{minipage}%
    \hfill
    \begin{minipage}{0.45\textwidth}
      \raggedleft
      \includegraphics[height=3cm]{res/dei}
    \end{minipage}
  \end{center}

  \begin{center}
    \vspace*{1.5cm}
    {\normalsize\textsc{Master's Thesis in \@mastername}} \\[3ex]
    {\begin{spacing}{1.6}\LARGE\bfseries \@title\end{spacing}} \\[10ex]
  \end{center}

  \begin{center}
    \begin{tabular}{p{0.45\textwidth} p{0.45\textwidth}}
      \raggedright \begin{spacing}{1}\large Master Candidate\end{spacing} \\
      \begin{spacing}{1}\textbf{\Large \@author}\end{spacing} \\ \raggedright \large Student ID: \@studentId &
      \raggedleft \begin{spacing}{1}\large Advisor\end{spacing} \\
      \raggedleft \textbf{\Large \@advisor}
    \end{tabular}
  \end{center}

  \vfill
  \begin{center}
    {\normalsize \@university} \\[4ex]
    {\large \@academicYear}
  \end{center}

  \null
  \restoregeometry
}

%% ---- BACKMATTER ----
\renewcommand{\backmatter}{
  \cleardoublepage
  \phantomsection

  % add references
  \addcontentsline{toc}{chapter}{\bibname}
  \printbibliography

  \cleardoublepage
  \phantomsection

  % add acknowledgments
  \addcontentsline{toc}{chapter}{\acknowledgmentsname}
  \acknowledgments

  \cleardoublepage
  \phantomsection

  % start appendices
  \appendix
}

% -- CODE SNIPPETS --

% Colors for code snippets highlights
\definecolor{commentsColor}{RGB}{36, 161, 156}
\definecolor{numColor}{RGB}{71, 96, 114}
\definecolor{stringColor}{RGB}{205, 63, 62}
\definecolor{kwColor}{RGB}{248, 6, 204}
\definecolor{bgCodeColor}{RGB}{255, 249, 249}

% Style of code snippets
\lstdefinestyle{codeSnippet} {
  backgroundcolor=\color{bgCodeColor},
  commentstyle=\color{commentsColor},
  keywordstyle=\color{kwColor},
  numberstyle=\tiny\color{numColor},
  stringstyle=\color{stringColor},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,         
  breaklines=true,                 
  captionpos=b,                    
  keepspaces=true,                 
  numbers=left,                    
  numbersep=5pt,                  
  showspaces=false,                
  showstringspaces=false,
  showtabs=false,                  
  tabsize=2
}

\lstset{style=codeSnippet}


%% Prevent unwanted blank pages while keeping page numbers
\makeatletter
\renewcommand{\cleardoublepage}{%
  \clearpage
  \if@twoside
    \ifodd\c@page
    \else
      \thispagestyle{fancy}\null\clearpage
    \fi
  \fi
}
\makeatother