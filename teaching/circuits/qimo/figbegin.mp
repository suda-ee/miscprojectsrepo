input boxes;
input graph;
input sarith;
verbatimtex
%&latex
\documentclass[a5paper, 12pt]{article}
\usepackage{textcomp}
\usepackage{mathptmx}
%\usepackage{wrisym}
\usepackage{amsmath}
\interdisplaylinepenalty=2500
% \usepackage{latexsym}
% \usepackage{amsfonts}
% \usepackage{amssymb}
\usepackage{stmaryrd,pifont}
\usepackage[thinspace, thinqspace, amssymb]{SIunits}
\usepackage[T1]{fontenc}
\usepackage{CJK}
\def\Varangle#1{\kern0.0625em\vtop{\hbox{\kern-0.0625em$/{#1}$}\kern-0.067829ex\hrule}}
\newcommand\phase[1]
        % Phase angle
{\setbox0=\hbox{$\mskip 7mu minus 4mu#1$}
\raise.21ex\hbox{$/$}\hskip-0.95ex
\underline{\raise\dp0\hbox{\box0}}}
\def\RSquote{'}
\begin{document}
\begin{CJK}{GBK}{song}
\newcommand\mathdot[1]{\dot#1}
\newcommand\jimag{\mathrm{j}}
etex            
