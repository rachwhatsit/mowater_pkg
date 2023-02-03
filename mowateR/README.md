---
output:
  html_document: default
  pdf_document: default
---
# mowateR

This is a package of real data sets curated from two+ years of collaboration between data scientists and water/wastewater treatment experts. <img src = '/Users/lukedurell/Box Sync/education/teaching/current mowater pkg/mowateR/mo_hex.png' align = "right" height = 139>

 


## Description
mowateR is a collection of real data sets from the Mo(Wa)$^{2}$TER (Modernizing Water and Wastewater Treatment through data science Education and Research) program. This program exists to help train the next generation of data scientists by providing a pre-requisite free Introduction to Data Science course and a summer mini-REU for undergraduate students. More information can be found [here](https://www.baylor.edu/mowater/).

## Getting Started

### Dependencies

* If you are downloading this package, you probably already have R and RStudio, but just in case...
  * [R](https://www.r-project.org/)
  * [RStudio](https://www.rstudio.com/products/rstudio/download/#download)
* If you use windows, you need [Rtools](https://cran.r-project.org/bin/windows/Rtools/rtools40.html)

### Installing

After downloading the `tar.gz` file, run the following code in RStudio:

```
install.packages("path/mowateR_0.1.tar.gz", repos = NULL, type = "source")
```

* Alternative approach (unix only):
  * On the command line, navigate to the directory containing the ```mowateR_0.1.tar.gz``` file
  * ``` R CMD install "mowateR_0.1.tar.gz"```

### Using the package

Use ``` library(mowateR)``` to load the package and then use ``` data(data_set_name)``` to load any of the data sets from the package. 

## Help

``` ?mowateR``` returns the full list of data sets. All data sets have help files that can be accessed with ``` `?` ``` or ```help()```

## Authors

* Luke Durell
	* [\@lukedurell](https://twitter.com/lukedurell)
* Amanda S. Hering
	* [website](https://sites.baylor.edu/mandy_hering/)

## Version History

* 0.1 
  * initial release


## License
This project is licensed under the MIT-license. See LICENSE.md for details.