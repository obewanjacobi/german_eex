# Plotting NCG, GASPOOL, and TTF Day vs. Volume

#NCG
ncg.vol = gas_market.ncg$Volume.MWh
ncg.day = gas_market.ncg$Trading.Date
NCG = data.frame(ncg.day,ncg.mean_price,ncg.vol,ncg.trades)
qplot(ncg.day, ncg.vol, data = NCG, xlab = 'Day in 2013', 
      ylab = 'Volume in MWh', main = 'NCG Day vs. Volume 2013', 
      geom = c("point", "smooth"))

#GASPOOL
gas.vol = gas_market.gaspool$Volume.MWh
gas.day = gas_market.gaspool$Trading.Date


qplot(gas.day,gas.vol, xlab = 'Day in 2013', 
      ylab = 'Volume in MWh', main = 'GASPOOL Day vs. Volume 2013', 
      geom = c("point", "smooth"))

#TTF
ttf.vol = gas_market.ttf$Volume.MWh
ttf.day = gas_market.ttf$Trading.Date

qplot(ttf.day,ttf.vol, xlab = 'Day in 2013', 
      ylab = 'Volume in MWh', main = 'TTF Day vs. Volume 2013', 
      geom = c("point", "smooth"))