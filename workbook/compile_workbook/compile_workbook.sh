## Cover sheet # Revised
pdftk ../other_docs/cover.pdf ../other_docs/blank.pdf cat output tmp.pdf
## Map # Revised
pdftk tmp.pdf ../other_docs/map.pdf cat output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Info sheet # TODO
pdftk tmp.pdf ../other_docs/info_sheet.pdf cat output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Contact Info # TODO
pandoc ../other_docs/contact_info.md -o ../other_docs/contact.pdf
gs -o ../other_docs/contact2.pdf -dNoOutputFonts -sDEVICE=pdfwrite ../other_docs/contact.pdf
pdftk tmp.pdf ../other_docs/contact2.pdf cat output tmp2.pdf; mv tmp2.pdf tmp.pdf
## General schedule # Revised
pdftk tmp.pdf ../../schedule/GeneralSchedule.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Tutorials cover # Revised
pdftk tmp.pdf ../other_docs/cover_tutorials.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Imaging # TODO
pdftk tmp.pdf ../../tutorials/imaging/data/ImageProcessingExercises.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Basic I # Revised
pdftk tmp.pdf ../../tutorials/basic_computing_1/code/basic_computing_1.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Basic II # Revised
pdftk tmp.pdf ../../tutorials/basic_computing_2/code/basic_computing_2.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Advanced I # Revised
pdftk tmp.pdf ../../tutorials/advanced_computing_1/code/advanced_computing_1.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Advanced II # Revised
pdftk tmp.pdf ../../tutorials/advanced_computing_2/code/advanced_computing_2.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf # Revised
## Workshops cover # Revised
pdftk tmp.pdf ../other_docs/cover_workshops.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Cobey # TODO
pdftk tmp.pdf ../../workshops/cobey/README.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Novembre # TODO
pdftk tmp.pdf ../../workshops/novembre/Handouts/MBL_WorkshopJN.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf
## Yang # TODO
#pdftk tmp.pdf ../../workshops/osborne/MBL_course2016_infotheory.pdf output tmp2.pdf; mv tmp2.pdf tmp.pdf

## Redistill to reduce size
gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -sOutputFile=../workbook.pdf tmp.pdf
## remove tmp
rm tmp.pdf
