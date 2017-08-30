# Data Wrangling and Visualization

*Peter Carbonetto & John Novembre*

## How to build the course materials

Run the following commands in R from the [code](code) directory:

```R
library(rmarkdown)
render("dataviz.Rmd",output_format = "pdf_document",
       output_file = "dataviz.pdf")
```

## Instructor notes

Plotting concepts covered by the tutorial include:

+ Plotting workflow in R, and specifically using ggplot2 to produce
  plots, from basic to sophisticated.

+ Developing a "conceptual model" of ggplot2.

+ Getting the data ready for plotting (ggplot2 works best with data
  frames).

+ Exploring different plotting strategies to come up with the most
  effective visualization, and thinking critically about what makes a
  good visualization.

+ Tweaking a plot to turn it from a "rough cut" to an attractive,
  publication-ready figure (we will discuss "Best Practices" for
  plotting here.)

+ Different approaches to combining data into a single plot.

+ Creating histograms from continuous data.

+ Using ggplot2 to produce a custom, publication-quality "Manhattan
  plot" by plotting *p*-values across the genome.

+ Adding additional information to a Manhattan plot by mapping colour
  and shape to variables.

+ Fitting a regression model using "lm", and adding a regression line
  to a scatterplot.

+ Creating box plots and violin plots to compare a continuous variable
  against a categorical variable.

+ Combining box plot and violin plots, and creating customized plots
  using the "stat_summary" function from the ggplot package.

+ Experimenting with different plotting themes using the "ggthemes"
  package.

+ Creating sophisticated visual summaries of statistical analyses
  using the "ggfortify" package.

+ Creating a "correlation plot" using the ggcorrplot package.

+ How to save your plot in different formats (e.g., PDF, GIF) and how
  to embed your plot into an HTML file.

**Note:** Students in the advanced track get some brief intro to
tidyverse (including ggplot). The other students (~2/3) do not.


