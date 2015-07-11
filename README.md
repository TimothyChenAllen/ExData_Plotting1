## Author

Timothy Chen Allen
(Forked from [rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1/ "rdpeng/ExData_Plotting1") )

## Introduction

This is an analysis of power consumption from 2007-02-01 to
2007-02-02 by a single-family home.  The data are from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, particularly the "Individual household
electric power consumption Data Set":

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.

The goal of this **Exploratory Data Analysis** is to gain a
better understanding of the data and to begin to create 
hypotheses about causes and relationships in the data.

## Loading the data

* Only the data necessary for analysis were loaded into a 
`data.table` called `consumption`.

* The `Date` field was converted to a `Date` using `as.Date()`.

* A DateTime field was added to `consumption` using the
`as.POSIXct()` function.

* In this dataset missing values are coded as `?`.
These were converted to `NA`.

## Making Plots

This analysis of 2007-02-01 and 2007-02-02 created four total
plots:

### Plot 1
This histogram of Global Active Power explores the distribution
of levels of power consumption over the two-day period.  It
is heavily right-skewed, indicating that at any given time, 
consumption tends to be small with a few times in which 
consumption increases during the day.

![plot1](plot1.png "Histogram of Global Active Power") 


### Plot 2
This line plot shows Global Active Power consumption from 
midnight to midnight of the two days.  We can see that
both days are generally of low consumption with a
large increase from morning to noon and another from
after work until midnight.

![plot2](plot2.png "Global Active Power over DateTime") 


### Plot 3
The subsystems correspond to:
1) kitchen, containing mainly a dishwasher, an oven and 
a microwave (hot plates are not electric but gas powered).
2) laundry room, containing a washing-machine, a tumble-drier,
a refrigerator and a light.
3) electric water-heater and an air-conditioner.
We can see that the kitchen is mostly increased in the morning
before work hours.  The laundry room is very consistent.
The water heater has large increases in morning, noon, and
evening until midnight.
![plot3](plot3.png "Submetering Energy") 


### Plot 4
This graphic combines four plots of consumption and voltage.
![plot4](plot4.png "Four plots of consumption") 

