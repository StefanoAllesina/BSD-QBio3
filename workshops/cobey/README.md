---
output: pdf_document
---
# Unraveling dynamics from time series
Instructors: [Sarah Cobey](http://cobeylab.uchicago.edu/people/cobey) and [Sylvia Ranjeva](http://cobeylab.uchicago.edu/people/ranjeva)

[BSD Bootcamp on Quantitative Biology @ MBL](https://bsdgrad.uchicago.edu/page/mbl-quantitative-approaches-bootcamp)

## Goal
The aim of this workshop is to show how mathematical models can be used to investigate dynamical systems. We will begin by constructing and analyzing simple models of the spread of an infectious disease. We'll work with pencil and paper (or the whiteboard versions) before simulating the dynamics in R. We'll see that small nonlinearities can generate complex dynamics, which we can summarize with bifurcation diagrams. Finally, we'll discuss the use of likelihood in model fitting and review the criteria by which to judge a model. 

At the end of the workshop, students should have facility analyzing simple models analytically and simulating systems of differential equations in R. They should also understand the steps involved in creating bifurcation diagrams. Conceptually, they should understand the spectrum of "mechanistic" to "statistical" models and the limitations of analyses based on correlations and linear assumptions. They should also be able to define the concept of the likelihood and rank factors to consider in judging the strength of a model. 

## Audience
This workshop is intended for biologists investigating nonlinear dynamical systems. The material is thus relevant to molecular and cell biologists, population geneticists, ecologists, immunologists, etc. The lecture assumes some familiarity with ordinary differential equations (ODEs), and the exercises assume familiarity with R. Although both ODEs and R will be covered to some extent in the tutorials, if you are eager to test your knowledge, you can inspect the code and suggested readings below.   

## Installation
Please have a recent version of R installed before the workshop. We will also use the [deSolve](https://cran.r-project.org/web/packages/deSolve/index.html) package. It would be helpful if you could try installing this package before the workshop. 

## Workshop resources
* [Slides](http://cobeylab.uchicago.edu/slides/mbl-workshop/slides.html#/)
* [Code](https://github.com/StefanoAllesina/BSD-QBio2/tree/master/workshops/cobey/code)
* Data: We will not be analyzing any real data as part of the workshop. However, if you have a time series in mind that you would like to focus on, please contact the instructors beforehand.

## Readings and additional resources
These readings are not mandatory, but they review some of the techniques and models we will cover in the workshop.

* [Lotka-Volterra Model (Wikipedia)](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equation)
* [Compartmental SIR Models (Wikipedia)](https://en.wikipedia.org/wiki/Compartmental_models_in_epidemiology)
* [Chaos theory (Wikipedia)](https://en.wikipedia.org/wiki/Chaos_theory)
* [May 1976](https://github.com/StefanoAllesina/BSD-QBio2/raw/master/workshops/cobey/readings/may.pdf): "Simple mathematical models with very complicated dynamics"
* [Earn et al. 2000](https://github.com/StefanoAllesina/BSD-QBio2/raw/master/workshops/cobey/readings/earn.pdf): "A simple model for complex dynamical transitions in epidemics"
* [Shrestha et al. 2011](http://journals.plos.org/ploscompbiol/article?id=10.1371%2Fjournal.pcbi.1002135): "Statistical inference for multi-pathogen systems"
