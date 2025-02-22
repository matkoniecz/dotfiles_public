#from http://stackoverflow.com/questions/1189759/expert-r-users-whats-in-your-rprofile/1189826#1189826 via http://www.r-bloggers.com/installing-r-packages/
cat(".Rprofile: Setting UK repository")
r = getOption("repos") # hard code the UK repo for CRAN
r["CRAN"] = "http://cran.uk.r-project.org"
options(repos = r)
rm(r)