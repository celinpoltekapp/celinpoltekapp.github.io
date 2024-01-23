setwd("D:/METOPEL UAS/CELINE METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("lobster.xlsx")
dat <- read_excel("lobster.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

# regresi
reg1<-lm(lobster~ekspor+siripk,data=dat)
summary(reg1)

# Plot 
plot(dat$tahun,dat$ekspor,xlab="Tahun",ylab="Nilai FOB Ekspor ")
plot(dat$tahun,dat$lobster,xlab="Tahun",ylab="Nilai FOB Lobster")
plot(dat$tahun,dat$siripk,xlab="Tahun",ylab="Nilai FOB Tuna Sirip Kuning")

# Plot Error

dat$m<-resid(reg1)
plot(dat$ekspor,dat$m,xlab="Nilai Ekspor Keseluruhan",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$lobster,dat$m,xlab="Nilai Ekspor Lobster",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$siripk,dat$m,xlab="Nilai Ekspor Tuna Sirip Kuning",ylab="error")
abline(h=0) # membuat garis horizontal di y=0
