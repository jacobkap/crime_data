nyc = yearly_offenses[yearly_offenses$ori == "NY03030",]
nyc = nyc[nyc$year %in% 1985:2014,]
cbind(nyc$year, nyc$total_population)
cbind(nyc$year, nyc$act_murder)
cbind(nyc$year, nyc$act_rape_total)
cbind(nyc$year, nyc$act_robbery_total)
cbind(nyc$year, nyc$act_aggravated_assault)
cbind(nyc$year, nyc$act_burglary_total)
cbind(nyc$year, nyc$act_theft_total)
cbind(nyc$year, nyc$act_mtr_vhc_theft_total)

cbind(nyc$year, nyc$act_assault_total)
cbind(nyc$year, nyc$act_simple_assault)
cbind(nyc$year, nyc$act_gun_assault)
cbind(nyc$year, nyc$act_aggravated_assault)

oak = yearly_offenses[yearly_offenses$ori == "CA00109",]
oak = oak[oak$year %in% 1985:2014, ]
oak = oak[oak$year != 1995, ]
cbind(oak$year, oak$total_population)
cbind(oak$year, oak$act_murder)
cbind(oak$year, oak$act_rape_total)
cbind(oak$year, oak$act_robbery_total)
cbind(oak$year, oak$act_aggravated_assault)
cbind(oak$year, oak$act_burglary_total)
cbind(oak$year, oak$act_theft_total)
cbind(oak$year, oak$act_mtr_vhc_theft_total)