\ProvidesClass{mybook}

\LoadClass[a4paper, oneside]{book}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{ctex}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{calc}
\RequirePackage{anyfontsize}
\RequirePackage{ctex}
\RequirePackage{xcolor,colortbl}
\RequirePackage{booktabs}

\definecolor{BlueViolet}{RGB}{45, 52, 151}

\RequirePackage[colorlinks,linkcolor=BlueViolet]{hyperref}
\RequirePackage{titlesec}
\RequirePackage{xpatch}

%自定义命令
\newcommand{\explain}{\noindent\textbf{Explain} }
\newcommand{\examples}{\noindent\textbf{Examples}}
\newcommand{\nitem}[2]{\item\makebox[9em][l]{#1}#2}
\newenvironment{nlist}[2]{\explain#1\quad #2 \\ \examples\begin{itemize}}{\end{itemize}}

\newcommand{\subtitle}[1]{
    \newcommand{\@subtitle}{#1}
}

%章节样式
\newcommand{\mychapter}[1]{
	\ifnum \thechapter>0
	\hspace{-0.4cm}
	\begin{tabular}{p{0.01\textwidth}p{0.91\textwidth}}
		\cellcolor{black} &\cellcolor{BlueViolet} \textcolor{white}
		{\color{white} \newline \Huge Chapter \thechapter \quad #1}
		\end{tabular}
	\arrayrulewidth=0.4pt
	% \vspace{-2cm}
	\else
	{\Huge #1}
	\fi
}
\titleformat{\chapter}[hang]{\bfseries}{}{0mm}{\mychapter}
\titlespacing{\chapter}{0pt}{*4}{2cm}

%Part样式
\xpatchcmd{\part}{\thispagestyle{plain}}
      {\pagecolor{BlueViolet}\thispagestyle{empty}
	  \begin{tikzpicture}[remember picture,overlay]
		\begin{scope}
			\foreach \i in {2.5,...,22}
				{\node[rounded corners,BlueViolet!90,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.west)+(2.5,-5)$) {} ;}
		\end{scope}
	
		\foreach \i in {0.5,...,22}
			{\node[rounded corners,BlueViolet!90,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.north west)+(2.5,0)$) {} ;}
	
		\foreach \i in {0.5,...,22}
			{\node[rounded corners,BlueViolet!98,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.north east)+(0,-9.5)$) {} ;}
	
		\foreach \i in {21,...,6}
			{\node[BlueViolet!95,rounded corners,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.south east)+(-0.2,-0.45)$) {} ;}
	\end{tikzpicture}
	\color{white}}{}{}
\xpatchcmd{\@endpart}{\vfil\newpage}{\vfil\newpage
              \pagecolor{white}\color{black}}{}{}

%封面样式
\renewcommand{\maketitle}{
\begin{tikzpicture}[remember picture,overlay]
	\fill[BlueViolet] (current page.south west) rectangle (current page.north east);


	% Background Hexagon
	\begin{scope}
		\foreach \i in {2.5,...,22}
			{\node[rounded corners,BlueViolet!90,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.west)+(2.5,-5)$) {} ;}
	\end{scope}

	\foreach \i in {0.5,...,22}
		{\node[rounded corners,BlueViolet!90,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.north west)+(2.5,0)$) {} ;}

	\foreach \i in {0.5,...,22}
		{\node[rounded corners,BlueViolet!98,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.north east)+(0,-9.5)$) {} ;}

	\foreach \i in {21,...,6}
		{\node[BlueViolet!95,rounded corners,draw,regular polygon,regular polygon sides=6, minimum size=\i cm,ultra thick] at ($(current page.south east)+(-0.2,-0.45)$) {} ;}

	% Title of the Report
	\node[left,BlueViolet!5,minimum width=0.625*\paperwidth,minimum height=3cm, rounded corners] at ($(current page.north east)+(0,-9.5)$){{\fontsize{25}{30} \heiti \@title}};

	% Subtitle
	\node[left,BlueViolet!10,minimum width=0.625*\paperwidth,minimum height=2cm, rounded corners] at ($(current page.north east)+(0,-11)$){{\huge \kaishu{\@subtitle}}};

	% Author Name
	\node[left,BlueViolet!5,minimum width=0.625*\paperwidth,minimum height=2cm, rounded corners] at ($(current page.north east)+(0,-13)$){{\Large \kaishu{\@author}}};

	% Year
	\node[rounded corners,fill=BlueViolet!95,text =BlueViolet!5,regular polygon,regular polygon sides=6, minimum size=2.5 cm,inner sep=0,ultra thick] at ($(current page.west)+(2.5,-5)$) {\LARGE \bfseries \@date};

\end{tikzpicture}
}