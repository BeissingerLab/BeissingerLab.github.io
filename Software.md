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

-----------------------------------------
<div style="float: left; padding-right: 15px; padding-top: 15px">
    <a><img src="/img/Figure4C.jpg" alt="D'2_IS" title="D'2_IS" width="250" border="1"></a>
</div>


### Ohta.D.Stats
The [Ohta.D.Stats](http://beissingerlab.github.io/docs.Ohta.D.Stats.R) R function can be implemented to calculate Tomoko Ohta's partitioning on linkage disequilibrium, deemed D-statistics, for pairs of loci. The code is written so that it can be scaled-up to form a genome-wide test, by implementing the function repeatedly across pairs of loci in a genotype table. See our [Heredity paper](http://www.nature.com/hdy/journal/vaop/ncurrent/abs/hdy201581a.html){:target="_blank"} for an example of this function in action.

<br>
<br>

-----------------------------------------

### Useful Scripts
[DriftSimulator.R](http://beissingerlab.github.io/docs/DriftSimulator.R) is an R function for conducting simulations of genetic drift at a single locus. Initial frequency, number of generations, and population demographics can all be manipulated, and plotting is simple. Documentation is in the header of the file. Load into R with "source()", or by copy-pasting the text of the script.

[DriftSimulatorWithBottlenecks.R](http://beissingerlab.github.io/docs/DriftSimulatorWithBottlenecks.R) is very similar to the above R function for conducting simulations of genetic drift at a single locus, but also enables the user to specify a bottleneck event. Documentation is in the header of the file. Load into R with "source()", or by copy-pasting the text of the script.

[VectorFst.R](http://beissingerlab.github.io/docs/vectorFst.R) is a simple R function that can be used to calculate locus-by-locus \\(F_{ST}\\) values from allele frequency data. Basic documentation is included in the header of the file. Load into R with "source()", or by copy-pasting the text of the script.

[ModifiedRogersDistanceFunction.R](http://beissingerlab.github.io/docs/ModifiedRogersDistanceFunction.R) is a basic function for calculating the modified Roger's genetic distance between individuals. The calculation is simple, but I'm not aware of other implementations in R. Apply to a dataframe with individuals in rows and markers in columns. There should be two columns per marker (one column for each allele), coded as 0, 1, or 2. 