## Welcome

This page contains important information about the [Third BSD-qBio Boot Camp @ MBL](https://biosciences.uchicago.edu/content/mbl-bootcamp-2017), which will be held at the [Marine Biological Laboratory](http://www.mbl.edu/) in Woods Hole, MA, on Sept 10-17, 2017.

More that 90 incoming graduate students from the different programs in the [Division of Biological Sciences](https://biosciences.uchicago.edu) at the [University of Chicago](http://www.uchicago.edu) will participate.

On this page, you find the instructions on how to **prepare your laptop** so that it's ready for the boot camp.

You should also **take a look at the data and the code** we will explore in the workshops and tutorials.

You can see the **schedule** of the boot camp, and find the contact information for the directors.

## Contacts

For any issue/question/comment, please contact the course directors:

*   [Stephanie Palmer](mailto:sepalmer@uchicago.edu?Subject=Help%20BSD%20QBio) ([webpage](http://http//palmerlab.uchicago.edu))
*   [Stefano Allesina](mailto:sallesina@uchicago.edu?Subject=Help%20BSD%20QBio) ([webpage](http://allesinalab.uchicago.edu/))
*   [Victoria Prince](mailto:vprince@uchicago.edu?Subject=Help%20BSD%20QBio) ([webpage](https://princelab-sites.uchicago.edu/))

## Schedule

The qBio3 boot camp will be, as the name implies, quite intense. We are going to have **Tutorials** (short primers to a certain topic) and **Workshops** (discipline-specific, hands-on activities). We will dedicate Monday night to **Professional Development**, with armchair discussions on how to get the most out of your graduate school.

You will get to know MBL better, with **Talks from MBL researchers**, a tour of the facilities, and even a **trip on the [Gemma](http://www.sciencemetropolis.com/wp-content/uploads/2008/06/img_0782.jpg)**.

Here's the [general schedule](https://github.com/StefanoAllesina/BSD-QBio3/raw/master/schedule/GeneralSchedule.pdf).

You can also browse the schedule [by group](https://github.com/StefanoAllesina/BSD-QBio3/tree/master/schedule).

## Computing tutorials

To accommodate the diverse background of our students, we have created two tracks for the computing tutorials.

*   Basic Computing I and II: dedicated to new users who are not familiar with `R` or programming in general. It will guide students step-by-step, introducing the `R` syntax and showing how to write well-organized code for data analysis and scientific research.
*   Advanced Computing I and II: dedicated to experienced `R` users, will focus on manipulating large data sets, plotting, the UNIX terminal, and the use of regular expressions.

To decide which track you want to choose, please consult the lecture materials, and make sure that the content is at the right level for you:

*   Basic Computing I ([web](https://github.com/StefanoAllesina/BSD-QBio3/blob/master/tutorials/basic_computing_1/code/basic_computing_1.Rmd), [pdf](https://github.com/StefanoAllesina/BSD-QBio3/raw/master/tutorials/basic_computing_1/code/basic_computing_1.pdf))
*   Basic Computing II ([web](https://github.com/StefanoAllesina/BSD-QBio3/blob/master/tutorials/basic_computing_2/code/basic_computing_2.Rmd), [pdf](https://github.com/StefanoAllesina/BSD-QBio3/raw/master/tutorials/basic_computing_2/code/basic_computing_2.pdf))
*   Advanced Computing I ([web](https://github.com/StefanoAllesina/BSD-QBio3/blob/master/tutorials/advanced_computing_1/code/advanced_computing_1.Rmd), [pdf](https://github.com/StefanoAllesina/BSD-QBio2/raw/master/tutorials/advanced_computing_1/code/advanced_computing_1.pdf))
*   Advanced Computing II ([web](https://github.com/StefanoAllesina/BSD-QBio3/blob/master/tutorials/advanced_computing_2/code/advanced_computing_2.Rmd), [pdf](https://github.com/StefanoAllesina/BSD-QBio2/raw/master/tutorials/advanced_computing_2/code/advanced_computing_2.pdf))

## Preparing your laptop

We are going to start working right away. Therefore, it is very important you **prepare your laptop** for the boot camp before you leave for MBL. This will take you about one hour, so schedule accordingly.

You will work on your laptop all day long. **If you don't have a laptop, please contact Stefano or Stephanie immediately**.

### Installation of `R` and `R` packages

*   **Install R**: go to [this page](https://cran.rstudio.com/), download the file corresponding to your platform, and install it. (Here's a [video](https://www.youtube.com/watch?v=5ZbjUEg4a1g) explaining how to install R and RStudio in Windows; [here](https://www.youtube.com/watch?v=5rp9bkc68y0) for Mac OSX)

*   **Install RStudio**: once installed R, go to [this page](https://www.rstudio.com/products/rstudio/download2/), download the installer for your operating system (section **Installers for Supported Platforms**), and install the software.

*   Once installed R and RStudio, open RStudio and **install the following packages**:

    *   tidyverse
    *   ggthemes
    *   stringr
    *   deSolve
    *   lubridate
    *   devtools
    *   phaseR
    *   cowplot
    *   plotly
    *   htmlwidgets
    *   ggcorrplot
    *   knitr

    You can find instructions on how to install `R` packages in RStudio [here](https://www.youtube.com/watch?v=3RWb5U3X-T8).

* **Other packages** Two of the packages need to be installed from within `R`. Open Rstudio and in the Console type `library(devtools)`, hit Return (or Enter) and then `install_github("pcarbo/cfwlab")`. This will install the library `cfwlab` that is needed for one of the tutorials. Once that is installed,  type `install_github("jdstorey/qvalue")`.

* **Install ImageJ**: go to [this page](http://imagej.net/Fiji/Downloads) and follow the instructions for your platform.

* **Software for NGS**: This will take a while, so start early. [Here are](https://github.com/StefanoAllesina/BSD-QBio3/blob/master/workshops/yang/NGS_workshop_software_installation.pdf) very detalied instructions. Follow them closely and contact Lixing Yang in case of problems.  

* **UNIX Emulator**: If you are using Windows, you need to install a UNIX emulator. We suggest downloading the version control software `Git` (which we are not going to use, but that you might want to master!), because it ships with a small emulator (`Git Bash`). Simply go to [this page](https://git-scm.com/download/win) and follow the instructions.

## Downloading the data

It is very important to **download the data** before you leave for MBL, as the files are quite large. 

*   First, you need to download the repository containing all the boot camp lectures and data. There are two options

    *   If you're familiar with `Git`, clone the repository
        `git clone https://github.com/StefanoAllesina/BSD-QBio3.git`
        making sure that the directory is created within your home (Linux: `home/yourname`, Mac OSX: `Users/yourname`, Windows `Users/yourname`).

     *   If you're not familiar with `Git`, download the [zip file](https://github.com/StefanoAllesina/BSD-QBio3/archive/master.zip), and extract it to your home directory. Make sure to rename the folder to `BSD-QBio3` (it will be extracted as `BSD-QBio3-master`).

*  Second, you need to download and unzip a large file containing all the data for the NGS tutorial. You can download the file [here](https://www.dropbox.com/s/kq7duts6i2heiup/ngs_workshop.zip?dl=0).

## Programming Challenges

During the boot camp, the 12 groups of students will compete through 6 programming challenges. Here are the links to the webpages where the groups should post their solutions (one answer per group, please):

* Submit your answer to [Programming Challenge 1 (Basic Programming I)](https://docs.google.com/forms/d/e/1FAIpQLSfrBRpsQc7XefhrUxHmm8W43SHfIxK-AtRUhEYjgaA_JD8TyQ/viewform?usp=sf_link)
* Submit your answer to [Programming Challenge 2 (Basic Programming II)](https://docs.google.com/forms/d/e/1FAIpQLSf7aPH54rKd3Jn17sdSvtc_iB__0TEf2nioQb4iQiysCv18NQ/viewform?usp=sf_link)
* Submit your answer for the tutorial on [Defensive Programming](https://docs.google.com/forms/d/e/1FAIpQLSd1MdL5enuJjKLmhNN4KJCNKglzt8QSuHjQEjjhzpVbRUBeQg/viewform?usp=sf_link)
* Submit your answer for the tutorial on [Reproducibility]()
* Submit your answer for the tutorial on [Data Visualization](https://docs.google.com/forms/d/e/1FAIpQLSdY54V7vUjOVbd76I1E3pRMLznfiI1kXW7obmdrl7gQxPyEcA/viewform?usp=sf_link)
* Submit your answer for the tutorial on [Stats for large data](https://docs.google.com/forms/d/e/1FAIpQLSf_fXbqPfhNZYUwcSTu_ZBNGJkBBoxoepr280KPjy7Kn_wjXw/viewform?usp=sf_link)



