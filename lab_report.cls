\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lab_report}[2017/11/16 Chemistry Lab Report]

\LoadClass{article}
%\RequirePackage[table]{xcolor}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{siunitx}
\RequirePackage{chemfig}
\RequirePackage{caption}
\RequirePackage{graphicx}
\RequirePackage{examplep}
\RequirePackage[flushleft]{threeparttable}
\RequirePackage[version=3]{mhchem}
\RequirePackage[T1]{fontenc}
\RequirePackage[obeyspaces]{url}
\RequirePackage{hyperref}
\RequirePackage{float}

% set up basic page format
\geometry{letterpaper, bottom=30mm}
\pagestyle{fancy}
\let\ps@plain\ps@fancy
\fancyhf{}
\rhead{\@author\,|\,\@whichclass}
\lhead{\textbf{Lab Report:} \@title}
\rfoot{Page \thepage}

% define macros to handle lab partners and section
\newcommand{\@partners}{Sum Won} % default to 'Sum Won'
\newcommand{\partners}[2]{\renewcommand{\@partners}{#1, #2}}
\newcommand{\partner}[1]{\renewcommand{\@partners}{#1}}

\newcommand{\@whichclass}{CSE} % default to 'CSE'
\newcommand{\sect}[1]{\renewcommand{\@whichclass}{#1}}

% customize title with lab partners
\renewcommand{\maketitle}{
  \begin{center}
  {\vspace*{10mm}\LARGE\@title\par}
  {\vspace{7mm}\large\@author\par}
  {\vspace{1mm}\textit{\normalsize Lab Partners: \@partners}, \@whichclass\par}
  {\vspace{3mm}\large\@date\vspace{8mm}}
  \end{center}
}

% we want pretty looking section titles
% we'll leave subsections as they are
\titleformat{\section}
  {\Large\scshape\raggedright}
  {\thesection.\quad}{0em}{}
  [\titlerule]

% set up tables to simplify adding table notes
\captionsetup[table]{labelfont=sc,textfont=bf}
\newenvironment{chemtable}[3][H]{
  \begin{table}[#1]
    \centering
    \caption{#2}
    \label{#3}
    \begin{threeparttable}
}{
    \end{threeparttable}
  \end{table}
}
\newcommand{\chemnotes}[1]{
  \begin{tablenotes}
  \footnotesize
  \item #1
  \end{tablenotes}
}

% set up figures for some basic formatting
\captionsetup[figure]{labelfont=bf}
\newcommand{\fig}[4][H]{
  \begin{figure}[#1]
    \centering
    \includegraphics{#2}
    \caption{#3}
    \label{#4}
  \end{figure}
}

% easy-to-use citations
\newcommand{\chemcite}[4][\@date]{
  \bibitem{#2}#3,
  {\url{#4}},
  accessed #1
}
% one can optionally provide a date to use for the default entries
\newenvironment{chemrefs}[1][\@date]{
  \begin{thebibliography}{99}
    \chemcite[#1]{epa-srs}{EPA Substance Registry Service}{https://iaspub.epa.gov/sor_internet/registry/substreg/LandingPage.do}
    \chemcite[#1]{ghs-pict}{Safety Data Sheet Search}{http://chemicalsafety.com/sds-search/}
}{
  \end{thebibliography}
}

% define consistent, good-looking colors
%\definecolor{bold-blue}{HTML}{428FF4}
%\definecolor{blue}{HTML}{74AFFC}
