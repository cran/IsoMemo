
<!-- README.md is generated from README.Rmd. Please edit that file -->

# IsoMemo

<!-- badges: start -->

[![R-CMD-check](https://github.com/Pandora-IsoMemo/isomemo-data/workflows/R-CMD-check/badge.svg)](https://github.com/Pandora-IsoMemo/isomemo-data/actions)
<!-- badges: end -->

IsoMemo is a Big Data initiative bringing together isotopic data from
archaeology, ecology, and environmental & life sciences. Isotopic
tracers are used across a variety of research fields to provide a rich
diversity of scientific information, but lack of centralized storage
limits efficient data use. The IsoMemo initiative brings together
independent repositories of isotopic data within the fields of
archaeology, ecology, and environmental & life sciences. The goals of
the initiative are to make isotopic data easily findable and accessible
so that it can be easily reused for research purposes. IsoMemo also
promotes the creation of data standards and interoperability with other
types. Within IsoMemo each independent database self-manages and curates
their data and defines metadata requirements. However, the initiative
also promotes the creation of networks linking different databases.

This R package to retrieve data from Max-Planck-Institute (MPI) IsoMemo
Web-application API and publish on CRAN for public download. For more
information and access all IsoMemo Apps: <https://isomemoapp.com/>

*Isomemo Project Director:*

-   Dr. Ricardo Fernandes: <fernandes@shh.mpg.de>
-   Max Planck Institute for the Science of Human History. School of
    Archaeology (University of Oxford)

*Developer*: INWT Statistics GmbH

-   API developer: Andreas Neudecker, INWT
    <andreas.neudecker@inwt-statistics.de>
-   Maintainer: Jianyin Roachell, INWT
    <jianyin.roachell@inwt-statistics.de>

## Installation

You can install the released version of IsoMemo from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("IsoMemo")
#> Installing package into '/nethome/jroachell/R/x86_64-pc-linux-gnu-library/4.2'
#> (as 'lib' is unspecified)
#> Warning: package 'IsoMemo' is not available for this version of R
#> 
#> A version of this package for your version of R might be available elsewhere,
#> see the ideas at
#> https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages
```

And the development version from [GitHub](https://github.com/) with:

``` r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("IsoMemo")
#> Installing package into '/nethome/jroachell/R/x86_64-pc-linux-gnu-library/4.2'
#> (as 'lib' is unspecified)
```

## Example of how to use the package:

``` r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("IsoMemo")
#> Installing package into '/nethome/jroachell/R/x86_64-pc-linux-gnu-library/4.2'
#> (as 'lib' is unspecified)

library(IsoMemo)
## basic example code
df = getData(db="LiVES")
head(df)
#>   source   id                        description  d13C d15N latitude longitude
#> 1  LiVES 1000 Ajdovska Jama 21 , S Neo (Lengyel) -20.4  9.0  45.9667   15.4833
#> 2  LiVES 1001  Ajdovska Jama 3 , S Neo (Lengyel) -20.6  8.1  45.9667   15.4833
#> 3  LiVES 1002  Ajdovska Jama 6 , S Neo (Lengyel) -20.8  9.0  45.9667   15.4833
#> 4  LiVES 1003  Ajdovska Jama 7 , S Neo (Lengyel) -20.3  8.1  45.9667   15.4833
#> 5  LiVES 1004    Ajdovska Jama , S Neo (Lengyel) -22.4  5.8  45.9667   15.4833
#> 6  LiVES 1005    Ajdovska Jama , S Neo (Lengyel) -21.0  6.6  45.9667   15.4833
#>            site dateMean dateLower dateUpper dateUncertainty  datingType
#> 1 Ajdovska Jama     5365      4328      4055              31 radiocarbon
#> 2 Ajdovska Jama     5421      4340      4235              30 radiocarbon
#> 3 Ajdovska Jama     5436      4344      4244              30 radiocarbon
#> 4 Ajdovska Jama     5485      4448      4243              50 radiocarbon
#> 5 Ajdovska Jama     4250      4450      4050             100      expert
#> 6 Ajdovska Jama     4250      4450      4050             100      expert

# with category argument
df = getData(db="LiVES",category = "Location")
head(df)
#>   latitude longitude          site
#> 1  45.9667   15.4833 Ajdovska Jama
#> 2  45.9667   15.4833 Ajdovska Jama
#> 3  45.9667   15.4833 Ajdovska Jama
#> 4  45.9667   15.4833 Ajdovska Jama
#> 5  45.9667   15.4833 Ajdovska Jama
#> 6  45.9667   15.4833 Ajdovska Jama

# with field argument
df = getData(db="LiVES",category = "Location",field= "latitude")
head(df)
#>   latitude
#> 1  45.9667
#> 2  45.9667
#> 3  45.9667
#> 4  45.9667
#> 5  45.9667
#> 6  45.9667
```
