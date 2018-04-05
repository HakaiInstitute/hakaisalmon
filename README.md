# READ ME

This is an internal R package for the Hakai Institute Juvenile Salmon Program.

The hakaisalmon package is primarily a data package that contains citable versions of the Hakai Institute Juvenile Salmon Program (JSP) data. The purpose of this package is to make it as easy as possible to load salmon program data, and facilitate collaborative development of custom functions for summarizing and analyzing program data. If you would like to suggest improvements, features, or bug fixes please do so at https://github.com/HakaiInstitute/hakaisalmon/issues. If you would like to modify any part of this package you are encourage to submit a [pull request](https://help.github.com/articles/about-pull-requests/).

To install this package:

First, a [free GitHUB account](https://github.com/join) is required to be added as an external collaborator to the private package repository. Contact the package maintainer to request this.

Once you have invited as an external collaborator, go to https://github.com/settings/tokens and check the `repo` box scroll down and hit generate token.

Copy the token.

In the R-Studio console run the following two lines of code:
`install.packages("devtools")`
`devtools::install_github("HakaiInstitute/hakaisalmon", auth_token = "PASTE YOUR TOKEN HERE")`

## Usage

All program data is loaded into memory upon calling `library(hakaisalmon)`. You will not see datatables as objects in your environment but to demonstrate that the data is loaded into memory begin to type `survey` in your script and you should see several JSP data tables pop up in the tab completion window.

All the tables from the program database are available. See the reference file for a comlplete list of data tables available. Some of the more common joins have already be completed for convenience. 

The tables in this package follow a tidy relational database structure. If you wish to join other tables you can do so using the `dplyr::left_join function`. If this is something you have to do often, consider including your custom join in this package by [submitting an issue](https://github.com/HakaiInstitute/hakaisalmon/issues), or by submitting a pull request.

The metadata associated with all the data in this package is currently stored in a spreadsheet and we are working to formalize the metadata of this dataset into a standardized format to share. Until then the spreadsheet is available [here]("LINK TO THE FILE STORED ON GITHUB")

## Permissions and Updates

This is a private package, and the user token you generated to install this package must not be shared. I enncourage you to check this website before starting or finalizing any analysis, to check for new or updated data.

## Citing Data

Coming soon :)


