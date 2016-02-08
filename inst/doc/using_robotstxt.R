## ---- message=FALSE------------------------------------------------------
library(robotstxt)
library(dplyr)

## ---- include=FALSE------------------------------------------------------
rtxt <- robotstxt$new(domain="wikipedia.org", text=robotstxt:::rt_get_rtxt("robots_wikipedia.txt"))

## ---- eval=FALSE---------------------------------------------------------
#  rtxt <- robotstxt$new(domain="wikipedia.org")

## ------------------------------------------------------------------------
class(rtxt)

## ------------------------------------------------------------------------
rtxt

## ------------------------------------------------------------------------
# checking for access permissions
rtxt$check(paths = c("/","api/"), bot = "*")
rtxt$check(paths = c("/","api/"), bot = "Orthogaffe")
rtxt$check(paths = c("/","api/"), bot = "Mediapartners-Google*  ")

## ---- include=FALSE------------------------------------------------------
rtxt <- robotstxt:::rt_get_rtxt("robots_wikipedia.txt")

## ---- eval=FALSE---------------------------------------------------------
#  rtxt        <- get_robotstxt("wikipedia.org")

## ------------------------------------------------------------------------
parsed_rtxt <- parse_robotstxt(rtxt)
permissions <- parsed_rtxt$permissions
paths_allowed(permissions, paths=c("/","images/"), bot="*")

