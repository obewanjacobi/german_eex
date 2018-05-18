# We will use the xlsx package to read in excel files, the dplyr
# package to organize the data, and the lubridate package to 
# easily organize dates and times.
require(xlsx)
require(dplyr)
require(lubridate)

# Note that we do not read in the coal_futures file as it seems to
# be incomplete at the time. There's not much to be done with a
# dataset full of zeros. 


# This dataset contains the solar energy forecast in MegaWatthours
# for specific dates and times.

solar = read.csv("./Datafiles/Solar.csv",header = TRUE)



# This dataset contains the wind energy forecast in MegaWatthours
# for specific dates and times.

wind = read.csv("./Datafiles/Wind.csv",header = TRUE)



# These datasets are read in from the emission_spot file. The 
# first explains the emission allowance based on specific contracts,
# the second gives us emission reductions based on the contract,
# and the third and final one gives us the market auction info
# based on dates, times, and auction names.

emission_allowance = read.xlsx("./Datafiles/emission_spot_historie_2013.xls", 
                     sheetIndex=1,header=TRUE,startRow=2)

emission_reductions = read.xlsx("./Datafiles/emission_spot_historie_2013.xls", 
                     sheetIndex=2,header=TRUE,startRow=2)

emission_auction = read.xlsx("./Datafiles/emission_spot_historie_2013.xls", 
                     sheetIndex=3,header=TRUE,startRow=2)
emission_auction$Auction.Time = format(emission_auction$Auction.Time, 
                     "%H:%M:%S")




# The energy prices here seem to be given in Euros per 
# MegaWatthour. The volumes are given by MegaWatthour.

energy_prices = read.xlsx("./Datafiles/energy_spot_historie_2013.xls", 
                     sheetIndex=1,header=TRUE,startRow=3)

energy_volumes = read.xlsx("./Datafiles/energy_spot_historie_2013.xls", 
                     sheetIndex=2,header=TRUE,startRow=2)



# The following sheets give us data on what I have understood 
#to be 3 European gas companies/traders, NCG (NetConnect 
#Germany), GASPOOL, and TTF (Title Transfer Facility). For 
#each one, we get the market information for the whole 2013 
#year. This has their number of trades, price information, and 
#volume traded for every day. 

gas_ref.price = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=1,header=TRUE,startRow=2)

gas_market.ncg = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=2,header=TRUE,startRow=2)

gas_market.ncg.1mw = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=3,header=TRUE,startRow=2)

gas_market.ncg.day = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=4,header=TRUE,startRow=2)

gas_market.gaspool = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=5,header=TRUE,startRow=2)

gas_market.gaspool.1mw = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=6,header=TRUE,startRow=2)

gas_market.gaspool.day = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=7,header=TRUE,startRow=2)

gas_market.ttf = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=8,header=TRUE,startRow=2)

gas_market.ttf.1mw = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=9,header=TRUE,startRow=2)

gas_market.ttf.day = read.xlsx("./Datafiles/gas_spot_historie_2013.xls", 
                     sheetIndex=10,header=TRUE,startRow=2)



# What separates these two datasets is unclear. Will look into 
# further.

heating1 = read.xlsx("./Datafiles/HeatingDegrees.xlsx", 
                     sheetIndex=1,header=TRUE,startRow=NULL)

heating2 = read.xlsx("./Datafiles/HeatingDegrees.xlsx", 
                     sheetIndex=2,header=TRUE,startRow=NULL)






