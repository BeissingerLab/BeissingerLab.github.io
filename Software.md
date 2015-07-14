---
layout: page
title: Software
permalink: /Software/
---
<head>
    <script type="text/javascript"
            src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
    </script>
</head>

<div style="float: left; padding-right: 15px">
    <a><img src="/img/GenWin.jpg" alt="GenWin" title="GenWin" width="250" border="1"></a>
</div>


### GenWin

GenWin is an R package that defines window or bin boundaries for the analysis of genomic data. Boundaries are based on the inflection points of a cubic smoothing spline fitted to the raw data. Along with defining boundaries, a technique to evaluate results obtained from unequally-sized windows is provided. Applications are particularly pertinent for, though not limited to, genome scans for selection based on variability between populations (e.g. using Wright's fixations index, Fst, which measures variability in subpopulations relative to the total population).

[GenWin](http://cran.r-project.org/web/packages/GenWin/index.html){:target="_blank"} is available on CRAN, the Comprehensive R Archive Network.

<br>
------------

### Useful Scripts
[VectorFst.R](http://beissingerlab.github.io/docs/vectorFst.R) is a simple R function that can be used to calculate locus-by-locus \\(F_{ST}\\) values from allele frequency data. Basic documentation is included in the header of the file. Load into R with "source()", or by copy-pasting the text of the script.
