\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ituphd}[2026/10/04 v1.0 ITU PhD coursework class]

% ---- options: [notes] (default) or [homework] ------------------------------
\newif\if@ituhw \@ituhwfalse
\DeclareOption{notes}{\@ituhwfalse}
\DeclareOption{homework}{\@ituhwtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{notes}
\ProcessOptions\relax
\LoadClass[11pt,a4paper]{article}

% ---- packages ---------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[a4paper,margin=2.5cm,top=3cm,headheight=15pt]{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{microtype}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup{hypcap=false}
\RequirePackage{amsmath,amssymb,amsthm,mathtools,bm}
\RequirePackage{macros}              % your notation (common/macros.sty)
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{listings}
\RequirePackage[many]{tcolorbox}
\RequirePackage[hidelinks]{hyperref}

% ---- colors (sampled from the ITU logo files) -------------------------------
\definecolor{itublue}{HTML}{002856}
\definecolor{itugold}{HTML}{8D744B}
\hypersetup{colorlinks=true,linkcolor=itublue,citecolor=itublue,urlcolor=itublue}

% ---- course information (set these in your main.tex) -----------------------
\newcommand{\itulogofile}{itu-blue.pdf}   % switch logo here: itu-black.pdf, ...
\gdef\@coursetitle{Course Title}
\gdef\@coursecode{COURSE 000}
\gdef\@semester{2026 Fall}
\gdef\@ituunit{ITU, Control and Automation Engineering (PhD)}
\gdef\@duedate{}
\gdef\@studentid{}
\gdef\@instructor{}
\newcommand{\coursetitle}[1]{\gdef\@coursetitle{#1}}
\newcommand{\coursecode}[1]{\gdef\@coursecode{#1}}
\newcommand{\semester}[1]{\gdef\@semester{#1}}
\newcommand{\ituunit}[1]{\gdef\@ituunit{#1}}
\newcommand{\duedate}[1]{\gdef\@duedate{#1}}
\newcommand{\studentid}[1]{\gdef\@studentid{#1}}
\newcommand{\instructor}[1]{\gdef\@instructor{#1}}


% ---- optional logo: \renewcommand{\itulogofile}{} removes it ------------------
\newcommand{\@ituLogo}[1]{%
  \edef\@tmplogo{\itulogofile}%
  \ifx\@tmplogo\@empty\else
    \includegraphics[height=#1,trim=50 27 51 27,clip]{\itulogofile}%
  \fi}

% ---- title block ------------------------------------------------------------
\renewcommand{\maketitle}{%
  \begingroup
  \thispagestyle{ituplain}%
  \noindent
  \begin{minipage}[c]{0.40\textwidth}
    \@ituLogo{1.8cm}
  \end{minipage}\hfill
  \begin{minipage}[c]{0.56\textwidth}\raggedleft
    {\color{itublue}\bfseries\large\@coursetitle\par}
    {\small\@coursecode\ \textperiodcentered\ \@semester\par}
    {\small\@ituunit\par}
  \end{minipage}\par
  \vspace{5pt}{\color{itugold}\hrule height 1.2pt}\vspace{14pt}
  {\raggedright\color{itublue}\sffamily\bfseries\huge\@title\par}
  \vspace{6pt}
  {\large\@author\par}
  \ifx\@studentid\@empty\else{\small Student no.: \@studentid\par}\fi
  \ifx\@instructor\@empty\else{\small Instructor: \@instructor\par}\fi
  {\@date\par}
  \if@ituhw\ifx\@duedate\@empty\else{\small Due: \@duedate\par}\fi\fi
  \endgroup
  \bigskip}


% ---- cover page: \makecover (use instead of, or before, \maketitle) ---------
\newcommand{\@coverrow}[2]{\noindent\makebox[3.4cm][l]{\color{itugold}\sffamily\bfseries #1}#2\par\medskip}
\newcommand{\makecover}{%
  \begin{titlepage}
  \thispagestyle{empty}%
  \noindent\@ituLogo{3.2cm}\par
  \vspace{8pt}{\color{itugold}\hrule height 1.5pt}\vspace{6pt}
  {\large\color{itublue}\sffamily\@ituunit\par}
  \vspace{3cm}
  {\raggedright\color{itublue}\sffamily\bfseries\fontsize{26}{30}\selectfont\@coursetitle\par}
  \vspace{6pt}
  {\large\@coursecode\ \textperiodcentered\ \@semester\par}
  \vspace{1.6cm}
  {\raggedright\color{itublue}\sffamily\bfseries\Huge\@title\par}
  \vfill
  \@coverrow{Student}{\@author}
  \ifx\@studentid\@empty\else\@coverrow{Student no.}{\@studentid}\fi
  \ifx\@instructor\@empty\else\@coverrow{Instructor}{\@instructor}\fi
  \@coverrow{Date}{\@date}
  \if@ituhw\ifx\@duedate\@empty\else\@coverrow{Due}{\@duedate}\fi\fi
  \end{titlepage}%
  \setcounter{page}{1}}

% ---- headers / footers ------------------------------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.6em}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\color{itublue}\@coursetitle}
\fancyhead[R]{\small\color{itublue}\@title}
\fancyfoot[C]{\small\thepage}
\renewcommand{\headrulewidth}{0.6pt}
\renewcommand{\headrule}{{\color{itugold}\hrule width\headwidth height\headrulewidth}}
\fancypagestyle{ituplain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}\fancyfoot[C]{\small\thepage}}

% ---- headings ---------------------------------------------------------------
\titleformat{\section}{\Large\sffamily\bfseries\color{itublue}}{\thesection}{0.7em}{}
\titleformat{\subsection}{\large\sffamily\bfseries\color{itublue}}{\thesubsection}{0.7em}{}
\titleformat{\subsubsection}{\normalsize\sffamily\bfseries\color{itublue}}{\thesubsubsection}{0.7em}{}

% ---- theorem-like environments (shared numbering, boxed) --------------------
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{example}[theorem]{Example}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}

\tcbset{
  itubox/.style={enhanced,breakable,sharp corners,frame hidden,boxrule=0pt,
    left=9pt,right=6pt,top=4pt,bottom=4pt,before skip=8pt,after skip=8pt},
  thmstyle/.style={itubox,borderline west={2.5pt}{0pt}{itublue},colback=itublue!5},
  defstyle/.style={itubox,borderline west={2.5pt}{0pt}{itugold},colback=itugold!8},
}
\tcolorboxenvironment{theorem}{thmstyle}
\tcolorboxenvironment{lemma}{thmstyle}
\tcolorboxenvironment{proposition}{thmstyle}
\tcolorboxenvironment{corollary}{thmstyle}
\tcolorboxenvironment{definition}{defstyle}
\tcolorboxenvironment{assumption}{defstyle}

% ---- homework helpers -------------------------------------------------------
\newcounter{problem}
\newenvironment{problem}[1][]{%
  \refstepcounter{problem}\par\bigskip
  {\Large\sffamily\bfseries\color{itublue}Problem~\theproblem
   \ifx\relax#1\relax\else\ (#1)\fi}\par\smallskip}{\par}
\newtcolorbox{solution}{enhanced,breakable,sharp corners,frame hidden,
  borderline west={2pt}{0pt}{itugold},colback=white,left=9pt,
  before upper={\textbf{\color{itugold}Solution.}\ }}

% ---- figures: do not fail if a generated figure is missing ------------------
\newcommand{\figfile}[2][width=0.8\linewidth]{%
  \IfFileExists{#2}{\includegraphics[#1]{#2}}{%
    \fbox{\parbox{0.7\linewidth}{\centering\small\textcolor{red}{Missing figure: \texttt{\detokenize{#2}}\\ run the script in \texttt{code/}}}}}}

% ---- code listings (MATLAB / Python) ----------------------------------------
\lstset{basicstyle=\ttfamily\small,keywordstyle=\color{itublue}\bfseries,
  commentstyle=\color{itugold},breaklines=true,frame=single,
  rulecolor=\color{itublue!40},numbers=left,numberstyle=\tiny\color{gray},
  xleftmargin=1.5em}

\endinput
