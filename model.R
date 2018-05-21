# Model
# In the paper written in this repository, I created a model using
# the data read in (contained in another script). Below is the code
# for the model and to see its residuals.

# Gather all the data required
temp_gas = gas_ref.price %>% group_by(Trading.Date) %>% summarise(avg = mean(Price.EUR.MWh,na.rm = TRUE))
colnames(temp_gas) = c('day','avg.gasprice')
temp_en = select(energy_volumes, Liefertag.Delivery.Date, Phelix.Day.Base.MWh)

model_data = select(energy_prices, Liefertag.Delivery.Date, Phelix.Day.Base.EUR.MWh)
model_data = left_join(model_data, temp_en, by = 'Liefertag.Delivery.Date')
colnames(model_data) = c('day', 'phelix.eur.p.mwh', 'phelix.mwh')
model_data = left_join(model_data, temp_gas, by = 'day')
head(model_data)

# Making the model

en.vol_mod = lm(phelix.mwh~phelix.eur.p.mwh+avg.gasprice, data = model_data)
summary(en.vol_mod)

# Plotting residuals

plot(en.vol_mod, which=1:2, labels.id = '')