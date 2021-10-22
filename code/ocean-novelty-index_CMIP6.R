##### Ocean novelty index - CMIP6 #####
setwd("C:/Users/Manao/Documents/phd_stuff/dissertation/chapter_1-ocean_novelty/outputs")

# load packages
library(maps)
library(maptools)
library(ncdf4)
library(raster)
library(rasterVis)
library(rgdal)

##### Step 0. Define global variabes #####
decades <- c("2020s", "2030s", "2040s", "2050s", "2060s", "2070s", "2080s", "2090s")
variables <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton")

##### Step 1. Avg Hellinger's Distance for var_scenario_decade #####
##### Chlorophyll #####
# Read in rasters, going variable-by-variable
chl_IPSL_ssp245 <- brick("./IPSL-CM6A-LR/ssp245/rasters/IPSL-CM6A-LR_SSP245-Chlorophyll.nc")
chl_IPSL_ssp370 <- brick("./IPSL-CM6A-LR/ssp370/rasters/IPSL-CM6A-LR_SSP370-Chlorophyll.nc")
chl_IPSL_ssp585 <- brick("./IPSL-CM6A-LR/ssp585/rasters/IPSL-CM6A-LR_SSP585-Chlorophyll.nc")
chl_MPI_ssp245  <- brick("./MPI-ESM1-2-LR/ssp245/rasters/MPI-ESM1-2-LR_SSP245-Chlorophyll.nc")
chl_MPI_ssp370  <- brick("./MPI-ESM1-2-LR/ssp370/rasters/MPI-ESM1-2-LR_SSP370-Chlorophyll.nc")
chl_MPI_ssp585  <- brick("./MPI-ESM1-2-LR/ssp585/rasters/MPI-ESM1-2-LR_SSP585-Chlorophyll.nc")
chl_NCAR_ssp245 <- brick("./NCAR-CESM2-WACCM/ssp245/rasters/NCAR-CESM2-WACCM_SSP245-Chlorophyll.nc")
chl_NCAR_ssp370 <- brick("./NCAR-CESM2-WACCM/ssp370/rasters/NCAR-CESM2-WACCM_SSP370-Chlorophyll.nc")
chl_NCAR_ssp585 <- brick("./NCAR-CESM2-WACCM/ssp585/rasters/NCAR-CESM2-WACCM_SSP585-Chlorophyll.nc")
chl_NCC_ssp245  <- brick("./NCC-NorESM2-LM/ssp245/rasters/NCC-NorESM2-LM_SSP245-Chlorophyll.nc")
chl_NCC_ssp370  <- brick("./NCC-NorESM2-LM/ssp370/rasters/NCC-NorESM2-LM_SSP370-Chlorophyll.nc")
chl_NCC_ssp585  <- brick("./NCC-NorESM2-LM/ssp585/rasters/NCC-NorESM2-LM_SSP585-Chlorophyll.nc")
chl_GFDL_ssp245 <- brick("./NOAA-GFDL-ESM4/ssp245/rasters/NOAA-GFDL-ESM4_SSP245-Chlorophyll.nc")
chl_GFDL_ssp370 <- brick("./NOAA-GFDL-ESM4/ssp370/rasters/NOAA-GFDL-ESM4_SSP370-Chlorophyll.nc")
chl_GFDL_ssp585 <- brick("./NOAA-GFDL-ESM4/ssp585/rasters/NOAA-GFDL-ESM4_SSP585-Chlorophyll.nc")

chl_ssp245_names <- list(chl_IPSL_ssp245,
                         chl_MPI_ssp245,  
                         chl_NCAR_ssp245,
                         chl_NCC_ssp245,  
                         chl_GFDL_ssp245)

chl_ssp370_names <- list(chl_IPSL_ssp370,
                         chl_MPI_ssp370, 
                         chl_NCAR_ssp370,
                         chl_NCC_ssp370, 
                         chl_GFDL_ssp370)

chl_ssp585_names <- list(chl_IPSL_ssp585,
                         chl_MPI_ssp585,
                         chl_NCAR_ssp585,
                         chl_NCC_ssp585,
                         chl_GFDL_ssp585)

# create merged rasters by scenario by decade - ssp245
chl_ssp245_2020 <- list()
chl_ssp245_2030 <- list()
chl_ssp245_2040 <- list()
chl_ssp245_2050 <- list()
chl_ssp245_2060 <- list()
chl_ssp245_2070 <- list()
chl_ssp245_2080 <- list()
chl_ssp245_2090 <- list()

for (i in 1:5) {
  chl_ssp245_2020[[i]] <- chl_ssp245_names[[i]][[1]]
  chl_ssp245_2030[[i]] <- chl_ssp245_names[[i]][[2]]
  chl_ssp245_2040[[i]] <- chl_ssp245_names[[i]][[3]]
  chl_ssp245_2050[[i]] <- chl_ssp245_names[[i]][[4]]
  chl_ssp245_2060[[i]] <- chl_ssp245_names[[i]][[5]]
  chl_ssp245_2070[[i]] <- chl_ssp245_names[[i]][[6]]
  chl_ssp245_2080[[i]] <- chl_ssp245_names[[i]][[7]]
  chl_ssp245_2090[[i]] <- chl_ssp245_names[[i]][[8]]
}

chl_ssp245_2020 <- brick(chl_ssp245_2020)
chl_ssp245_2030 <- brick(chl_ssp245_2030)
chl_ssp245_2040 <- brick(chl_ssp245_2040)
chl_ssp245_2050 <- brick(chl_ssp245_2050)
chl_ssp245_2060 <- brick(chl_ssp245_2060)
chl_ssp245_2070 <- brick(chl_ssp245_2070)
chl_ssp245_2080 <- brick(chl_ssp245_2080)
chl_ssp245_2090 <- brick(chl_ssp245_2090)

# calculate mean for each scenario/decade
chl_ssp245_2020 <- mean(chl_ssp245_2020, na.rm = TRUE)
chl_ssp245_2030 <- mean(chl_ssp245_2030, na.rm = TRUE)
chl_ssp245_2040 <- mean(chl_ssp245_2040, na.rm = TRUE)
chl_ssp245_2050 <- mean(chl_ssp245_2050, na.rm = TRUE)
chl_ssp245_2060 <- mean(chl_ssp245_2060, na.rm = TRUE)
chl_ssp245_2070 <- mean(chl_ssp245_2070, na.rm = TRUE)
chl_ssp245_2080 <- mean(chl_ssp245_2080, na.rm = TRUE)
chl_ssp245_2090 <- mean(chl_ssp245_2090, na.rm = TRUE)

# combine into single brick
chl_ssp245 <- brick(chl_ssp245_2020,
                    chl_ssp245_2030,
                    chl_ssp245_2040,
                    chl_ssp245_2050,
                    chl_ssp245_2060,
                    chl_ssp245_2070,
                    chl_ssp245_2080,
                    chl_ssp245_2090)

names(chl_ssp245) <- decades

rm(list=ls(pattern="chl_ssp245_"))

chl_ssp245_df <- as.data.frame(chl_ssp245)

# ssp370
# create merged rasters by scenario by decade - ssp245
chl_ssp370_2020 <- list()
chl_ssp370_2030 <- list()
chl_ssp370_2040 <- list()
chl_ssp370_2050 <- list()
chl_ssp370_2060 <- list()
chl_ssp370_2070 <- list()
chl_ssp370_2080 <- list()
chl_ssp370_2090 <- list()

for (i in 1:5) {
  chl_ssp370_2020[[i]] <- chl_ssp370_names[[i]][[1]]
  chl_ssp370_2030[[i]] <- chl_ssp370_names[[i]][[2]]
  chl_ssp370_2040[[i]] <- chl_ssp370_names[[i]][[3]]
  chl_ssp370_2050[[i]] <- chl_ssp370_names[[i]][[4]]
  chl_ssp370_2060[[i]] <- chl_ssp370_names[[i]][[5]]
  chl_ssp370_2070[[i]] <- chl_ssp370_names[[i]][[6]]
  chl_ssp370_2080[[i]] <- chl_ssp370_names[[i]][[7]]
  chl_ssp370_2090[[i]] <- chl_ssp370_names[[i]][[8]]
}

chl_ssp370_2020 <- brick(chl_ssp370_2020)
chl_ssp370_2030 <- brick(chl_ssp370_2030)
chl_ssp370_2040 <- brick(chl_ssp370_2040)
chl_ssp370_2050 <- brick(chl_ssp370_2050)
chl_ssp370_2060 <- brick(chl_ssp370_2060)
chl_ssp370_2070 <- brick(chl_ssp370_2070)
chl_ssp370_2080 <- brick(chl_ssp370_2080)
chl_ssp370_2090 <- brick(chl_ssp370_2090)

# calculate mean for each scenario/decade
chl_ssp370_2020 <- mean(chl_ssp370_2020, na.rm = TRUE)
chl_ssp370_2030 <- mean(chl_ssp370_2030, na.rm = TRUE)
chl_ssp370_2040 <- mean(chl_ssp370_2040, na.rm = TRUE)
chl_ssp370_2050 <- mean(chl_ssp370_2050, na.rm = TRUE)
chl_ssp370_2060 <- mean(chl_ssp370_2060, na.rm = TRUE)
chl_ssp370_2070 <- mean(chl_ssp370_2070, na.rm = TRUE)
chl_ssp370_2080 <- mean(chl_ssp370_2080, na.rm = TRUE)
chl_ssp370_2090 <- mean(chl_ssp370_2090, na.rm = TRUE)

# combine into single brick
chl_ssp370 <- brick(chl_ssp370_2020,
                    chl_ssp370_2030,
                    chl_ssp370_2040,
                    chl_ssp370_2050,
                    chl_ssp370_2060,
                    chl_ssp370_2070,
                    chl_ssp370_2080,
                    chl_ssp370_2090)

names(chl_ssp370) <- decades

rm(list=ls(pattern="chl_ssp370_"))

chl_ssp370_df <- as.data.frame(chl_ssp370)

# ssp585
chl_ssp585_2020 <- list()
chl_ssp585_2030 <- list()
chl_ssp585_2040 <- list()
chl_ssp585_2050 <- list()
chl_ssp585_2060 <- list()
chl_ssp585_2070 <- list()
chl_ssp585_2080 <- list()
chl_ssp585_2090 <- list()

for (i in 1:5) {
  chl_ssp585_2020[[i]] <- chl_ssp585_names[[i]][[1]]
  chl_ssp585_2030[[i]] <- chl_ssp585_names[[i]][[2]]
  chl_ssp585_2040[[i]] <- chl_ssp585_names[[i]][[3]]
  chl_ssp585_2050[[i]] <- chl_ssp585_names[[i]][[4]]
  chl_ssp585_2060[[i]] <- chl_ssp585_names[[i]][[5]]
  chl_ssp585_2070[[i]] <- chl_ssp585_names[[i]][[6]]
  chl_ssp585_2080[[i]] <- chl_ssp585_names[[i]][[7]]
  chl_ssp585_2090[[i]] <- chl_ssp585_names[[i]][[8]]
}

chl_ssp585_2020 <- brick(chl_ssp585_2020)
chl_ssp585_2030 <- brick(chl_ssp585_2030)
chl_ssp585_2040 <- brick(chl_ssp585_2040)
chl_ssp585_2050 <- brick(chl_ssp585_2050)
chl_ssp585_2060 <- brick(chl_ssp585_2060)
chl_ssp585_2070 <- brick(chl_ssp585_2070)
chl_ssp585_2080 <- brick(chl_ssp585_2080)
chl_ssp585_2090 <- brick(chl_ssp585_2090)

# calculate mean for each scenario/decade
chl_ssp585_2020 <- mean(chl_ssp585_2020, na.rm = TRUE)
chl_ssp585_2030 <- mean(chl_ssp585_2030, na.rm = TRUE)
chl_ssp585_2040 <- mean(chl_ssp585_2040, na.rm = TRUE)
chl_ssp585_2050 <- mean(chl_ssp585_2050, na.rm = TRUE)
chl_ssp585_2060 <- mean(chl_ssp585_2060, na.rm = TRUE)
chl_ssp585_2070 <- mean(chl_ssp585_2070, na.rm = TRUE)
chl_ssp585_2080 <- mean(chl_ssp585_2080, na.rm = TRUE)
chl_ssp585_2090 <- mean(chl_ssp585_2090, na.rm = TRUE)

# combine into single brick
chl_ssp585 <- brick(chl_ssp585_2020,
                    chl_ssp585_2030,
                    chl_ssp585_2040,
                    chl_ssp585_2050,
                    chl_ssp585_2060,
                    chl_ssp585_2070,
                    chl_ssp585_2080,
                    chl_ssp585_2090)

names(chl_ssp585) <- decades

chl_ssp585_df <- as.data.frame(chl_ssp585)

rm(list=ls(pattern="chl_ssp585_"))
rm(list=ls(pattern="chl_IPSL_"))
rm(list=ls(pattern="chl_MPI_"))
rm(list=ls(pattern="chl_NCC_"))
rm(list=ls(pattern="chl_NCAR_"))
rm(list=ls(pattern="chl_GFDL_"))

writeRaster(chl_ssp245, "CMIP6_chl_ssp245.nc", format="CDF", overwrite=TRUE)
writeRaster(chl_ssp370, "CMIP6_chl_ssp370.nc", format="CDF", overwrite=TRUE)
writeRaster(chl_ssp585, "CMIP6_chl_ssp585.nc", format="CDF", overwrite=TRUE)

##### oxygen #####
# Read in rasters, going variable-by-variable
oxy_IPSL_ssp245 <- brick("./IPSL-CM6A-LR/ssp245/rasters/IPSL-CM6A-LR_SSP245-Oxygen.nc")
oxy_IPSL_ssp370 <- brick("./IPSL-CM6A-LR/ssp370/rasters/IPSL-CM6A-LR_SSP370-Oxygen.nc")
oxy_IPSL_ssp585 <- brick("./IPSL-CM6A-LR/ssp585/rasters/IPSL-CM6A-LR_SSP585-Oxygen.nc")
oxy_MPI_ssp245  <- brick("./MPI-ESM1-2-LR/ssp245/rasters/MPI-ESM1-2-LR_SSP245-Oxygen.nc")
oxy_MPI_ssp370  <- brick("./MPI-ESM1-2-LR/ssp370/rasters/MPI-ESM1-2-LR_SSP370-Oxygen.nc")
oxy_MPI_ssp585  <- brick("./MPI-ESM1-2-LR/ssp585/rasters/MPI-ESM1-2-LR_SSP585-Oxygen.nc")
oxy_NCC_ssp245  <- brick("./NCC-NorESM2-LM/ssp245/rasters/NCC-NorESM2-LM_SSP245-Oxygen.nc")
oxy_NCC_ssp370  <- brick("./NCC-NorESM2-LM/ssp370/rasters/NCC-NorESM2-LM_SSP370-Oxygen.nc")
oxy_NCC_ssp585  <- brick("./NCC-NorESM2-LM/ssp585/rasters/NCC-NorESM2-LM_SSP585-Oxygen.nc")
oxy_GFDL_ssp245 <- brick("./NOAA-GFDL-ESM4/ssp245/rasters/NOAA-GFDL-ESM4_SSP245-Oxygen.nc")
oxy_GFDL_ssp370 <- brick("./NOAA-GFDL-ESM4/ssp370/rasters/NOAA-GFDL-ESM4_SSP370-Oxygen.nc")
oxy_GFDL_ssp585 <- brick("./NOAA-GFDL-ESM4/ssp585/rasters/NOAA-GFDL-ESM4_SSP585-Oxygen.nc")

oxy_ssp245_names <- list(oxy_IPSL_ssp245,
                         oxy_MPI_ssp245,  
                         oxy_NCC_ssp245,  
                         oxy_GFDL_ssp245)

oxy_ssp370_names <- list(oxy_IPSL_ssp370,
                         oxy_MPI_ssp370, 
                         oxy_NCC_ssp370, 
                         oxy_GFDL_ssp370)

oxy_ssp585_names <- list(oxy_IPSL_ssp585,
                         oxy_MPI_ssp585,
                         oxy_NCC_ssp585,
                         oxy_GFDL_ssp585)

# create merged rasters by scenario by decade - ssp245
oxy_ssp245_2020 <- list()
oxy_ssp245_2030 <- list()
oxy_ssp245_2040 <- list()
oxy_ssp245_2050 <- list()
oxy_ssp245_2060 <- list()
oxy_ssp245_2070 <- list()
oxy_ssp245_2080 <- list()
oxy_ssp245_2090 <- list()

for (i in 1:4) {
  oxy_ssp245_2020[[i]] <- oxy_ssp245_names[[i]][[1]]
  oxy_ssp245_2030[[i]] <- oxy_ssp245_names[[i]][[2]]
  oxy_ssp245_2040[[i]] <- oxy_ssp245_names[[i]][[3]]
  oxy_ssp245_2050[[i]] <- oxy_ssp245_names[[i]][[4]]
  oxy_ssp245_2060[[i]] <- oxy_ssp245_names[[i]][[5]]
  oxy_ssp245_2070[[i]] <- oxy_ssp245_names[[i]][[6]]
  oxy_ssp245_2080[[i]] <- oxy_ssp245_names[[i]][[7]]
  oxy_ssp245_2090[[i]] <- oxy_ssp245_names[[i]][[8]]
}

oxy_ssp245_2020 <- brick(oxy_ssp245_2020)
oxy_ssp245_2030 <- brick(oxy_ssp245_2030)
oxy_ssp245_2040 <- brick(oxy_ssp245_2040)
oxy_ssp245_2050 <- brick(oxy_ssp245_2050)
oxy_ssp245_2060 <- brick(oxy_ssp245_2060)
oxy_ssp245_2070 <- brick(oxy_ssp245_2070)
oxy_ssp245_2080 <- brick(oxy_ssp245_2080)
oxy_ssp245_2090 <- brick(oxy_ssp245_2090)

# calculate mean for each scenario/decade
oxy_ssp245_2020 <- calc(oxy_ssp245_2020, fun = mean, na.rm = T)
oxy_ssp245_2030 <- calc(oxy_ssp245_2030, fun = mean, na.rm = T)
oxy_ssp245_2040 <- calc(oxy_ssp245_2040, fun = mean, na.rm = T)
oxy_ssp245_2050 <- calc(oxy_ssp245_2050, fun = mean, na.rm = T)
oxy_ssp245_2060 <- calc(oxy_ssp245_2060, fun = mean, na.rm = T)
oxy_ssp245_2070 <- calc(oxy_ssp245_2070, fun = mean, na.rm = T)
oxy_ssp245_2080 <- calc(oxy_ssp245_2080, fun = mean, na.rm = T)
oxy_ssp245_2090 <- calc(oxy_ssp245_2090, fun = mean, na.rm = T)

# combine into single brick
oxy_ssp245 <- brick(oxy_ssp245_2020,
                    oxy_ssp245_2030,
                    oxy_ssp245_2040,
                    oxy_ssp245_2050,
                    oxy_ssp245_2060,
                    oxy_ssp245_2070,
                    oxy_ssp245_2080,
                    oxy_ssp245_2090)

names(oxy_ssp245) <- decades

rm(list=ls(pattern="oxy_ssp245_"))

oxy_ssp245_df <- as.data.frame(oxy_ssp245)

# ssp370
# create merged rasters by scenario by decade - ssp245
oxy_ssp370_2020 <- list()
oxy_ssp370_2030 <- list()
oxy_ssp370_2040 <- list()
oxy_ssp370_2050 <- list()
oxy_ssp370_2060 <- list()
oxy_ssp370_2070 <- list()
oxy_ssp370_2080 <- list()
oxy_ssp370_2090 <- list()

for (i in 1:4) {
  oxy_ssp370_2020[[i]] <- oxy_ssp370_names[[i]][[1]]
  oxy_ssp370_2030[[i]] <- oxy_ssp370_names[[i]][[2]]
  oxy_ssp370_2040[[i]] <- oxy_ssp370_names[[i]][[3]]
  oxy_ssp370_2050[[i]] <- oxy_ssp370_names[[i]][[4]]
  oxy_ssp370_2060[[i]] <- oxy_ssp370_names[[i]][[5]]
  oxy_ssp370_2070[[i]] <- oxy_ssp370_names[[i]][[6]]
  oxy_ssp370_2080[[i]] <- oxy_ssp370_names[[i]][[7]]
  oxy_ssp370_2090[[i]] <- oxy_ssp370_names[[i]][[8]]
}

oxy_ssp370_2020 <- brick(oxy_ssp370_2020)
oxy_ssp370_2030 <- brick(oxy_ssp370_2030)
oxy_ssp370_2040 <- brick(oxy_ssp370_2040)
oxy_ssp370_2050 <- brick(oxy_ssp370_2050)
oxy_ssp370_2060 <- brick(oxy_ssp370_2060)
oxy_ssp370_2070 <- brick(oxy_ssp370_2070)
oxy_ssp370_2080 <- brick(oxy_ssp370_2080)
oxy_ssp370_2090 <- brick(oxy_ssp370_2090)

# calculate mean for each scenario/decade
oxy_ssp370_2020 <- calc(oxy_ssp370_2020, fun = mean, na.rm = T)
oxy_ssp370_2030 <- calc(oxy_ssp370_2030, fun = mean, na.rm = T)
oxy_ssp370_2040 <- calc(oxy_ssp370_2040, fun = mean, na.rm = T)
oxy_ssp370_2050 <- calc(oxy_ssp370_2050, fun = mean, na.rm = T)
oxy_ssp370_2060 <- calc(oxy_ssp370_2060, fun = mean, na.rm = T)
oxy_ssp370_2070 <- calc(oxy_ssp370_2070, fun = mean, na.rm = T)
oxy_ssp370_2080 <- calc(oxy_ssp370_2080, fun = mean, na.rm = T)
oxy_ssp370_2090 <- calc(oxy_ssp370_2090, fun = mean, na.rm = T)

# combine into single brick
oxy_ssp370 <- brick(oxy_ssp370_2020,
                    oxy_ssp370_2030,
                    oxy_ssp370_2040,
                    oxy_ssp370_2050,
                    oxy_ssp370_2060,
                    oxy_ssp370_2070,
                    oxy_ssp370_2080,
                    oxy_ssp370_2090)

names(oxy_ssp370) <- decades

rm(list=ls(pattern="oxy_ssp370_"))

oxy_ssp370_df <- as.data.frame(oxy_ssp370)

# ssp585
oxy_ssp585_2020 <- list()
oxy_ssp585_2030 <- list()
oxy_ssp585_2040 <- list()
oxy_ssp585_2050 <- list()
oxy_ssp585_2060 <- list()
oxy_ssp585_2070 <- list()
oxy_ssp585_2080 <- list()
oxy_ssp585_2090 <- list()

for (i in 1:4) {
  oxy_ssp585_2020[[i]] <- oxy_ssp585_names[[i]][[1]]
  oxy_ssp585_2030[[i]] <- oxy_ssp585_names[[i]][[2]]
  oxy_ssp585_2040[[i]] <- oxy_ssp585_names[[i]][[3]]
  oxy_ssp585_2050[[i]] <- oxy_ssp585_names[[i]][[4]]
  oxy_ssp585_2060[[i]] <- oxy_ssp585_names[[i]][[5]]
  oxy_ssp585_2070[[i]] <- oxy_ssp585_names[[i]][[6]]
  oxy_ssp585_2080[[i]] <- oxy_ssp585_names[[i]][[7]]
  oxy_ssp585_2090[[i]] <- oxy_ssp585_names[[i]][[8]]
}

oxy_ssp585_2020 <- brick(oxy_ssp585_2020)
oxy_ssp585_2030 <- brick(oxy_ssp585_2030)
oxy_ssp585_2040 <- brick(oxy_ssp585_2040)
oxy_ssp585_2050 <- brick(oxy_ssp585_2050)
oxy_ssp585_2060 <- brick(oxy_ssp585_2060)
oxy_ssp585_2070 <- brick(oxy_ssp585_2070)
oxy_ssp585_2080 <- brick(oxy_ssp585_2080)
oxy_ssp585_2090 <- brick(oxy_ssp585_2090)

# calculate mean for each scenario/decade
oxy_ssp585_2020 <- calc(oxy_ssp585_2020, fun = mean, na.rm = T)
oxy_ssp585_2030 <- calc(oxy_ssp585_2030, fun = mean, na.rm = T)
oxy_ssp585_2040 <- calc(oxy_ssp585_2040, fun = mean, na.rm = T)
oxy_ssp585_2050 <- calc(oxy_ssp585_2050, fun = mean, na.rm = T)
oxy_ssp585_2060 <- calc(oxy_ssp585_2060, fun = mean, na.rm = T)
oxy_ssp585_2070 <- calc(oxy_ssp585_2070, fun = mean, na.rm = T)
oxy_ssp585_2080 <- calc(oxy_ssp585_2080, fun = mean, na.rm = T)
oxy_ssp585_2090 <- calc(oxy_ssp585_2090, fun = mean, na.rm = T)

# combine into single brick
oxy_ssp585 <- brick(oxy_ssp585_2020,
                    oxy_ssp585_2030,
                    oxy_ssp585_2040,
                    oxy_ssp585_2050,
                    oxy_ssp585_2060,
                    oxy_ssp585_2070,
                    oxy_ssp585_2080,
                    oxy_ssp585_2090)

names(oxy_ssp585) <- decades

oxy_ssp585_df <- as.data.frame(oxy_ssp585)

rm(list=ls(pattern="oxy_ssp585_"))
rm(list=ls(pattern="oxy_IPSL_"))
rm(list=ls(pattern="oxy_MPI_"))
rm(list=ls(pattern="oxy_NCC_"))
rm(list=ls(pattern="oxy_GFDL_"))

writeRaster(oxy_ssp245, "CMIP6_oxy_ssp245.nc", format="CDF", overwrite=TRUE)
writeRaster(oxy_ssp370, "CMIP6_oxy_ssp370.nc", format="CDF", overwrite=TRUE)
writeRaster(oxy_ssp585, "CMIP6_oxy_ssp585.nc", format="CDF", overwrite=TRUE)
##### pH #####
# Read in rasters, going variable-by-variable
pH_MPI_ssp245  <- brick("./MPI-ESM1-2-LR/ssp245/rasters/MPI-ESM1-2-LR_SSP245-pH.nc")
pH_MPI_ssp370  <- brick("./MPI-ESM1-2-LR/ssp370/rasters/MPI-ESM1-2-LR_SSP370-pH.nc")
pH_MPI_ssp585  <- brick("./MPI-ESM1-2-LR/ssp585/rasters/MPI-ESM1-2-LR_SSP585-pH.nc")
pH_NCAR_ssp245 <- brick("./NCAR-CESM2-WACCM/ssp245/rasters/NCAR-CESM2-WACCM_SSP245-pH.nc")
pH_NCAR_ssp370 <- brick("./NCAR-CESM2-WACCM/ssp370/rasters/NCAR-CESM2-WACCM_SSP370-pH.nc")
pH_NCAR_ssp585 <- brick("./NCAR-CESM2-WACCM/ssp585/rasters/NCAR-CESM2-WACCM_SSP585-pH.nc")
pH_GFDL_ssp245 <- brick("./NOAA-GFDL-ESM4/ssp245/rasters/NOAA-GFDL-ESM4_SSP245-pH.nc")
pH_GFDL_ssp370 <- brick("./NOAA-GFDL-ESM4/ssp370/rasters/NOAA-GFDL-ESM4_SSP370-pH.nc")
pH_GFDL_ssp585 <- brick("./NOAA-GFDL-ESM4/ssp585/rasters/NOAA-GFDL-ESM4_SSP585-pH.nc")

pH_ssp245_names <- list(pH_MPI_ssp245,  
                         pH_NCAR_ssp245,
                         pH_GFDL_ssp245)

pH_ssp370_names <- list(pH_MPI_ssp370, 
                         pH_NCAR_ssp370,
                         pH_GFDL_ssp370)

pH_ssp585_names <- list(pH_MPI_ssp585,
                         pH_NCAR_ssp585,
                         pH_GFDL_ssp585)

# create merged rasters by scenario by decade - ssp245
pH_ssp245_2020 <- list()
pH_ssp245_2030 <- list()
pH_ssp245_2040 <- list()
pH_ssp245_2050 <- list()
pH_ssp245_2060 <- list()
pH_ssp245_2070 <- list()
pH_ssp245_2080 <- list()
pH_ssp245_2090 <- list()

for (i in 1:3) {
  pH_ssp245_2020[[i]] <- pH_ssp245_names[[i]][[1]]
  pH_ssp245_2030[[i]] <- pH_ssp245_names[[i]][[2]]
  pH_ssp245_2040[[i]] <- pH_ssp245_names[[i]][[3]]
  pH_ssp245_2050[[i]] <- pH_ssp245_names[[i]][[4]]
  pH_ssp245_2060[[i]] <- pH_ssp245_names[[i]][[5]]
  pH_ssp245_2070[[i]] <- pH_ssp245_names[[i]][[6]]
  pH_ssp245_2080[[i]] <- pH_ssp245_names[[i]][[7]]
  pH_ssp245_2090[[i]] <- pH_ssp245_names[[i]][[8]]
}

pH_ssp245_2020 <- brick(pH_ssp245_2020)
pH_ssp245_2030 <- brick(pH_ssp245_2030)
pH_ssp245_2040 <- brick(pH_ssp245_2040)
pH_ssp245_2050 <- brick(pH_ssp245_2050)
pH_ssp245_2060 <- brick(pH_ssp245_2060)
pH_ssp245_2070 <- brick(pH_ssp245_2070)
pH_ssp245_2080 <- brick(pH_ssp245_2080)
pH_ssp245_2090 <- brick(pH_ssp245_2090)

# calculate mean for each scenario/decade
pH_ssp245_2020 <- calc(pH_ssp245_2020, fun = mean, na.rm = T)
pH_ssp245_2030 <- calc(pH_ssp245_2030, fun = mean, na.rm = T)
pH_ssp245_2040 <- calc(pH_ssp245_2040, fun = mean, na.rm = T)
pH_ssp245_2050 <- calc(pH_ssp245_2050, fun = mean, na.rm = T)
pH_ssp245_2060 <- calc(pH_ssp245_2060, fun = mean, na.rm = T)
pH_ssp245_2070 <- calc(pH_ssp245_2070, fun = mean, na.rm = T)
pH_ssp245_2080 <- calc(pH_ssp245_2080, fun = mean, na.rm = T)
pH_ssp245_2090 <- calc(pH_ssp245_2090, fun = mean, na.rm = T)

# combine into single brick
pH_ssp245 <- brick(pH_ssp245_2020,
                    pH_ssp245_2030,
                    pH_ssp245_2040,
                    pH_ssp245_2050,
                    pH_ssp245_2060,
                    pH_ssp245_2070,
                    pH_ssp245_2080,
                    pH_ssp245_2090)

names(pH_ssp245) <- decades

rm(list=ls(pattern="pH_ssp245_"))

pH_ssp245_df <- as.data.frame(pH_ssp245)

# ssp370
# create merged rasters by scenario by decade - ssp245
pH_ssp370_2020 <- list()
pH_ssp370_2030 <- list()
pH_ssp370_2040 <- list()
pH_ssp370_2050 <- list()
pH_ssp370_2060 <- list()
pH_ssp370_2070 <- list()
pH_ssp370_2080 <- list()
pH_ssp370_2090 <- list()

for (i in 1:3) {
  pH_ssp370_2020[[i]] <- pH_ssp370_names[[i]][[1]]
  pH_ssp370_2030[[i]] <- pH_ssp370_names[[i]][[2]]
  pH_ssp370_2040[[i]] <- pH_ssp370_names[[i]][[3]]
  pH_ssp370_2050[[i]] <- pH_ssp370_names[[i]][[4]]
  pH_ssp370_2060[[i]] <- pH_ssp370_names[[i]][[5]]
  pH_ssp370_2070[[i]] <- pH_ssp370_names[[i]][[6]]
  pH_ssp370_2080[[i]] <- pH_ssp370_names[[i]][[7]]
  pH_ssp370_2090[[i]] <- pH_ssp370_names[[i]][[8]]
}

pH_ssp370_2020 <- brick(pH_ssp370_2020)
pH_ssp370_2030 <- brick(pH_ssp370_2030)
pH_ssp370_2040 <- brick(pH_ssp370_2040)
pH_ssp370_2050 <- brick(pH_ssp370_2050)
pH_ssp370_2060 <- brick(pH_ssp370_2060)
pH_ssp370_2070 <- brick(pH_ssp370_2070)
pH_ssp370_2080 <- brick(pH_ssp370_2080)
pH_ssp370_2090 <- brick(pH_ssp370_2090)

# calculate mean for each scenario/decade
pH_ssp370_2020 <- calc(pH_ssp370_2020, fun = mean, na.rm = T)
pH_ssp370_2030 <- calc(pH_ssp370_2030, fun = mean, na.rm = T)
pH_ssp370_2040 <- calc(pH_ssp370_2040, fun = mean, na.rm = T)
pH_ssp370_2050 <- calc(pH_ssp370_2050, fun = mean, na.rm = T)
pH_ssp370_2060 <- calc(pH_ssp370_2060, fun = mean, na.rm = T)
pH_ssp370_2070 <- calc(pH_ssp370_2070, fun = mean, na.rm = T)
pH_ssp370_2080 <- calc(pH_ssp370_2080, fun = mean, na.rm = T)
pH_ssp370_2090 <- calc(pH_ssp370_2090, fun = mean, na.rm = T)

# combine into single brick
pH_ssp370 <- brick(pH_ssp370_2020,
                    pH_ssp370_2030,
                    pH_ssp370_2040,
                    pH_ssp370_2050,
                    pH_ssp370_2060,
                    pH_ssp370_2070,
                    pH_ssp370_2080,
                    pH_ssp370_2090)

names(pH_ssp370) <- decades

pH_ssp370_df <- as.data.frame(pH_ssp370)

rm(list=ls(pattern="pH_ssp370_"))

# ssp585
pH_ssp585_2020 <- list()
pH_ssp585_2030 <- list()
pH_ssp585_2040 <- list()
pH_ssp585_2050 <- list()
pH_ssp585_2060 <- list()
pH_ssp585_2070 <- list()
pH_ssp585_2080 <- list()
pH_ssp585_2090 <- list()

for (i in 1:3) {
  pH_ssp585_2020[[i]] <- pH_ssp585_names[[i]][[1]]
  pH_ssp585_2030[[i]] <- pH_ssp585_names[[i]][[2]]
  pH_ssp585_2040[[i]] <- pH_ssp585_names[[i]][[3]]
  pH_ssp585_2050[[i]] <- pH_ssp585_names[[i]][[4]]
  pH_ssp585_2060[[i]] <- pH_ssp585_names[[i]][[5]]
  pH_ssp585_2070[[i]] <- pH_ssp585_names[[i]][[6]]
  pH_ssp585_2080[[i]] <- pH_ssp585_names[[i]][[7]]
  pH_ssp585_2090[[i]] <- pH_ssp585_names[[i]][[8]]
}

pH_ssp585_2020 <- brick(pH_ssp585_2020)
pH_ssp585_2030 <- brick(pH_ssp585_2030)
pH_ssp585_2040 <- brick(pH_ssp585_2040)
pH_ssp585_2050 <- brick(pH_ssp585_2050)
pH_ssp585_2060 <- brick(pH_ssp585_2060)
pH_ssp585_2070 <- brick(pH_ssp585_2070)
pH_ssp585_2080 <- brick(pH_ssp585_2080)
pH_ssp585_2090 <- brick(pH_ssp585_2090)

# calculate mean for each scenario/decade
pH_ssp585_2020 <- calc(pH_ssp585_2020, fun = mean, na.rm = T)
pH_ssp585_2030 <- calc(pH_ssp585_2030, fun = mean, na.rm = T)
pH_ssp585_2040 <- calc(pH_ssp585_2040, fun = mean, na.rm = T)
pH_ssp585_2050 <- calc(pH_ssp585_2050, fun = mean, na.rm = T)
pH_ssp585_2060 <- calc(pH_ssp585_2060, fun = mean, na.rm = T)
pH_ssp585_2070 <- calc(pH_ssp585_2070, fun = mean, na.rm = T)
pH_ssp585_2080 <- calc(pH_ssp585_2080, fun = mean, na.rm = T)
pH_ssp585_2090 <- calc(pH_ssp585_2090, fun = mean, na.rm = T)

# combine into single brick
pH_ssp585 <- brick(pH_ssp585_2020,
                    pH_ssp585_2030,
                    pH_ssp585_2040,
                    pH_ssp585_2050,
                    pH_ssp585_2060,
                    pH_ssp585_2070,
                    pH_ssp585_2080,
                    pH_ssp585_2090)

names(pH_ssp585) <- decades



rm(list=ls(pattern="pH_ssp585_"))
rm(list=ls(pattern="pH_MPI_"))
rm(list=ls(pattern="pH_NCAR_"))
rm(list=ls(pattern="pH_GFDL_"))

# Fix mismatch in ocean/land layout
pH_df  <- as.data.frame(pH_ssp585[[1]])
oxy_df <- as.data.frame(oxy_ssp585[[1]]) 

pH_df$cell_type  <- ifelse(is.na(pH_df[,1]), "land", "ocean")
oxy_df$cell_type <- ifelse(is.na(oxy_df[,1]), "land", "ocean")

cell_key <- pH_df$cell_type == oxy_df$cell_type  
df <- cbind(pH_df, oxy_df, cell_key)
make_land <- subset(df, df[,4]=="land" & df[,5]==FALSE)
misalign <- as.numeric(row.names(make_land))

make_ocean <- subset(df, df[,2]=="land" & df[,5]==FALSE) # only 64 so not a big deal

# start with a single scenario - ssp245
pH_ssp245.2020_df <- as.data.frame(pH_ssp245[[1]])
pH_ssp245.2030_df <- as.data.frame(pH_ssp245[[2]])
pH_ssp245.2040_df <- as.data.frame(pH_ssp245[[3]])
pH_ssp245.2050_df <- as.data.frame(pH_ssp245[[4]])
pH_ssp245.2060_df <- as.data.frame(pH_ssp245[[5]])
pH_ssp245.2070_df <- as.data.frame(pH_ssp245[[6]])
pH_ssp245.2080_df <- as.data.frame(pH_ssp245[[7]])
pH_ssp245.2090_df <- as.data.frame(pH_ssp245[[8]])

pH_ssp245_df <- list(pH_ssp245.2020_df,
                     pH_ssp245.2030_df,
                     pH_ssp245.2040_df,
                     pH_ssp245.2050_df,
                     pH_ssp245.2060_df,
                     pH_ssp245.2070_df,
                     pH_ssp245.2080_df,
                     pH_ssp245.2090_df)

rm(pH_ssp245.2020_df,
   pH_ssp245.2030_df,
   pH_ssp245.2040_df,
   pH_ssp245.2050_df,
   pH_ssp245.2060_df,
   pH_ssp245.2070_df,
   pH_ssp245.2080_df,
   pH_ssp245.2090_df)

for (i in 1:8) {
  pH_ssp245_df[[i]][misalign,] <- NA
  pH_ssp245_df[[i]]$x <- rep(1:360, 180)
  pH_ssp245_df[[i]]$y <- rev(rep(-89.5:89.5, each=360))
}

coordinates(pH_ssp245_df[[1]]) <- ~x+y
coordinates(pH_ssp245_df[[2]]) <- ~x+y
coordinates(pH_ssp245_df[[3]]) <- ~x+y
coordinates(pH_ssp245_df[[4]]) <- ~x+y
coordinates(pH_ssp245_df[[5]]) <- ~x+y
coordinates(pH_ssp245_df[[6]]) <- ~x+y
coordinates(pH_ssp245_df[[7]]) <- ~x+y
coordinates(pH_ssp245_df[[8]]) <- ~x+y

gridded(pH_ssp245_df[[1]]) <- TRUE
gridded(pH_ssp245_df[[2]]) <- TRUE
gridded(pH_ssp245_df[[3]]) <- TRUE
gridded(pH_ssp245_df[[4]]) <- TRUE
gridded(pH_ssp245_df[[5]]) <- TRUE
gridded(pH_ssp245_df[[6]]) <- TRUE
gridded(pH_ssp245_df[[7]]) <- TRUE
gridded(pH_ssp245_df[[8]]) <- TRUE

pH_ssp245_layers <- list()

for (i in 1:8) {
  pH_ssp245_layers[[i]] <- raster(pH_ssp245_df[[i]])
}

pH_ssp245 <- brick(pH_ssp245_layers); rm(pH_ssp245_layers, pH_ssp245_df)

pH_ssp245_df <- as.data.frame(pH_ssp245)

# ssp370
pH_ssp370.2020_df <- as.data.frame(pH_ssp370[[1]])
pH_ssp370.2030_df <- as.data.frame(pH_ssp370[[2]])
pH_ssp370.2040_df <- as.data.frame(pH_ssp370[[3]])
pH_ssp370.2050_df <- as.data.frame(pH_ssp370[[4]])
pH_ssp370.2060_df <- as.data.frame(pH_ssp370[[5]])
pH_ssp370.2070_df <- as.data.frame(pH_ssp370[[6]])
pH_ssp370.2080_df <- as.data.frame(pH_ssp370[[7]])
pH_ssp370.2090_df <- as.data.frame(pH_ssp370[[8]])

pH_ssp370_df <- list(pH_ssp370.2020_df,
                     pH_ssp370.2030_df,
                     pH_ssp370.2040_df,
                     pH_ssp370.2050_df,
                     pH_ssp370.2060_df,
                     pH_ssp370.2070_df,
                     pH_ssp370.2080_df,
                     pH_ssp370.2090_df)

rm(pH_ssp370.2020_df,
   pH_ssp370.2030_df,
   pH_ssp370.2040_df,
   pH_ssp370.2050_df,
   pH_ssp370.2060_df,
   pH_ssp370.2070_df,
   pH_ssp370.2080_df,
   pH_ssp370.2090_df)

for (i in 1:8) {
  pH_ssp370_df[[i]][misalign,] <- NA
  pH_ssp370_df[[i]]$x <- rep(1:360, 180)
  pH_ssp370_df[[i]]$y <- rev(rep(-89.5:89.5, each=360))
}

coordinates(pH_ssp370_df[[1]]) <- ~x+y
coordinates(pH_ssp370_df[[2]]) <- ~x+y
coordinates(pH_ssp370_df[[3]]) <- ~x+y
coordinates(pH_ssp370_df[[4]]) <- ~x+y
coordinates(pH_ssp370_df[[5]]) <- ~x+y
coordinates(pH_ssp370_df[[6]]) <- ~x+y
coordinates(pH_ssp370_df[[7]]) <- ~x+y
coordinates(pH_ssp370_df[[8]]) <- ~x+y

gridded(pH_ssp370_df[[1]]) <- TRUE
gridded(pH_ssp370_df[[2]]) <- TRUE
gridded(pH_ssp370_df[[3]]) <- TRUE
gridded(pH_ssp370_df[[4]]) <- TRUE
gridded(pH_ssp370_df[[5]]) <- TRUE
gridded(pH_ssp370_df[[6]]) <- TRUE
gridded(pH_ssp370_df[[7]]) <- TRUE
gridded(pH_ssp370_df[[8]]) <- TRUE

pH_ssp370_layers <- list()

for (i in 1:8) {
  pH_ssp370_layers[[i]] <- raster(pH_ssp370_df[[i]])
}

pH_ssp370 <- brick(pH_ssp370_layers); rm(pH_ssp370_layers, pH_ssp370_df)

pH_ssp370_df <- as.data.frame(pH_ssp370)

# ssp585
pH_ssp585.2020_df <- as.data.frame(pH_ssp585[[1]])
pH_ssp585.2030_df <- as.data.frame(pH_ssp585[[2]])
pH_ssp585.2040_df <- as.data.frame(pH_ssp585[[3]])
pH_ssp585.2050_df <- as.data.frame(pH_ssp585[[4]])
pH_ssp585.2060_df <- as.data.frame(pH_ssp585[[5]])
pH_ssp585.2070_df <- as.data.frame(pH_ssp585[[6]])
pH_ssp585.2080_df <- as.data.frame(pH_ssp585[[7]])
pH_ssp585.2090_df <- as.data.frame(pH_ssp585[[8]])

pH_ssp585_df <- list(pH_ssp585.2020_df,
                     pH_ssp585.2030_df,
                     pH_ssp585.2040_df,
                     pH_ssp585.2050_df,
                     pH_ssp585.2060_df,
                     pH_ssp585.2070_df,
                     pH_ssp585.2080_df,
                     pH_ssp585.2090_df)

rm(pH_ssp585.2020_df,
   pH_ssp585.2030_df,
   pH_ssp585.2040_df,
   pH_ssp585.2050_df,
   pH_ssp585.2060_df,
   pH_ssp585.2070_df,
   pH_ssp585.2080_df,
   pH_ssp585.2090_df)

for (i in 1:8) {
  pH_ssp585_df[[i]][misalign,] <- NA
  pH_ssp585_df[[i]]$x <- rep(1:360, 180)
  pH_ssp585_df[[i]]$y <- rev(rep(-89.5:89.5, each=360))
}

coordinates(pH_ssp585_df[[1]]) <- ~x+y
coordinates(pH_ssp585_df[[2]]) <- ~x+y
coordinates(pH_ssp585_df[[3]]) <- ~x+y
coordinates(pH_ssp585_df[[4]]) <- ~x+y
coordinates(pH_ssp585_df[[5]]) <- ~x+y
coordinates(pH_ssp585_df[[6]]) <- ~x+y
coordinates(pH_ssp585_df[[7]]) <- ~x+y
coordinates(pH_ssp585_df[[8]]) <- ~x+y

gridded(pH_ssp585_df[[1]]) <- TRUE
gridded(pH_ssp585_df[[2]]) <- TRUE
gridded(pH_ssp585_df[[3]]) <- TRUE
gridded(pH_ssp585_df[[4]]) <- TRUE
gridded(pH_ssp585_df[[5]]) <- TRUE
gridded(pH_ssp585_df[[6]]) <- TRUE
gridded(pH_ssp585_df[[7]]) <- TRUE
gridded(pH_ssp585_df[[8]]) <- TRUE

pH_ssp585_layers <- list()

for (i in 1:8) {
  pH_ssp585_layers[[i]] <- raster(pH_ssp585_df[[i]])
}

pH_ssp585 <- brick(pH_ssp585_layers); rm(pH_ssp585_layers, pH_ssp585_df)

pH_ssp585_df <- as.data.frame(pH_ssp585)

# write rasters
writeRaster(pH_ssp245, "CMIP6_pH_ssp245.nc", format="CDF", overwrite=TRUE)
writeRaster(pH_ssp370, "CMIP6_pH_ssp370.nc", format="CDF", overwrite=TRUE)
writeRaster(pH_ssp585, "CMIP6_pH_ssp585.nc", format="CDF", overwrite=TRUE)

##### Silica #####
# Read in rasters, going variable-by-variable
si_IPSL_ssp245 <- brick("./IPSL-CM6A-LR/ssp245/rasters/IPSL-CM6A-LR_SSP245-Silica.nc")
si_IPSL_ssp370 <- brick("./IPSL-CM6A-LR/ssp370/rasters/IPSL-CM6A-LR_SSP370-Silica.nc")
si_IPSL_ssp585 <- brick("./IPSL-CM6A-LR/ssp585/rasters/IPSL-CM6A-LR_SSP585-Silica.nc")
si_MPI_ssp245  <- brick("./MPI-ESM1-2-LR/ssp245/rasters/MPI-ESM1-2-LR_SSP245-Silica.nc")
si_MPI_ssp370  <- brick("./MPI-ESM1-2-LR/ssp370/rasters/MPI-ESM1-2-LR_SSP370-Silica.nc")
si_MPI_ssp585  <- brick("./MPI-ESM1-2-LR/ssp585/rasters/MPI-ESM1-2-LR_SSP585-Silica.nc")
si_NCAR_ssp245 <- brick("./NCAR-CESM2-WACCM/ssp245/rasters/NCAR-CESM2-WACCM_SSP245-Silica.nc")
si_NCAR_ssp370 <- brick("./NCAR-CESM2-WACCM/ssp370/rasters/NCAR-CESM2-WACCM_SSP370-Silica.nc")
si_NCAR_ssp585 <- brick("./NCAR-CESM2-WACCM/ssp585/rasters/NCAR-CESM2-WACCM_SSP585-Silica.nc")
si_NCC_ssp245  <- brick("./NCC-NorESM2-LM/ssp245/rasters/NCC-NorESM2-LM_SSP245-Silica.nc")
si_NCC_ssp370  <- brick("./NCC-NorESM2-LM/ssp370/rasters/NCC-NorESM2-LM_SSP370-Silica.nc")
si_NCC_ssp585  <- brick("./NCC-NorESM2-LM/ssp585/rasters/NCC-NorESM2-LM_SSP585-Silica.nc")
si_GFDL_ssp245 <- brick("./NOAA-GFDL-ESM4/ssp245/rasters/NOAA-GFDL-ESM4_SSP245-Silica.nc")
si_GFDL_ssp370 <- brick("./NOAA-GFDL-ESM4/ssp370/rasters/NOAA-GFDL-ESM4_SSP370-Silica.nc")
si_GFDL_ssp585 <- brick("./NOAA-GFDL-ESM4/ssp585/rasters/NOAA-GFDL-ESM4_SSP585-Silica.nc")

si_ssp245_names <- list(si_IPSL_ssp245,
                         si_MPI_ssp245,  
                         si_NCAR_ssp245,
                         si_NCC_ssp245,  
                         si_GFDL_ssp245)

si_ssp370_names <- list(si_IPSL_ssp370,
                         si_MPI_ssp370, 
                         si_NCAR_ssp370,
                         si_NCC_ssp370, 
                         si_GFDL_ssp370)

si_ssp585_names <- list(si_IPSL_ssp585,
                         si_MPI_ssp585,
                         si_NCAR_ssp585,
                         si_NCC_ssp585,
                         si_GFDL_ssp585)

# create merged rasters by scenario by decade - ssp245
si_ssp245_2020 <- list()
si_ssp245_2030 <- list()
si_ssp245_2040 <- list()
si_ssp245_2050 <- list()
si_ssp245_2060 <- list()
si_ssp245_2070 <- list()
si_ssp245_2080 <- list()
si_ssp245_2090 <- list()

for (i in 1:5) {
  si_ssp245_2020[[i]] <- si_ssp245_names[[i]][[1]]
  si_ssp245_2030[[i]] <- si_ssp245_names[[i]][[2]]
  si_ssp245_2040[[i]] <- si_ssp245_names[[i]][[3]]
  si_ssp245_2050[[i]] <- si_ssp245_names[[i]][[4]]
  si_ssp245_2060[[i]] <- si_ssp245_names[[i]][[5]]
  si_ssp245_2070[[i]] <- si_ssp245_names[[i]][[6]]
  si_ssp245_2080[[i]] <- si_ssp245_names[[i]][[7]]
  si_ssp245_2090[[i]] <- si_ssp245_names[[i]][[8]]
}

si_ssp245_2020 <- brick(si_ssp245_2020)
si_ssp245_2030 <- brick(si_ssp245_2030)
si_ssp245_2040 <- brick(si_ssp245_2040)
si_ssp245_2050 <- brick(si_ssp245_2050)
si_ssp245_2060 <- brick(si_ssp245_2060)
si_ssp245_2070 <- brick(si_ssp245_2070)
si_ssp245_2080 <- brick(si_ssp245_2080)
si_ssp245_2090 <- brick(si_ssp245_2090)

# calculate mean for each scenario/decade
si_ssp245_2020 <- calc(si_ssp245_2020, fun = mean, na.rm = T)
si_ssp245_2030 <- calc(si_ssp245_2030, fun = mean, na.rm = T)
si_ssp245_2040 <- calc(si_ssp245_2040, fun = mean, na.rm = T)
si_ssp245_2050 <- calc(si_ssp245_2050, fun = mean, na.rm = T)
si_ssp245_2060 <- calc(si_ssp245_2060, fun = mean, na.rm = T)
si_ssp245_2070 <- calc(si_ssp245_2070, fun = mean, na.rm = T)
si_ssp245_2080 <- calc(si_ssp245_2080, fun = mean, na.rm = T)
si_ssp245_2090 <- calc(si_ssp245_2090, fun = mean, na.rm = T)

# combine into single brick
si_ssp245 <- brick(si_ssp245_2020,
                    si_ssp245_2030,
                    si_ssp245_2040,
                    si_ssp245_2050,
                    si_ssp245_2060,
                    si_ssp245_2070,
                    si_ssp245_2080,
                    si_ssp245_2090)

names(si_ssp245) <- decades

si_ssp245_df <- as.data.frame(si_ssp245)

rm(list=ls(pattern="si_ssp245_"))

# ssp370
# create merged rasters by scenario by decade - ssp245
si_ssp370_2020 <- list()
si_ssp370_2030 <- list()
si_ssp370_2040 <- list()
si_ssp370_2050 <- list()
si_ssp370_2060 <- list()
si_ssp370_2070 <- list()
si_ssp370_2080 <- list()
si_ssp370_2090 <- list()

for (i in 1:5) {
  si_ssp370_2020[[i]] <- si_ssp370_names[[i]][[1]]
  si_ssp370_2030[[i]] <- si_ssp370_names[[i]][[2]]
  si_ssp370_2040[[i]] <- si_ssp370_names[[i]][[3]]
  si_ssp370_2050[[i]] <- si_ssp370_names[[i]][[4]]
  si_ssp370_2060[[i]] <- si_ssp370_names[[i]][[5]]
  si_ssp370_2070[[i]] <- si_ssp370_names[[i]][[6]]
  si_ssp370_2080[[i]] <- si_ssp370_names[[i]][[7]]
  si_ssp370_2090[[i]] <- si_ssp370_names[[i]][[8]]
}

si_ssp370_2020 <- brick(si_ssp370_2020)
si_ssp370_2030 <- brick(si_ssp370_2030)
si_ssp370_2040 <- brick(si_ssp370_2040)
si_ssp370_2050 <- brick(si_ssp370_2050)
si_ssp370_2060 <- brick(si_ssp370_2060)
si_ssp370_2070 <- brick(si_ssp370_2070)
si_ssp370_2080 <- brick(si_ssp370_2080)
si_ssp370_2090 <- brick(si_ssp370_2090)

# calculate mean for each scenario/decade
si_ssp370_2020 <- calc(si_ssp370_2020, fun = mean, na.rm = T)
si_ssp370_2030 <- calc(si_ssp370_2030, fun = mean, na.rm = T)
si_ssp370_2040 <- calc(si_ssp370_2040, fun = mean, na.rm = T)
si_ssp370_2050 <- calc(si_ssp370_2050, fun = mean, na.rm = T)
si_ssp370_2060 <- calc(si_ssp370_2060, fun = mean, na.rm = T)
si_ssp370_2070 <- calc(si_ssp370_2070, fun = mean, na.rm = T)
si_ssp370_2080 <- calc(si_ssp370_2080, fun = mean, na.rm = T)
si_ssp370_2090 <- calc(si_ssp370_2090, fun = mean, na.rm = T)

# combine into single brick
si_ssp370 <- brick(si_ssp370_2020,
                    si_ssp370_2030,
                    si_ssp370_2040,
                    si_ssp370_2050,
                    si_ssp370_2060,
                    si_ssp370_2070,
                    si_ssp370_2080,
                    si_ssp370_2090)

names(si_ssp370) <- decades

si_ssp370_df <- as.data.frame(si_ssp370)

rm(list=ls(pattern="si_ssp370_"))

# ssp585
si_ssp585_2020 <- list()
si_ssp585_2030 <- list()
si_ssp585_2040 <- list()
si_ssp585_2050 <- list()
si_ssp585_2060 <- list()
si_ssp585_2070 <- list()
si_ssp585_2080 <- list()
si_ssp585_2090 <- list()

for (i in 1:5) {
  si_ssp585_2020[[i]] <- si_ssp585_names[[i]][[1]]
  si_ssp585_2030[[i]] <- si_ssp585_names[[i]][[2]]
  si_ssp585_2040[[i]] <- si_ssp585_names[[i]][[3]]
  si_ssp585_2050[[i]] <- si_ssp585_names[[i]][[4]]
  si_ssp585_2060[[i]] <- si_ssp585_names[[i]][[5]]
  si_ssp585_2070[[i]] <- si_ssp585_names[[i]][[6]]
  si_ssp585_2080[[i]] <- si_ssp585_names[[i]][[7]]
  si_ssp585_2090[[i]] <- si_ssp585_names[[i]][[8]]
}

si_ssp585_2020 <- brick(si_ssp585_2020)
si_ssp585_2030 <- brick(si_ssp585_2030)
si_ssp585_2040 <- brick(si_ssp585_2040)
si_ssp585_2050 <- brick(si_ssp585_2050)
si_ssp585_2060 <- brick(si_ssp585_2060)
si_ssp585_2070 <- brick(si_ssp585_2070)
si_ssp585_2080 <- brick(si_ssp585_2080)
si_ssp585_2090 <- brick(si_ssp585_2090)

# calculate mean for each scenario/decade
si_ssp585_2020 <- calc(si_ssp585_2020, fun = mean, na.rm = T)
si_ssp585_2030 <- calc(si_ssp585_2030, fun = mean, na.rm = T)
si_ssp585_2040 <- calc(si_ssp585_2040, fun = mean, na.rm = T)
si_ssp585_2050 <- calc(si_ssp585_2050, fun = mean, na.rm = T)
si_ssp585_2060 <- calc(si_ssp585_2060, fun = mean, na.rm = T)
si_ssp585_2070 <- calc(si_ssp585_2070, fun = mean, na.rm = T)
si_ssp585_2080 <- calc(si_ssp585_2080, fun = mean, na.rm = T)
si_ssp585_2090 <- calc(si_ssp585_2090, fun = mean, na.rm = T)

# combine into single brick
si_ssp585 <- brick(si_ssp585_2020,
                    si_ssp585_2030,
                    si_ssp585_2040,
                    si_ssp585_2050,
                    si_ssp585_2060,
                    si_ssp585_2070,
                    si_ssp585_2080,
                    si_ssp585_2090)

names(si_ssp585) <- decades

si_ssp585_df <- as.data.frame(si_ssp585)

rm(list=ls(pattern="si_ssp585_"))
rm(list=ls(pattern="si_IPSL_"))
rm(list=ls(pattern="si_MPI_"))
rm(list=ls(pattern="si_NCC_"))
rm(list=ls(pattern="si_NCAR_"))
rm(list=ls(pattern="si_GFDL_"))

writeRaster(si_ssp245, "CMIP6_si_ssp245.nc", format="CDF", overwrite=TRUE)
writeRaster(si_ssp370, "CMIP6_si_ssp370.nc", format="CDF", overwrite=TRUE)
writeRaster(si_ssp585, "CMIP6_si_ssp585.nc", format="CDF", overwrite=TRUE)

##### Sea Surface Temperature #####
# Read in rasters, going variable-by-variable
sst_IPSL_ssp245 <- brick("./IPSL-CM6A-LR/ssp245/rasters/IPSL-CM6A-LR_SSP245-SST.nc")
sst_IPSL_ssp370 <- brick("./IPSL-CM6A-LR/ssp370/rasters/IPSL-CM6A-LR_SSP370-SST.nc")
sst_IPSL_ssp585 <- brick("./IPSL-CM6A-LR/ssp585/rasters/IPSL-CM6A-LR_SSP585-SST.nc")
sst_MPI_ssp245  <- brick("./MPI-ESM1-2-LR/ssp245/rasters/MPI-ESM1-2-LR_SSP245-SST.nc")
sst_MPI_ssp370  <- brick("./MPI-ESM1-2-LR/ssp370/rasters/MPI-ESM1-2-LR_SSP370-SST.nc")
sst_MPI_ssp585  <- brick("./MPI-ESM1-2-LR/ssp585/rasters/MPI-ESM1-2-LR_SSP585-SST.nc")
sst_NCAR_ssp245 <- brick("./NCAR-CESM2-WACCM/ssp245/rasters/NCAR-CESM2-WACCM_SSP245-SST.nc")
sst_NCAR_ssp370 <- brick("./NCAR-CESM2-WACCM/ssp370/rasters/NCAR-CESM2-WACCM_SSP370-SST.nc")
sst_NCAR_ssp585 <- brick("./NCAR-CESM2-WACCM/ssp585/rasters/NCAR-CESM2-WACCM_SSP585-SST.nc")
sst_NCC_ssp245  <- brick("./NCC-NorESM2-LM/ssp245/rasters/NCC-NorESM2-LM_SSP245-SST.nc")
sst_NCC_ssp370  <- brick("./NCC-NorESM2-LM/ssp370/rasters/NCC-NorESM2-LM_SSP370-SST.nc")
sst_NCC_ssp585  <- brick("./NCC-NorESM2-LM/ssp585/rasters/NCC-NorESM2-LM_SSP585-SST.nc")
sst_GFDL_ssp245 <- brick("./NOAA-GFDL-ESM4/ssp245/rasters/NOAA-GFDL-ESM4_SSP245-SST.nc")
sst_GFDL_ssp370 <- brick("./NOAA-GFDL-ESM4/ssp370/rasters/NOAA-GFDL-ESM4_SSP370-SST.nc")
sst_GFDL_ssp585 <- brick("./NOAA-GFDL-ESM4/ssp585/rasters/NOAA-GFDL-ESM4_SSP585-SST.nc")

sst_ssp245_names <- list(sst_IPSL_ssp245,
                        sst_MPI_ssp245,  
                        sst_NCAR_ssp245,
                        sst_NCC_ssp245,  
                        sst_GFDL_ssp245)

sst_ssp370_names <- list(sst_IPSL_ssp370,
                        sst_MPI_ssp370, 
                        sst_NCAR_ssp370,
                        sst_NCC_ssp370, 
                        sst_GFDL_ssp370)

sst_ssp585_names <- list(sst_IPSL_ssp585,
                        sst_MPI_ssp585,
                        sst_NCAR_ssp585,
                        sst_NCC_ssp585,
                        sst_GFDL_ssp585)

# create merged rasters by scenario by decade - ssp245
sst_ssp245_2020 <- list()
sst_ssp245_2030 <- list()
sst_ssp245_2040 <- list()
sst_ssp245_2050 <- list()
sst_ssp245_2060 <- list()
sst_ssp245_2070 <- list()
sst_ssp245_2080 <- list()
sst_ssp245_2090 <- list()

for (i in 1:5) {
  sst_ssp245_2020[[i]] <- sst_ssp245_names[[i]][[1]]
  sst_ssp245_2030[[i]] <- sst_ssp245_names[[i]][[2]]
  sst_ssp245_2040[[i]] <- sst_ssp245_names[[i]][[3]]
  sst_ssp245_2050[[i]] <- sst_ssp245_names[[i]][[4]]
  sst_ssp245_2060[[i]] <- sst_ssp245_names[[i]][[5]]
  sst_ssp245_2070[[i]] <- sst_ssp245_names[[i]][[6]]
  sst_ssp245_2080[[i]] <- sst_ssp245_names[[i]][[7]]
  sst_ssp245_2090[[i]] <- sst_ssp245_names[[i]][[8]]
}

sst_ssp245_2020 <- brick(sst_ssp245_2020)
sst_ssp245_2030 <- brick(sst_ssp245_2030)
sst_ssp245_2040 <- brick(sst_ssp245_2040)
sst_ssp245_2050 <- brick(sst_ssp245_2050)
sst_ssp245_2060 <- brick(sst_ssp245_2060)
sst_ssp245_2070 <- brick(sst_ssp245_2070)
sst_ssp245_2080 <- brick(sst_ssp245_2080)
sst_ssp245_2090 <- brick(sst_ssp245_2090)

# calculate mean for each scenario/decade
sst_ssp245_2020 <- calc(sst_ssp245_2020, fun = mean, na.rm = T)
sst_ssp245_2030 <- calc(sst_ssp245_2030, fun = mean, na.rm = T)
sst_ssp245_2040 <- calc(sst_ssp245_2040, fun = mean, na.rm = T)
sst_ssp245_2050 <- calc(sst_ssp245_2050, fun = mean, na.rm = T)
sst_ssp245_2060 <- calc(sst_ssp245_2060, fun = mean, na.rm = T)
sst_ssp245_2070 <- calc(sst_ssp245_2070, fun = mean, na.rm = T)
sst_ssp245_2080 <- calc(sst_ssp245_2080, fun = mean, na.rm = T)
sst_ssp245_2090 <- calc(sst_ssp245_2090, fun = mean, na.rm = T)

# combine into sstngle brick
sst_ssp245 <- brick(sst_ssp245_2020,
                   sst_ssp245_2030,
                   sst_ssp245_2040,
                   sst_ssp245_2050,
                   sst_ssp245_2060,
                   sst_ssp245_2070,
                   sst_ssp245_2080,
                   sst_ssp245_2090)

names(sst_ssp245) <- decades

sst_ssp245_df <- as.data.frame(sst_ssp245)

rm(list=ls(pattern="sst_ssp245_"))

# ssp370
# create merged rasters by scenario by decade - ssp245
sst_ssp370_2020 <- list()
sst_ssp370_2030 <- list()
sst_ssp370_2040 <- list()
sst_ssp370_2050 <- list()
sst_ssp370_2060 <- list()
sst_ssp370_2070 <- list()
sst_ssp370_2080 <- list()
sst_ssp370_2090 <- list()

for (i in 1:5) {
  sst_ssp370_2020[[i]] <- sst_ssp370_names[[i]][[1]]
  sst_ssp370_2030[[i]] <- sst_ssp370_names[[i]][[2]]
  sst_ssp370_2040[[i]] <- sst_ssp370_names[[i]][[3]]
  sst_ssp370_2050[[i]] <- sst_ssp370_names[[i]][[4]]
  sst_ssp370_2060[[i]] <- sst_ssp370_names[[i]][[5]]
  sst_ssp370_2070[[i]] <- sst_ssp370_names[[i]][[6]]
  sst_ssp370_2080[[i]] <- sst_ssp370_names[[i]][[7]]
  sst_ssp370_2090[[i]] <- sst_ssp370_names[[i]][[8]]
}

sst_ssp370_2020 <- brick(sst_ssp370_2020)
sst_ssp370_2030 <- brick(sst_ssp370_2030)
sst_ssp370_2040 <- brick(sst_ssp370_2040)
sst_ssp370_2050 <- brick(sst_ssp370_2050)
sst_ssp370_2060 <- brick(sst_ssp370_2060)
sst_ssp370_2070 <- brick(sst_ssp370_2070)
sst_ssp370_2080 <- brick(sst_ssp370_2080)
sst_ssp370_2090 <- brick(sst_ssp370_2090)

# calculate mean for each scenario/decade
sst_ssp370_2020 <- calc(sst_ssp370_2020, fun = mean, na.rm = T)
sst_ssp370_2030 <- calc(sst_ssp370_2030, fun = mean, na.rm = T)
sst_ssp370_2040 <- calc(sst_ssp370_2040, fun = mean, na.rm = T)
sst_ssp370_2050 <- calc(sst_ssp370_2050, fun = mean, na.rm = T)
sst_ssp370_2060 <- calc(sst_ssp370_2060, fun = mean, na.rm = T)
sst_ssp370_2070 <- calc(sst_ssp370_2070, fun = mean, na.rm = T)
sst_ssp370_2080 <- calc(sst_ssp370_2080, fun = mean, na.rm = T)
sst_ssp370_2090 <- calc(sst_ssp370_2090, fun = mean, na.rm = T)

# combine into sstngle brick
sst_ssp370 <- brick(sst_ssp370_2020,
                   sst_ssp370_2030,
                   sst_ssp370_2040,
                   sst_ssp370_2050,
                   sst_ssp370_2060,
                   sst_ssp370_2070,
                   sst_ssp370_2080,
                   sst_ssp370_2090)

names(sst_ssp370) <- decades

sst_ssp370_df <- as.data.frame(sst_ssp370)

rm(list=ls(pattern="sst_ssp370_"))

# ssp585
sst_ssp585_2020 <- list()
sst_ssp585_2030 <- list()
sst_ssp585_2040 <- list()
sst_ssp585_2050 <- list()
sst_ssp585_2060 <- list()
sst_ssp585_2070 <- list()
sst_ssp585_2080 <- list()
sst_ssp585_2090 <- list()

for (i in 1:5) {
  sst_ssp585_2020[[i]] <- sst_ssp585_names[[i]][[1]]
  sst_ssp585_2030[[i]] <- sst_ssp585_names[[i]][[2]]
  sst_ssp585_2040[[i]] <- sst_ssp585_names[[i]][[3]]
  sst_ssp585_2050[[i]] <- sst_ssp585_names[[i]][[4]]
  sst_ssp585_2060[[i]] <- sst_ssp585_names[[i]][[5]]
  sst_ssp585_2070[[i]] <- sst_ssp585_names[[i]][[6]]
  sst_ssp585_2080[[i]] <- sst_ssp585_names[[i]][[7]]
  sst_ssp585_2090[[i]] <- sst_ssp585_names[[i]][[8]]
}

sst_ssp585_2020 <- brick(sst_ssp585_2020)
sst_ssp585_2030 <- brick(sst_ssp585_2030)
sst_ssp585_2040 <- brick(sst_ssp585_2040)
sst_ssp585_2050 <- brick(sst_ssp585_2050)
sst_ssp585_2060 <- brick(sst_ssp585_2060)
sst_ssp585_2070 <- brick(sst_ssp585_2070)
sst_ssp585_2080 <- brick(sst_ssp585_2080)
sst_ssp585_2090 <- brick(sst_ssp585_2090)

# calculate mean for each scenario/decade
sst_ssp585_2020 <- calc(sst_ssp585_2020, fun = mean, na.rm = T)
sst_ssp585_2030 <- calc(sst_ssp585_2030, fun = mean, na.rm = T)
sst_ssp585_2040 <- calc(sst_ssp585_2040, fun = mean, na.rm = T)
sst_ssp585_2050 <- calc(sst_ssp585_2050, fun = mean, na.rm = T)
sst_ssp585_2060 <- calc(sst_ssp585_2060, fun = mean, na.rm = T)
sst_ssp585_2070 <- calc(sst_ssp585_2070, fun = mean, na.rm = T)
sst_ssp585_2080 <- calc(sst_ssp585_2080, fun = mean, na.rm = T)
sst_ssp585_2090 <- calc(sst_ssp585_2090, fun = mean, na.rm = T)

# combine into sstngle brick
sst_ssp585 <- brick(sst_ssp585_2020,
                   sst_ssp585_2030,
                   sst_ssp585_2040,
                   sst_ssp585_2050,
                   sst_ssp585_2060,
                   sst_ssp585_2070,
                   sst_ssp585_2080,
                   sst_ssp585_2090)

names(sst_ssp585) <- decades

sst_ssp585_df <- as.data.frame(sst_ssp585)

rm(list=ls(pattern="sst_ssp585_"))
rm(list=ls(pattern="sst_IPSL_"))
rm(list=ls(pattern="sst_MPI_"))
rm(list=ls(pattern="sst_NCC_"))
rm(list=ls(pattern="sst_NCAR_"))
rm(list=ls(pattern="sst_GFDL_"))

writeRaster(sst_ssp245, "CMIP6_sst_ssp245.nc", format="CDF", overwrite=TRUE)
writeRaster(sst_ssp370, "CMIP6_sst_ssp370.nc", format="CDF", overwrite=TRUE)
writeRaster(sst_ssp585, "CMIP6_sst_ssp585.nc", format="CDF", overwrite=TRUE)

##### Zooplankton #####
# Read in rasters, going variable-by-variable
zoo_IPSL_ssp245 <- brick("./IPSL-CM6A-LR/ssp245/rasters/IPSL-CM6A-LR_SSP245-Zooplankton.nc")
zoo_IPSL_ssp370 <- brick("./IPSL-CM6A-LR/ssp370/rasters/IPSL-CM6A-LR_SSP370-Zooplankton.nc")
zoo_IPSL_ssp585 <- brick("./IPSL-CM6A-LR/ssp585/rasters/IPSL-CM6A-LR_SSP585-Zooplankton.nc")
zoo_MPI_ssp245  <- brick("./MPI-ESM1-2-LR/ssp245/rasters/MPI-ESM1-2-LR_SSP245-Zooplankton.nc")
zoo_MPI_ssp370  <- brick("./MPI-ESM1-2-LR/ssp370/rasters/MPI-ESM1-2-LR_SSP370-Zooplankton.nc")
zoo_MPI_ssp585  <- brick("./MPI-ESM1-2-LR/ssp585/rasters/MPI-ESM1-2-LR_SSP585-Zooplankton.nc")
zoo_NCAR_ssp245 <- brick("./NCAR-CESM2-WACCM/ssp245/rasters/NCAR-CESM2-WACCM_SSP245-Zooplankton.nc")
zoo_NCAR_ssp370 <- brick("./NCAR-CESM2-WACCM/ssp370/rasters/NCAR-CESM2-WACCM_SSP370-Zooplankton.nc")
zoo_NCAR_ssp585 <- brick("./NCAR-CESM2-WACCM/ssp585/rasters/NCAR-CESM2-WACCM_SSP585-Zooplankton.nc")
zoo_NCC_ssp245  <- brick("./NCC-NorESM2-LM/ssp245/rasters/NCC-NorESM2-LM_SSP245-Zooplankton.nc")
zoo_NCC_ssp370  <- brick("./NCC-NorESM2-LM/ssp370/rasters/NCC-NorESM2-LM_SSP370-Zooplankton.nc")
zoo_NCC_ssp585  <- brick("./NCC-NorESM2-LM/ssp585/rasters/NCC-NorESM2-LM_SSP585-Zooplankton.nc")
zoo_GFDL_ssp245 <- brick("./NOAA-GFDL-ESM4/ssp245/rasters/NOAA-GFDL-ESM4_SSP245-Zooplankton.nc")
zoo_GFDL_ssp370 <- brick("./NOAA-GFDL-ESM4/ssp370/rasters/NOAA-GFDL-ESM4_SSP370-Zooplankton.nc")
zoo_GFDL_ssp585 <- brick("./NOAA-GFDL-ESM4/ssp585/rasters/NOAA-GFDL-ESM4_SSP585-Zooplankton.nc")

zoo_ssp245_names <- list(zoo_IPSL_ssp245,
                         zoo_MPI_ssp245,  
                         zoo_NCAR_ssp245,
                         zoo_NCC_ssp245,  
                         zoo_GFDL_ssp245)

zoo_ssp370_names <- list(zoo_IPSL_ssp370,
                         zoo_MPI_ssp370, 
                         zoo_NCAR_ssp370,
                         zoo_NCC_ssp370, 
                         zoo_GFDL_ssp370)

zoo_ssp585_names <- list(zoo_IPSL_ssp585,
                         zoo_MPI_ssp585,
                         zoo_NCAR_ssp585,
                         zoo_NCC_ssp585,
                         zoo_GFDL_ssp585)

# create merged rasters by scenario by decade - ssp245
zoo_ssp245_2020 <- list()
zoo_ssp245_2030 <- list()
zoo_ssp245_2040 <- list()
zoo_ssp245_2050 <- list()
zoo_ssp245_2060 <- list()
zoo_ssp245_2070 <- list()
zoo_ssp245_2080 <- list()
zoo_ssp245_2090 <- list()

for (i in 1:5) {
  zoo_ssp245_2020[[i]] <- zoo_ssp245_names[[i]][[1]]
  zoo_ssp245_2030[[i]] <- zoo_ssp245_names[[i]][[2]]
  zoo_ssp245_2040[[i]] <- zoo_ssp245_names[[i]][[3]]
  zoo_ssp245_2050[[i]] <- zoo_ssp245_names[[i]][[4]]
  zoo_ssp245_2060[[i]] <- zoo_ssp245_names[[i]][[5]]
  zoo_ssp245_2070[[i]] <- zoo_ssp245_names[[i]][[6]]
  zoo_ssp245_2080[[i]] <- zoo_ssp245_names[[i]][[7]]
  zoo_ssp245_2090[[i]] <- zoo_ssp245_names[[i]][[8]]
}

zoo_ssp245_2020 <- brick(zoo_ssp245_2020)
zoo_ssp245_2030 <- brick(zoo_ssp245_2030)
zoo_ssp245_2040 <- brick(zoo_ssp245_2040)
zoo_ssp245_2050 <- brick(zoo_ssp245_2050)
zoo_ssp245_2060 <- brick(zoo_ssp245_2060)
zoo_ssp245_2070 <- brick(zoo_ssp245_2070)
zoo_ssp245_2080 <- brick(zoo_ssp245_2080)
zoo_ssp245_2090 <- brick(zoo_ssp245_2090)

# calculate mean for each scenario/decade
zoo_ssp245_2020 <- calc(zoo_ssp245_2020, fun = mean, na.rm = T)
zoo_ssp245_2030 <- calc(zoo_ssp245_2030, fun = mean, na.rm = T)
zoo_ssp245_2040 <- calc(zoo_ssp245_2040, fun = mean, na.rm = T)
zoo_ssp245_2050 <- calc(zoo_ssp245_2050, fun = mean, na.rm = T)
zoo_ssp245_2060 <- calc(zoo_ssp245_2060, fun = mean, na.rm = T)
zoo_ssp245_2070 <- calc(zoo_ssp245_2070, fun = mean, na.rm = T)
zoo_ssp245_2080 <- calc(zoo_ssp245_2080, fun = mean, na.rm = T)
zoo_ssp245_2090 <- calc(zoo_ssp245_2090, fun = mean, na.rm = T)

# combine into zoongle brick
zoo_ssp245 <- brick(zoo_ssp245_2020,
                    zoo_ssp245_2030,
                    zoo_ssp245_2040,
                    zoo_ssp245_2050,
                    zoo_ssp245_2060,
                    zoo_ssp245_2070,
                    zoo_ssp245_2080,
                    zoo_ssp245_2090)

names(zoo_ssp245) <- decades

zoo_ssp245_df <- as.data.frame(zoo_ssp245)

rm(list=ls(pattern="zoo_ssp245_"))

# ssp370
# create merged rasters by scenario by decade - ssp245
zoo_ssp370_2020 <- list()
zoo_ssp370_2030 <- list()
zoo_ssp370_2040 <- list()
zoo_ssp370_2050 <- list()
zoo_ssp370_2060 <- list()
zoo_ssp370_2070 <- list()
zoo_ssp370_2080 <- list()
zoo_ssp370_2090 <- list()

for (i in 1:5) {
  zoo_ssp370_2020[[i]] <- zoo_ssp370_names[[i]][[1]]
  zoo_ssp370_2030[[i]] <- zoo_ssp370_names[[i]][[2]]
  zoo_ssp370_2040[[i]] <- zoo_ssp370_names[[i]][[3]]
  zoo_ssp370_2050[[i]] <- zoo_ssp370_names[[i]][[4]]
  zoo_ssp370_2060[[i]] <- zoo_ssp370_names[[i]][[5]]
  zoo_ssp370_2070[[i]] <- zoo_ssp370_names[[i]][[6]]
  zoo_ssp370_2080[[i]] <- zoo_ssp370_names[[i]][[7]]
  zoo_ssp370_2090[[i]] <- zoo_ssp370_names[[i]][[8]]
}

zoo_ssp370_2020 <- brick(zoo_ssp370_2020)
zoo_ssp370_2030 <- brick(zoo_ssp370_2030)
zoo_ssp370_2040 <- brick(zoo_ssp370_2040)
zoo_ssp370_2050 <- brick(zoo_ssp370_2050)
zoo_ssp370_2060 <- brick(zoo_ssp370_2060)
zoo_ssp370_2070 <- brick(zoo_ssp370_2070)
zoo_ssp370_2080 <- brick(zoo_ssp370_2080)
zoo_ssp370_2090 <- brick(zoo_ssp370_2090)

# calculate mean for each scenario/decade
zoo_ssp370_2020 <- calc(zoo_ssp370_2020, fun = mean, na.rm = T)
zoo_ssp370_2030 <- calc(zoo_ssp370_2030, fun = mean, na.rm = T)
zoo_ssp370_2040 <- calc(zoo_ssp370_2040, fun = mean, na.rm = T)
zoo_ssp370_2050 <- calc(zoo_ssp370_2050, fun = mean, na.rm = T)
zoo_ssp370_2060 <- calc(zoo_ssp370_2060, fun = mean, na.rm = T)
zoo_ssp370_2070 <- calc(zoo_ssp370_2070, fun = mean, na.rm = T)
zoo_ssp370_2080 <- calc(zoo_ssp370_2080, fun = mean, na.rm = T)
zoo_ssp370_2090 <- calc(zoo_ssp370_2090, fun = mean, na.rm = T)

# combine into zoongle brick
zoo_ssp370 <- brick(zoo_ssp370_2020,
                    zoo_ssp370_2030,
                    zoo_ssp370_2040,
                    zoo_ssp370_2050,
                    zoo_ssp370_2060,
                    zoo_ssp370_2070,
                    zoo_ssp370_2080,
                    zoo_ssp370_2090)

names(zoo_ssp370) <- decades

zoo_ssp370_df <- as.data.frame(zoo_ssp370)

rm(list=ls(pattern="zoo_ssp370_"))

# ssp585
zoo_ssp585_2020 <- list()
zoo_ssp585_2030 <- list()
zoo_ssp585_2040 <- list()
zoo_ssp585_2050 <- list()
zoo_ssp585_2060 <- list()
zoo_ssp585_2070 <- list()
zoo_ssp585_2080 <- list()
zoo_ssp585_2090 <- list()

for (i in 1:5) {
  zoo_ssp585_2020[[i]] <- zoo_ssp585_names[[i]][[1]]
  zoo_ssp585_2030[[i]] <- zoo_ssp585_names[[i]][[2]]
  zoo_ssp585_2040[[i]] <- zoo_ssp585_names[[i]][[3]]
  zoo_ssp585_2050[[i]] <- zoo_ssp585_names[[i]][[4]]
  zoo_ssp585_2060[[i]] <- zoo_ssp585_names[[i]][[5]]
  zoo_ssp585_2070[[i]] <- zoo_ssp585_names[[i]][[6]]
  zoo_ssp585_2080[[i]] <- zoo_ssp585_names[[i]][[7]]
  zoo_ssp585_2090[[i]] <- zoo_ssp585_names[[i]][[8]]
}

zoo_ssp585_2020 <- brick(zoo_ssp585_2020)
zoo_ssp585_2030 <- brick(zoo_ssp585_2030)
zoo_ssp585_2040 <- brick(zoo_ssp585_2040)
zoo_ssp585_2050 <- brick(zoo_ssp585_2050)
zoo_ssp585_2060 <- brick(zoo_ssp585_2060)
zoo_ssp585_2070 <- brick(zoo_ssp585_2070)
zoo_ssp585_2080 <- brick(zoo_ssp585_2080)
zoo_ssp585_2090 <- brick(zoo_ssp585_2090)

# calculate mean for each scenario/decade
zoo_ssp585_2020 <- calc(zoo_ssp585_2020, fun = mean, na.rm = T)
zoo_ssp585_2030 <- calc(zoo_ssp585_2030, fun = mean, na.rm = T)
zoo_ssp585_2040 <- calc(zoo_ssp585_2040, fun = mean, na.rm = T)
zoo_ssp585_2050 <- calc(zoo_ssp585_2050, fun = mean, na.rm = T)
zoo_ssp585_2060 <- calc(zoo_ssp585_2060, fun = mean, na.rm = T)
zoo_ssp585_2070 <- calc(zoo_ssp585_2070, fun = mean, na.rm = T)
zoo_ssp585_2080 <- calc(zoo_ssp585_2080, fun = mean, na.rm = T)
zoo_ssp585_2090 <- calc(zoo_ssp585_2090, fun = mean, na.rm = T)

# combine into zoongle brick
zoo_ssp585 <- brick(zoo_ssp585_2020,
                    zoo_ssp585_2030,
                    zoo_ssp585_2040,
                    zoo_ssp585_2050,
                    zoo_ssp585_2060,
                    zoo_ssp585_2070,
                    zoo_ssp585_2080,
                    zoo_ssp585_2090)

names(zoo_ssp585) <- decades

zoo_ssp585_df <- as.data.frame(zoo_ssp585)

rm(list=ls(pattern="zoo_ssp585_"))
rm(list=ls(pattern="zoo_IPSL_"))
rm(list=ls(pattern="zoo_MPI_"))
rm(list=ls(pattern="zoo_NCC_"))
rm(list=ls(pattern="zoo_NCAR_"))
rm(list=ls(pattern="zoo_GFDL_"))

writeRaster(zoo_ssp245, "CMIP6_zoo_ssp245.nc", format="CDF", overwrite=TRUE)
writeRaster(zoo_ssp370, "CMIP6_zoo_ssp370.nc", format="CDF", overwrite=TRUE)
writeRaster(zoo_ssp585, "CMIP6_zoo_ssp585.nc", format="CDF", overwrite=TRUE)

##### Calculate ONo Index (NOTE: doing it twice: once with pH and once without pH) #####
##### with pH #####
ssp245 <- c(chl_ssp245,
            oxy_ssp245,
            pH_ssp245,
            si_ssp245,
            sst_ssp245,
            zoo_ssp245)
names(ssp245) <- variables

ssp370 <- c(chl_ssp370,
            oxy_ssp370,
            pH_ssp370,
            si_ssp370,
            sst_ssp370,
            zoo_ssp370)
names(ssp370) <- variables

ssp585 <- c(chl_ssp585,
            oxy_ssp585,
            pH_ssp585,
            si_ssp585,
            sst_ssp585,
            zoo_ssp585)
names(ssp585) <- variables

##### ssp245 #####
# create merged rasters by decade
ssp245_2020 <- list()
ssp245_2030 <- list()
ssp245_2040 <- list()
ssp245_2050 <- list()
ssp245_2060 <- list()
ssp245_2070 <- list()
ssp245_2080 <- list()
ssp245_2090 <- list()

for (i in 1:6) {
 ssp245_2020[[i]] <- ssp245[[i]][[1]]
 ssp245_2030[[i]] <- ssp245[[i]][[2]]
 ssp245_2040[[i]] <- ssp245[[i]][[3]]
 ssp245_2050[[i]] <- ssp245[[i]][[4]]
 ssp245_2060[[i]] <- ssp245[[i]][[5]]
 ssp245_2070[[i]] <- ssp245[[i]][[6]]
 ssp245_2080[[i]] <- ssp245[[i]][[7]]
 ssp245_2090[[i]] <- ssp245[[i]][[8]]
}

ssp245_2020 <- brick(ssp245_2020)
ssp245_2030 <- brick(ssp245_2030)
ssp245_2040 <- brick(ssp245_2040)
ssp245_2050 <- brick(ssp245_2050)
ssp245_2060 <- brick(ssp245_2060)
ssp245_2070 <- brick(ssp245_2070)
ssp245_2080 <- brick(ssp245_2080)
ssp245_2090 <- brick(ssp245_2090)

# calculate mean for each decade
ssp245_2020 <- calc(ssp245_2020, fun = mean, na.rm = T)
ssp245_2030 <- calc(ssp245_2030, fun = mean, na.rm = T)
ssp245_2040 <- calc(ssp245_2040, fun = mean, na.rm = T)
ssp245_2050 <- calc(ssp245_2050, fun = mean, na.rm = T)
ssp245_2060 <- calc(ssp245_2060, fun = mean, na.rm = T)
ssp245_2070 <- calc(ssp245_2070, fun = mean, na.rm = T)
ssp245_2080 <- calc(ssp245_2080, fun = mean, na.rm = T)
ssp245_2090 <- calc(ssp245_2090, fun = mean, na.rm = T)

ssp245_raster <- brick(ssp245_2020,
                       ssp245_2030,
                       ssp245_2040,
                       ssp245_2050,
                       ssp245_2060,
                       ssp245_2070,
                       ssp245_2080,
                       ssp245_2090)

##### ssp370 #####
# create merged rasters by decade
ssp370_2020 <- list()
ssp370_2030 <- list()
ssp370_2040 <- list()
ssp370_2050 <- list()
ssp370_2060 <- list()
ssp370_2070 <- list()
ssp370_2080 <- list()
ssp370_2090 <- list()

for (i in 1:6) {
  ssp370_2020[[i]] <- ssp370[[i]][[1]]
  ssp370_2030[[i]] <- ssp370[[i]][[2]]
  ssp370_2040[[i]] <- ssp370[[i]][[3]]
  ssp370_2050[[i]] <- ssp370[[i]][[4]]
  ssp370_2060[[i]] <- ssp370[[i]][[5]]
  ssp370_2070[[i]] <- ssp370[[i]][[6]]
  ssp370_2080[[i]] <- ssp370[[i]][[7]]
  ssp370_2090[[i]] <- ssp370[[i]][[8]]
}

ssp370_2020 <- brick(ssp370_2020)
ssp370_2030 <- brick(ssp370_2030)
ssp370_2040 <- brick(ssp370_2040)
ssp370_2050 <- brick(ssp370_2050)
ssp370_2060 <- brick(ssp370_2060)
ssp370_2070 <- brick(ssp370_2070)
ssp370_2080 <- brick(ssp370_2080)
ssp370_2090 <- brick(ssp370_2090)

# calculate mean for each decade
ssp370_2020 <- calc(ssp370_2020, fun = mean, na.rm = T)
ssp370_2030 <- calc(ssp370_2030, fun = mean, na.rm = T)
ssp370_2040 <- calc(ssp370_2040, fun = mean, na.rm = T)
ssp370_2050 <- calc(ssp370_2050, fun = mean, na.rm = T)
ssp370_2060 <- calc(ssp370_2060, fun = mean, na.rm = T)
ssp370_2070 <- calc(ssp370_2070, fun = mean, na.rm = T)
ssp370_2080 <- calc(ssp370_2080, fun = mean, na.rm = T)
ssp370_2090 <- calc(ssp370_2090, fun = mean, na.rm = T)

ssp370_raster <- brick(ssp370_2020,
                       ssp370_2030,
                       ssp370_2040,
                       ssp370_2050,
                       ssp370_2060,
                       ssp370_2070,
                       ssp370_2080,
                       ssp370_2090)

##### ssp585 #####
# create merged rasters by decade
ssp585_2020 <- list()
ssp585_2030 <- list()
ssp585_2040 <- list()
ssp585_2050 <- list()
ssp585_2060 <- list()
ssp585_2070 <- list()
ssp585_2080 <- list()
ssp585_2090 <- list()

for (i in 1:6) {
  ssp585_2020[[i]] <- ssp585[[i]][[1]]
  ssp585_2030[[i]] <- ssp585[[i]][[2]]
  ssp585_2040[[i]] <- ssp585[[i]][[3]]
  ssp585_2050[[i]] <- ssp585[[i]][[4]]
  ssp585_2060[[i]] <- ssp585[[i]][[5]]
  ssp585_2070[[i]] <- ssp585[[i]][[6]]
  ssp585_2080[[i]] <- ssp585[[i]][[7]]
  ssp585_2090[[i]] <- ssp585[[i]][[8]]
}

ssp585_2020 <- brick(ssp585_2020)
ssp585_2030 <- brick(ssp585_2030)
ssp585_2040 <- brick(ssp585_2040)
ssp585_2050 <- brick(ssp585_2050)
ssp585_2060 <- brick(ssp585_2060)
ssp585_2070 <- brick(ssp585_2070)
ssp585_2080 <- brick(ssp585_2080)
ssp585_2090 <- brick(ssp585_2090)

# calculate mean for each decade
ssp585_2020 <- calc(ssp585_2020, fun = mean, na.rm = T)
ssp585_2030 <- calc(ssp585_2030, fun = mean, na.rm = T)
ssp585_2040 <- calc(ssp585_2040, fun = mean, na.rm = T)
ssp585_2050 <- calc(ssp585_2050, fun = mean, na.rm = T)
ssp585_2060 <- calc(ssp585_2060, fun = mean, na.rm = T)
ssp585_2070 <- calc(ssp585_2070, fun = mean, na.rm = T)
ssp585_2080 <- calc(ssp585_2080, fun = mean, na.rm = T)
ssp585_2090 <- calc(ssp585_2090, fun = mean, na.rm = T)

ssp585_raster <- brick(ssp585_2020,
                       ssp585_2030,
                       ssp585_2040,
                       ssp585_2050,
                       ssp585_2060,
                       ssp585_2070,
                       ssp585_2080,
                       ssp585_2090)

plot(ssp245_raster)
plot(ssp370_raster)
plot(ssp585_raster)

##### no pH #####
ssp245_nopH <- c(chl_ssp245,
                oxy_ssp245,
                si_ssp245,
                sst_ssp245,
                zoo_ssp245)
names(ssp245_nopH) <- variables[-3]

ssp370_nopH <- c(chl_ssp370,
                 oxy_ssp370,
                 si_ssp370,
                 sst_ssp370,
                 zoo_ssp370)
names(ssp370_nopH) <- variables[-3]

ssp585_nopH <- c(chl_ssp585,
                 oxy_ssp585,
                 si_ssp585,
                 sst_ssp585,
                 zoo_ssp585)
names(ssp585_nopH) <- variables[-3]

##### ssp245 #####
ssp245_2020 <- list()
ssp245_2030 <- list()
ssp245_2040 <- list()
ssp245_2050 <- list()
ssp245_2060 <- list()
ssp245_2070 <- list()
ssp245_2080 <- list()
ssp245_2090 <- list()

for (i in 1:5) {
  ssp245_2020[[i]] <- ssp245_nopH[[i]][[1]]
  ssp245_2030[[i]] <- ssp245_nopH[[i]][[2]]
  ssp245_2040[[i]] <- ssp245_nopH[[i]][[3]]
  ssp245_2050[[i]] <- ssp245_nopH[[i]][[4]]
  ssp245_2060[[i]] <- ssp245_nopH[[i]][[5]]
  ssp245_2070[[i]] <- ssp245_nopH[[i]][[6]]
  ssp245_2080[[i]] <- ssp245_nopH[[i]][[7]]
  ssp245_2090[[i]] <- ssp245_nopH[[i]][[8]]
}

ssp245_2020 <- brick(ssp245_2020)
ssp245_2030 <- brick(ssp245_2030)
ssp245_2040 <- brick(ssp245_2040)
ssp245_2050 <- brick(ssp245_2050)
ssp245_2060 <- brick(ssp245_2060)
ssp245_2070 <- brick(ssp245_2070)
ssp245_2080 <- brick(ssp245_2080)
ssp245_2090 <- brick(ssp245_2090)

# calculate mean for each decade
ssp245_2020 <- calc(ssp245_2020, fun = mean, na.rm = T)
ssp245_2030 <- calc(ssp245_2030, fun = mean, na.rm = T)
ssp245_2040 <- calc(ssp245_2040, fun = mean, na.rm = T)
ssp245_2050 <- calc(ssp245_2050, fun = mean, na.rm = T)
ssp245_2060 <- calc(ssp245_2060, fun = mean, na.rm = T)
ssp245_2070 <- calc(ssp245_2070, fun = mean, na.rm = T)
ssp245_2080 <- calc(ssp245_2080, fun = mean, na.rm = T)
ssp245_2090 <- calc(ssp245_2090, fun = mean, na.rm = T)

ssp245_nopH_raster <- brick(ssp245_2020,
                            ssp245_2030,
                            ssp245_2040,
                            ssp245_2050,
                            ssp245_2060,
                            ssp245_2070,
                            ssp245_2080,
                            ssp245_2090)

##### ssp370 #####
ssp370_2020 <- list()
ssp370_2030 <- list()
ssp370_2040 <- list()
ssp370_2050 <- list()
ssp370_2060 <- list()
ssp370_2070 <- list()
ssp370_2080 <- list()
ssp370_2090 <- list()

for (i in 1:5) {
  ssp370_2020[[i]] <- ssp370_nopH[[i]][[1]]
  ssp370_2030[[i]] <- ssp370_nopH[[i]][[2]]
  ssp370_2040[[i]] <- ssp370_nopH[[i]][[3]]
  ssp370_2050[[i]] <- ssp370_nopH[[i]][[4]]
  ssp370_2060[[i]] <- ssp370_nopH[[i]][[5]]
  ssp370_2070[[i]] <- ssp370_nopH[[i]][[6]]
  ssp370_2080[[i]] <- ssp370_nopH[[i]][[7]]
  ssp370_2090[[i]] <- ssp370_nopH[[i]][[8]]
}

ssp370_2020 <- brick(ssp370_2020)
ssp370_2030 <- brick(ssp370_2030)
ssp370_2040 <- brick(ssp370_2040)
ssp370_2050 <- brick(ssp370_2050)
ssp370_2060 <- brick(ssp370_2060)
ssp370_2070 <- brick(ssp370_2070)
ssp370_2080 <- brick(ssp370_2080)
ssp370_2090 <- brick(ssp370_2090)

# calculate mean for each decade
ssp370_2020 <- calc(ssp370_2020, fun = mean, na.rm = T)
ssp370_2030 <- calc(ssp370_2030, fun = mean, na.rm = T)
ssp370_2040 <- calc(ssp370_2040, fun = mean, na.rm = T)
ssp370_2050 <- calc(ssp370_2050, fun = mean, na.rm = T)
ssp370_2060 <- calc(ssp370_2060, fun = mean, na.rm = T)
ssp370_2070 <- calc(ssp370_2070, fun = mean, na.rm = T)
ssp370_2080 <- calc(ssp370_2080, fun = mean, na.rm = T)
ssp370_2090 <- calc(ssp370_2090, fun = mean, na.rm = T)

ssp370_nopH_raster <- brick(ssp370_2020,
                            ssp370_2030,
                            ssp370_2040,
                            ssp370_2050,
                            ssp370_2060,
                            ssp370_2070,
                            ssp370_2080,
                            ssp370_2090)


##### ssp585 #####
ssp585_2020 <- list()
ssp585_2030 <- list()
ssp585_2040 <- list()
ssp585_2050 <- list()
ssp585_2060 <- list()
ssp585_2070 <- list()
ssp585_2080 <- list()
ssp585_2090 <- list()

for (i in 1:5) {
  ssp585_2020[[i]] <- ssp585_nopH[[i]][[1]]
  ssp585_2030[[i]] <- ssp585_nopH[[i]][[2]]
  ssp585_2040[[i]] <- ssp585_nopH[[i]][[3]]
  ssp585_2050[[i]] <- ssp585_nopH[[i]][[4]]
  ssp585_2060[[i]] <- ssp585_nopH[[i]][[5]]
  ssp585_2070[[i]] <- ssp585_nopH[[i]][[6]]
  ssp585_2080[[i]] <- ssp585_nopH[[i]][[7]]
  ssp585_2090[[i]] <- ssp585_nopH[[i]][[8]]
}

ssp585_2020 <- brick(ssp585_2020)
ssp585_2030 <- brick(ssp585_2030)
ssp585_2040 <- brick(ssp585_2040)
ssp585_2050 <- brick(ssp585_2050)
ssp585_2060 <- brick(ssp585_2060)
ssp585_2070 <- brick(ssp585_2070)
ssp585_2080 <- brick(ssp585_2080)
ssp585_2090 <- brick(ssp585_2090)

# calculate mean for each decade
ssp585_2020 <- calc(ssp585_2020, fun = mean, na.rm = T)
ssp585_2030 <- calc(ssp585_2030, fun = mean, na.rm = T)
ssp585_2040 <- calc(ssp585_2040, fun = mean, na.rm = T)
ssp585_2050 <- calc(ssp585_2050, fun = mean, na.rm = T)
ssp585_2060 <- calc(ssp585_2060, fun = mean, na.rm = T)
ssp585_2070 <- calc(ssp585_2070, fun = mean, na.rm = T)
ssp585_2080 <- calc(ssp585_2080, fun = mean, na.rm = T)
ssp585_2090 <- calc(ssp585_2090, fun = mean, na.rm = T)

ssp585_nopH_raster <- brick(ssp585_2020,
                            ssp585_2030,
                            ssp585_2040,
                            ssp585_2050,
                            ssp585_2060,
                            ssp585_2070,
                            ssp585_2080,
                            ssp585_2090)

# clean up
rm(list=ls(pattern="ssp245_20"))
rm(list=ls(pattern="ssp370_20"))
rm(list=ls(pattern="ssp585_20"))


##### Decade of Novel (HD > 0.5) #####
##### ssp245 ######

master_HD <- list(chl_ssp245_df, oxy_ssp245_df,  pH_ssp245_df,
                  si_ssp245_df, sst_ssp245_df, zoo_ssp245_df)

mean_HD <- Reduce("+", master_HD) / length(master_HD)
mean_HD$x <- rep(1:360, 180)
mean_HD$y <- rev(rep(-89.5:89.5, each=360))
mean_HD$cell_id <- 1:64800
mean_HD$var <- "mean"

for (i in 1:6) {
  master_HD[[i]]$x <- rep(1:360, 180)
  master_HD[[i]]$y <- rev(rep(-89.5:89.5, each=360))
  master_HD[[i]]$cell_id <- 1:64800
  master_HD[[i]]$var <- variables[i]
}

master_HD[[7]] <- mean_HD

allHD_df <- rbind(master_HD[[1]], master_HD[[2]], master_HD[[3]], 
                  master_HD[[4]], master_HD[[5]], master_HD[[6]])

decade_order <- c("2020","2030","2040","2050","2060","2070","2080","2090")

names(allHD_df)[1:8] <- c("2020","2030","2040","2050","2060","2070","2080","2090")

allHD_df <- tidyr::gather(allHD_df, '2020','2030','2040','2050','2060','2070','2080','2090',
                          key = "decade", value = "HD.score")

library(plyr)
mean_df <- plyr::ddply(allHD_df, .(cell_id, decade), summarize, 
                       mean = mean(HD.score))

decade_new <- unique(subset(mean_df, mean >= 0.5))
decade_new$decade <- as.numeric(decade_new$decade)
decade_new <- decade_new[order(decade_new$cell_id, abs(decade_new$decade)),]
decade_new <- decade_new[!duplicated(decade_new$cell_id), ]

library(dplyr)
decade_new_HD <- master_HD[[7]] %>% left_join(decade_new)
decade_new_HD <- decade_new_HD[,c(9:10,13)]

write.csv(decade_new_HD, "ssp245-decade_new.csv")

# turn mean_HD into a raster
new_spg <- decade_new_HD
coordinates(new_spg) <- ~x+y
gridded(new_spg) <- TRUE

new_layers <- list()

for (i in 1:ncol(new_spg)) {
  new_layers[[i]] <- raster(new_spg[,i])
}

noveldecade_raster <- brick(new_layers)
plot(noveldecade_raster)

noveldecade_ssp245 <- noveldecade_raster

rm(new_spg, new_layers, decade_new, decade_new_HD)

# time to new for each variable #####
new_chl <- allHD_df %>% filter(var == 'Chlorophyll')
new_chl <- unique(subset(new_chl, HD.score >= 0.5))
new_chl$decade <- as.numeric(new_chl$decade) 
new_chl <- new_chl[order(new_chl$cell_id, abs(new_chl$decade)),] 
new_chl <- new_chl[!duplicated(new_chl$cell_id), ]

decade_new_chl <- mean_HD %>% left_join(new_chl, by = 'cell_id')
decade_new_chl <- decade_new_chl[,c(9,10,16)]
names(decade_new_chl) <- c("x","y","decade.chl")

new_oxy <- allHD_df %>% filter(var == 'Oxygen')
new_oxy <- unique(subset(new_oxy, HD.score >= 0.5))
new_oxy$decade <- as.numeric(new_oxy$decade) 
new_oxy <- new_oxy[order(new_oxy$cell_id, abs(new_oxy$decade)),] 
new_oxy <- new_oxy[!duplicated(new_oxy$cell_id), ]

decade_new_oxy <- mean_HD %>% left_join(new_oxy, by = 'cell_id')
decade_new_oxy <- decade_new_oxy[,c(9,10,16)]
names(decade_new_oxy) <- c("x","y","decade.oxy")

new_pH <- allHD_df %>% filter(var == 'pH')
new_pH <- unique(subset(new_pH, HD.score >= 0.5))
new_pH$decade <- as.numeric(new_pH$decade) 
new_pH <- new_pH[order(new_pH$cell_id, abs(new_pH$decade)),] 
new_pH <- new_pH[!duplicated(new_pH$cell_id), ]

decade_new_pH <- mean_HD %>% left_join(new_pH, by = 'cell_id')
decade_new_pH <- decade_new_pH[,c(9,10,16)]
names(decade_new_pH) <- c("x","y","decade.pH")

new_sst <- allHD_df %>% filter(var == 'SST')
new_sst <- unique(subset(new_sst, HD.score >= 0.5))
new_sst$decade <- as.numeric(new_sst$decade) 
new_sst <- new_sst[order(new_sst$cell_id, abs(new_sst$decade)),] 
new_sst <- new_sst[!duplicated(new_sst$cell_id), ]

decade_new_sst <- mean_HD %>% left_join(new_sst, by = 'cell_id')
decade_new_sst <- decade_new_sst[,c(9,10,16)]
names(decade_new_sst) <- c("x","y","decade.sst")

new_si <- allHD_df %>% filter(var == 'Silica')
new_si <- unique(subset(new_si, HD.score >= 0.5))
new_si$decade <- as.numeric(new_si$decade) 
new_si <- new_si[order(new_si$cell_id, abs(new_si$decade)),] 
new_si <- new_si[!duplicated(new_si$cell_id), ]

decade_new_si <- mean_HD %>% left_join(new_si, by = 'cell_id')
decade_new_si <- decade_new_si[,c(9,10,16)]
names(decade_new_si) <- c("x","y","decade.si")

new_zoo <- allHD_df %>% filter(var == 'Zooplankton')
new_zoo <- unique(subset(new_zoo, HD.score >= 0.5))
new_zoo$decade <- as.numeric(new_zoo$decade) 
new_zoo <- new_zoo[order(new_zoo$cell_id, abs(new_zoo$decade)),] 
new_zoo <- new_zoo[!duplicated(new_zoo$cell_id), ]

decade_new_zoo <- mean_HD %>% left_join(new_zoo, by = 'cell_id')
decade_new_zoo <- decade_new_zoo[,c(9,10,16)]
names(decade_new_zoo) <- c("x","y","decade.zoo")

novel_df <- left_join(decade_new_chl, decade_new_oxy)
novel_df <- left_join(novel_df, decade_new_pH)
novel_df <- left_join(novel_df, decade_new_sst)
novel_df <- left_join(novel_df, decade_new_si)
novel_df <- left_join(novel_df, decade_new_zoo)
novel_df$decade.novel <- NA
novel_df$decade.novel.nopH <- NA

for (i in 1:nrow(novel_df)) {
  novel_df[i,9]  <- min(novel_df[i,3:8], na.rm = TRUE)
  novel_df[i,10] <- min(novel_df[i,c(3,4,6:8)], na.rm = TRUE)
}

# quickly, lets ID ocean/land cells
novel_df$cell_type <- ifelse(is.na(si_ssp585_df[,1]), "land", "ocean")

novel_df[mapply(is.infinite, novel_df)] <- NA

# set column types
col_names <- colnames(novel_df[3:10])
novel_df[col_names] <- lapply(novel_df[col_names], factor)

write.csv(novel_df, "ssp245-novel-vars.csv")

rm(decade_new_chl, decade_new_oxy, decade_new_si, decade_new_sst, decade_new_zoo)

novel_ssp245 <- novel_df

##### ssp370 ######

master_HD <- list(chl_ssp370_df, oxy_ssp370_df,  pH_ssp370_df,
                   si_ssp370_df, sst_ssp370_df, zoo_ssp370_df)

mean_HD <- Reduce("+", master_HD) / length(master_HD)
mean_HD$x <- rep(1:360, 180)
mean_HD$y <- rev(rep(-89.5:89.5, each=360))
mean_HD$cell_id <- 1:64800
mean_HD$var <- "mean"

for (i in 1:6) {
  master_HD[[i]]$x <- rep(1:360, 180)
  master_HD[[i]]$y <- rev(rep(-89.5:89.5, each=360))
  master_HD[[i]]$cell_id <- 1:64800
  master_HD[[i]]$var <- variables[i]
}

master_HD[[7]] <- mean_HD

allHD_df <- rbind(master_HD[[1]], master_HD[[2]], master_HD[[3]], 
                  master_HD[[4]], master_HD[[5]], master_HD[[6]])

decade_order <- c("2020","2030","2040","2050","2060","2070","2080","2090")

names(allHD_df)[1:8] <- c("2020","2030","2040","2050","2060","2070","2080","2090")

allHD_df <- tidyr::gather(allHD_df, '2020','2030','2040','2050','2060','2070','2080','2090',
                          key = "decade", value = "HD.score")

library(plyr)
mean_df <- plyr::ddply(allHD_df, .(cell_id, decade), summarize, 
                       mean = mean(HD.score))

decade_new <- unique(subset(mean_df, mean >= 0.5))
decade_new$decade <- as.numeric(decade_new$decade)
decade_new <- decade_new[order(decade_new$cell_id, abs(decade_new$decade)),]
decade_new <- decade_new[!duplicated(decade_new$cell_id), ]

decade_new_HD <- master_HD[[7]] %>% left_join(decade_new)
decade_new_HD <- decade_new_HD[,c(9:10,13)]

write.csv(decade_new_HD, "ssp370-decade_new.csv")

# turn mean_HD into a raster
new_spg <- decade_new_HD
coordinates(new_spg) <- ~x+y
gridded(new_spg) <- TRUE

new_layers <- list()

for (i in 1:ncol(new_spg)) {
  new_layers[[i]] <- raster(new_spg[,i])
}

noveldecade_raster <- brick(new_layers)
plot(noveldecade_raster)

noveldecade_ssp370 <- noveldecade_raster

rm(new_spg, new_layers, decade_new, decade_new_HD)

# time to new for each variable #####
new_chl <- allHD_df %>% filter(var == 'Chlorophyll')
new_chl <- unique(subset(new_chl, HD.score >= 0.5))
new_chl$decade <- as.numeric(new_chl$decade) 
new_chl <- new_chl[order(new_chl$cell_id, abs(new_chl$decade)),] 
new_chl <- new_chl[!duplicated(new_chl$cell_id), ]

decade_new_chl <- mean_HD %>% left_join(new_chl, by = 'cell_id')
decade_new_chl <- decade_new_chl[,c(9,10,16)]
names(decade_new_chl) <- c("x","y","decade.chl")

new_oxy <- allHD_df %>% filter(var == 'Oxygen')
new_oxy <- unique(subset(new_oxy, HD.score >= 0.5))
new_oxy$decade <- as.numeric(new_oxy$decade) 
new_oxy <- new_oxy[order(new_oxy$cell_id, abs(new_oxy$decade)),] 
new_oxy <- new_oxy[!duplicated(new_oxy$cell_id), ]

decade_new_oxy <- mean_HD %>% left_join(new_oxy, by = 'cell_id')
decade_new_oxy <- decade_new_oxy[,c(9,10,16)]
names(decade_new_oxy) <- c("x","y","decade.oxy")

new_pH <- allHD_df %>% filter(var == 'pH')
new_pH <- unique(subset(new_pH, HD.score >= 0.5))
new_pH$decade <- as.numeric(new_pH$decade) 
new_pH <- new_pH[order(new_pH$cell_id, abs(new_pH$decade)),] 
new_pH <- new_pH[!duplicated(new_pH$cell_id), ]

decade_new_pH <- mean_HD %>% left_join(new_pH, by = 'cell_id')
decade_new_pH <- decade_new_pH[,c(9,10,16)]
names(decade_new_pH) <- c("x","y","decade.pH")

new_sst <- allHD_df %>% filter(var == 'SST')
new_sst <- unique(subset(new_sst, HD.score >= 0.5))
new_sst$decade <- as.numeric(new_sst$decade) 
new_sst <- new_sst[order(new_sst$cell_id, abs(new_sst$decade)),] 
new_sst <- new_sst[!duplicated(new_sst$cell_id), ]

decade_new_sst <- mean_HD %>% left_join(new_sst, by = 'cell_id')
decade_new_sst <- decade_new_sst[,c(9,10,16)]
names(decade_new_sst) <- c("x","y","decade.sst")

new_si <- allHD_df %>% filter(var == 'Silica')
new_si <- unique(subset(new_si, HD.score >= 0.5))
new_si$decade <- as.numeric(new_si$decade) 
new_si <- new_si[order(new_si$cell_id, abs(new_si$decade)),] 
new_si <- new_si[!duplicated(new_si$cell_id), ]

decade_new_si <- mean_HD %>% left_join(new_si, by = 'cell_id')
decade_new_si <- decade_new_si[,c(9,10,16)]
names(decade_new_si) <- c("x","y","decade.si")

new_zoo <- allHD_df %>% filter(var == 'Zooplankton')
new_zoo <- unique(subset(new_zoo, HD.score >= 0.5))
new_zoo$decade <- as.numeric(new_zoo$decade) 
new_zoo <- new_zoo[order(new_zoo$cell_id, abs(new_zoo$decade)),] 
new_zoo <- new_zoo[!duplicated(new_zoo$cell_id), ]

decade_new_zoo <- mean_HD %>% left_join(new_zoo, by = 'cell_id')
decade_new_zoo <- decade_new_zoo[,c(9,10,16)]
names(decade_new_zoo) <- c("x","y","decade.zoo")

novel_df <- left_join(decade_new_chl, decade_new_oxy)
novel_df <- left_join(novel_df, decade_new_pH)
novel_df <- left_join(novel_df, decade_new_sst)
novel_df <- left_join(novel_df, decade_new_si)
novel_df <- left_join(novel_df, decade_new_zoo)
novel_df$decade.novel <- NA
novel_df$decade.novel.nopH <- NA

for (i in 1:nrow(novel_df)) {
  novel_df[i,9]  <- min(novel_df[i,3:8], na.rm = TRUE)
  novel_df[i,10] <- min(novel_df[i,c(3,4,6:8)], na.rm = TRUE)
}

# quickly, lets ID ocean/land cells
novel_df$cell_type <- ifelse(is.na(si_ssp585_df[,1]), "land", "ocean")

novel_df[mapply(is.infinite, novel_df)] <- NA

# set column types
col_names <- colnames(novel_df[3:10])
novel_df[col_names] <- lapply(novel_df[col_names], factor)

write.csv(novel_df, "ssp370-novel-vars.csv")

rm(decade_new_chl, decade_new_oxy, decade_new_si, decade_new_sst, decade_new_zoo)

novel_ssp370 <- novel_df



##### ssp585 ######
master_HD <- list(chl_ssp585_df, oxy_ssp585_df,  pH_ssp585_df,
                   si_ssp585_df, sst_ssp585_df, zoo_ssp585_df)

mean_HD <- Reduce("+", master_HD) / length(master_HD)
mean_HD$x <- rep(1:360, 180)
mean_HD$y <- rev(rep(-89.5:89.5, each=360))
mean_HD$cell_id <- 1:64800
mean_HD$var <- "mean"

for (i in 1:6) {
  master_HD[[i]]$x <- rep(1:360, 180)
  master_HD[[i]]$y <- rev(rep(-89.5:89.5, each=360))
  master_HD[[i]]$cell_id <- 1:64800
  master_HD[[i]]$var <- variables[i]
}

master_HD[[7]] <- mean_HD

allHD_df <- rbind(master_HD[[1]], master_HD[[2]], master_HD[[3]], 
                  master_HD[[4]], master_HD[[5]], master_HD[[6]])

decade_order <- c("2020","2030","2040","2050","2060","2070","2080","2090")

names(allHD_df)[1:8] <- c("2020","2030","2040","2050","2060","2070","2080","2090")

allHD_df <- tidyr::gather(allHD_df, '2020','2030','2040','2050','2060','2070','2080','2090',
                          key = "decade", value = "HD.score")

library(plyr)
mean_df <- plyr::ddply(allHD_df, .(cell_id, decade), summarize, 
                       mean = mean(HD.score))

decade_new <- unique(subset(mean_df, mean >= 0.5))
decade_new$decade <- as.numeric(decade_new$decade)
decade_new <- decade_new[order(decade_new$cell_id, abs(decade_new$decade)),]
decade_new <- decade_new[!duplicated(decade_new$cell_id), ]

decade_new_HD <- master_HD[[7]] %>% left_join(decade_new)
decade_new_HD <- decade_new_HD[,c(9:10,13)]

write.csv(decade_new_HD, "ssp585-decade_new.csv")

# turn mean_HD into a raster
new_spg <- decade_new_HD
coordinates(new_spg) <- ~x+y
gridded(new_spg) <- TRUE

new_layers <- list()

for (i in 1:ncol(new_spg)) {
  new_layers[[i]] <- raster(new_spg[,i])
}

noveldecade_raster <- brick(new_layers)
plot(noveldecade_raster)

noveldecade_ssp585 <- noveldecade_raster

rm(new_spg, new_layers, decade_new, decade_new_HD)

# time to new for each variable #####
new_chl <- allHD_df %>% filter(var == 'Chlorophyll')
new_chl <- unique(subset(new_chl, HD.score >= 0.5))
new_chl$decade <- as.numeric(new_chl$decade) 
new_chl <- new_chl[order(new_chl$cell_id, abs(new_chl$decade)),] 
new_chl <- new_chl[!duplicated(new_chl$cell_id), ]

decade_new_chl <- mean_HD %>% left_join(new_chl, by = 'cell_id')
decade_new_chl <- decade_new_chl[,c(9,10,16)]
names(decade_new_chl) <- c("x","y","decade.chl")

new_oxy <- allHD_df %>% filter(var == 'Oxygen')
new_oxy <- unique(subset(new_oxy, HD.score >= 0.5))
new_oxy$decade <- as.numeric(new_oxy$decade) 
new_oxy <- new_oxy[order(new_oxy$cell_id, abs(new_oxy$decade)),] 
new_oxy <- new_oxy[!duplicated(new_oxy$cell_id), ]

decade_new_oxy <- mean_HD %>% left_join(new_oxy, by = 'cell_id')
decade_new_oxy <- decade_new_oxy[,c(9,10,16)]
names(decade_new_oxy) <- c("x","y","decade.oxy")

new_pH <- allHD_df %>% filter(var == 'pH')
new_pH <- unique(subset(new_pH, HD.score >= 0.5))
new_pH$decade <- as.numeric(new_pH$decade) 
new_pH <- new_pH[order(new_pH$cell_id, abs(new_pH$decade)),] 
new_pH <- new_pH[!duplicated(new_pH$cell_id), ]

decade_new_pH <- mean_HD %>% left_join(new_pH, by = 'cell_id')
decade_new_pH <- decade_new_pH[,c(9,10,16)]
names(decade_new_pH) <- c("x","y","decade.pH")

new_sst <- allHD_df %>% filter(var == 'SST')
new_sst <- unique(subset(new_sst, HD.score >= 0.5))
new_sst$decade <- as.numeric(new_sst$decade) 
new_sst <- new_sst[order(new_sst$cell_id, abs(new_sst$decade)),] 
new_sst <- new_sst[!duplicated(new_sst$cell_id), ]

decade_new_sst <- mean_HD %>% left_join(new_sst, by = 'cell_id')
decade_new_sst <- decade_new_sst[,c(9,10,16)]
names(decade_new_sst) <- c("x","y","decade.sst")

new_si <- allHD_df %>% filter(var == 'Silica')
new_si <- unique(subset(new_si, HD.score >= 0.5))
new_si$decade <- as.numeric(new_si$decade) 
new_si <- new_si[order(new_si$cell_id, abs(new_si$decade)),] 
new_si <- new_si[!duplicated(new_si$cell_id), ]

decade_new_si <- mean_HD %>% left_join(new_si, by = 'cell_id')
decade_new_si <- decade_new_si[,c(9,10,16)]
names(decade_new_si) <- c("x","y","decade.si")

new_zoo <- allHD_df %>% filter(var == 'Zooplankton')
new_zoo <- unique(subset(new_zoo, HD.score >= 0.5))
new_zoo$decade <- as.numeric(new_zoo$decade) 
new_zoo <- new_zoo[order(new_zoo$cell_id, abs(new_zoo$decade)),] 
new_zoo <- new_zoo[!duplicated(new_zoo$cell_id), ]

decade_new_zoo <- mean_HD %>% left_join(new_zoo, by = 'cell_id')
decade_new_zoo <- decade_new_zoo[,c(9,10,16)]
names(decade_new_zoo) <- c("x","y","decade.zoo")

novel_df <- left_join(decade_new_chl, decade_new_oxy)
novel_df <- left_join(novel_df, decade_new_pH)
novel_df <- left_join(novel_df, decade_new_sst)
novel_df <- left_join(novel_df, decade_new_si)
novel_df <- left_join(novel_df, decade_new_zoo)
novel_df$decade.novel <- NA
novel_df$decade.novel.nopH <- NA

for (i in 1:nrow(novel_df)) {
  novel_df[i,9]  <- min(novel_df[i,3:8], na.rm = TRUE)
  novel_df[i,10] <- min(novel_df[i,c(3,4,6:8)], na.rm = TRUE)
}

# quickly, lets ID ocean/land cells
novel_df$cell_type <- ifelse(is.na(si_ssp585_df[,1]), "land", "ocean")

novel_df[mapply(is.infinite, novel_df)] <- NA

# set column types
col_names <- colnames(novel_df[3:10])
novel_df[col_names] <- lapply(novel_df[col_names], factor)

write.csv(novel_df, "ssp585-novel-vars.csv")

rm(decade_new_chl, decade_new_oxy, decade_new_si, decade_new_sst, decade_new_zoo)

novel_ssp585 <- novel_df

##### Step 2. Create figures #####
##### Figure 1 #####
# This is in a seperate R file because it needs a unique data set to run
##### Figure 2 #####
# Load map file
worldmap <- map("world2", fill=TRUE, plot=FALSE)
worldmapPolys <- map2SpatialPolygons(worldmap, 
                                     IDs=sapply(strsplit(worldmap$names, ":"), "[", 1L), 
                                     proj4string=CRS("+proj=longlat +datum=WGS84"))
coastline <- rmapshaper::ms_dissolve(worldmapPolys)
crs(coastline)

# Load MPA shapefiles
vlmpa_spdf <- readOGR("C:/Users/Manao/Documents/phd_stuff/dissertation/chapter_1-ocean_novelty/data/large_mpas/vlmpa.shp")

# set mapTheme
mapTheme <- rasterTheme(region=rev(grDevices::heat.colors(100)))

# SSP2-4.5 2100
plt_245 <- levelplot(ssp245_raster[[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                     main = "", xlab = "", ylab = "",
                     colorkey=list(space="bottom"),
                     auto.key = list(title = "Hellinger distance"),
                     margin = FALSE,
                     panel = function(...){
                       panel.levelplot(...)
                       panel.abline(h=0, col="grey")
                       panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                     },
                     scales = list(y=list(at=seq(-45,45,45)),
                                   x=list(at=seq(90,270,90)))
)

plt_245 <- plt_245 + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) +
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

# SSP3-7.0
plt_370 <- levelplot(ssp370_raster[[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                     main = "", xlab = "", ylab = "",
                     colorkey=list(space="bottom"),
                     auto.key = list(title = "Hellinger distance"),
                     margin = FALSE,
                     panel = function(...){
                       panel.levelplot(...)
                       panel.abline(h=0, col="grey")
                       panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                     },
                     scales = list(y=list(at=seq(-45,45,45)),
                                   x=list(at=seq(90,270,90)))
)

plt_370 <- plt_370 + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) +
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

# SSP5-8.5
plt_585 <- levelplot(ssp585_raster[[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                     main = "", xlab = "", ylab = "",
                     colorkey=list(space="bottom"),
                     auto.key = list(title = "Hellinger distance"),
                     margin = FALSE,
                     panel = function(...){
                       panel.levelplot(...)
                       panel.abline(h=0, col="grey")
                       panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                     },
                     scales = list(y=list(at=seq(-45,45,45)),
                                   x=list(at=seq(90,270,90)))
)

plt_585 <- plt_585 + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) +
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

# combine two that we need for fig 2
fig2.a <- levelplot(ssp585[[1]][[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                    main = "",
                    xlab = "", ylab = "",
                    colorkey = FALSE,
                    auto.key = list(title="Hellinger distance"),
                    margin = FALSE,
                    panel = function(...){
                      panel.levelplot(...)
                      panel.abline(h=0, col="grey")
                      panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                    },
                    scales = list(y=list(at=seq(-45,45,45)),
                                  x=list(at=seq(90,270,90))
                    )
) +
  latticeExtra::layer(sp.lines(coastline, fill="lightgray")) 


fig2.b <- levelplot(ssp585[[2]][[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                    main = "",
                    xlab = "", ylab = "",
                    colorkey = FALSE,
                    auto.key = list(title="Hellinger distance"),
                    margin = FALSE,
                    panel = function(...){
                      panel.levelplot(...)
                      panel.abline(h=0, col="grey")
                      panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                    },
                    scales = list(y=list(at=seq(-45,45,45)),
                                  x=list(at=seq(90,270,90))
                    )
) +
  latticeExtra::layer(sp.lines(coastline, fill="lightgray")) 



fig2.c <- levelplot(ssp585[[3]][[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                    main = "",
                    xlab = "", ylab = "",
                    colorkey = FALSE,
                    auto.key = list(title="Hellinger distance"),
                    margin = FALSE,
                    panel = function(...){
                      panel.levelplot(...)
                      panel.abline(h=0, col="grey")
                      panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                    },
                    scales = list(y=list(at=seq(-45,45,45)),
                                  x=list(at=seq(90,270,90))
                    )
) +
  latticeExtra::layer(sp.lines(coastline, fill="lightgray")) 


fig2.d <- levelplot(ssp585[[4]][[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                    main = "",
                    xlab = "", ylab = "",
                    colorkey = FALSE,
                    auto.key = list(title="Hellinger distance"),
                    margin = FALSE,
                    panel = function(...){
                      panel.levelplot(...)
                      panel.abline(h=0, col="grey")
                      panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                    },
                    scales = list(y=list(at=seq(-45,45,45)),
                                  x=list(at=seq(90,270,90))
                    )
) +
  latticeExtra::layer(sp.lines(coastline, fill="lightgray"))



fig2.e <- levelplot(ssp585[[5]][[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                    main = "",
                    xlab = "", ylab = "",
                    colorkey = FALSE,
                    auto.key = list(title="Hellinger distance"),
                    margin = FALSE,
                    panel = function(...){
                      panel.levelplot(...)
                      panel.abline(h=0, col="grey")
                      panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                    },
                    scales = list(y=list(at=seq(-45,45,45)),
                                  x=list(at=seq(90,270,90))
                    )
) +
  latticeExtra::layer(sp.lines(coastline, fill="lightgray"))



fig2.f <- levelplot(ssp585[[6]][[8]], par.settings=mapTheme, at = seq(0,1,by=.01),
                    main = "",
                    xlab = "", ylab = "",
                    colorkey = FALSE,
                    auto.key = list(title="Hellinger distance"),
                    margin = FALSE,
                    panel = function(...){
                      panel.levelplot(...)
                      panel.abline(h=0, col="grey")
                      panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                    },
                    scales = list(y=list(at=seq(-45,45,45)),
                                  x=list(at=seq(90,270,90))
                    )
) +
  latticeExtra::layer(sp.lines(coastline, fill="lightgray"))


fig2 <- c(fig2.a, fig2.b,
          fig2.c, fig2.d,
          fig2.e, fig2.f,
          layout = c(2, 3), 
          merge.legends = F)

library(gridExtra)
lay <- rbind(c(1,1,1,2,2,2),
             c(1,1,1,2,2,2),
             c(3,3,3,4,4,4),
             c(3,3,3,4,4,4))

grid.arrange(plt_245, plt_370,
             plt_585, fig2, 
             layout_matrix = lay)



##### MPA analysis #####
###### extract HD values for all VLMPAs #####
# create lists by ssp+decade
raster_2020 <- list(chl_ssp245[[1]], 
                    oxy_ssp245[[1]], 
                     pH_ssp245[[1]], 
                     si_ssp245[[1]], 
                    sst_ssp245[[1]], 
                    zoo_ssp245[[1]],
                        ssp245_raster[[1]])

raster_2030 <- list(chl_ssp245[[2]], 
                    oxy_ssp245[[2]], 
                     pH_ssp245[[2]], 
                     si_ssp245[[2]], 
                    sst_ssp245[[2]], 
                    zoo_ssp245[[2]],
                 ssp245_raster[[2]])

raster_2040 <- list(chl_ssp245[[3]], 
                    oxy_ssp245[[3]], 
                     pH_ssp245[[3]], 
                     si_ssp245[[3]], 
                    sst_ssp245[[3]], 
                    zoo_ssp245[[3]],
                 ssp245_raster[[3]])

raster_2050 <- list(chl_ssp245[[4]], 
                    oxy_ssp245[[4]], 
                     pH_ssp245[[4]], 
                     si_ssp245[[4]], 
                    sst_ssp245[[4]], 
                    zoo_ssp245[[4]],
                 ssp245_raster[[4]])

raster_2060 <- list(chl_ssp245[[5]], 
                    oxy_ssp245[[5]], 
                     pH_ssp245[[5]], 
                     si_ssp245[[5]], 
                    sst_ssp245[[5]], 
                    zoo_ssp245[[5]],
                 ssp245_raster[[5]])

raster_2070 <- list(chl_ssp245[[6]], 
                    oxy_ssp245[[6]], 
                     pH_ssp245[[6]], 
                     si_ssp245[[6]], 
                    sst_ssp245[[6]], 
                    zoo_ssp245[[6]],
                 ssp245_raster[[6]])

raster_2080 <- list(chl_ssp245[[7]], 
                    oxy_ssp245[[7]], 
                     pH_ssp245[[7]], 
                     si_ssp245[[7]], 
                    sst_ssp245[[7]], 
                    zoo_ssp245[[7]],
                 ssp245_raster[[7]])

raster_2090 <- list(chl_ssp245[[8]], 
                    oxy_ssp245[[8]], 
                     pH_ssp245[[8]], 
                     si_ssp245[[8]], 
                    sst_ssp245[[8]], 
                    zoo_ssp245[[8]],
                 ssp245_raster[[8]])

# create lists for each decade
vlmpa_ssp245_2020 <- list()
vlmpa_ssp245_2030 <- list()
vlmpa_ssp245_2040 <- list()
vlmpa_ssp245_2050 <- list()
vlmpa_ssp245_2060 <- list()
vlmpa_ssp245_2070 <- list()
vlmpa_ssp245_2080 <- list()
vlmpa_ssp245_2090 <- list()


for (i in 1:7) {
  vlmpa_ssp245_2020[[i]] <- raster::extract(raster_2020[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp245_2030[[i]] <- raster::extract(raster_2030[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp245_2040[[i]] <- raster::extract(raster_2040[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp245_2050[[i]] <- raster::extract(raster_2050[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp245_2060[[i]] <- raster::extract(raster_2060[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp245_2070[[i]] <- raster::extract(raster_2070[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp245_2080[[i]] <- raster::extract(raster_2080[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp245_2090[[i]] <- raster::extract(raster_2090[[i]], vlmpa_spdf, Fun=MEAN, small=TRUE, na.rm=TRUE, sp=TRUE)
}

names(vlmpa_ssp245_2020) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp245_2030) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp245_2040) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp245_2050) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp245_2060) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp245_2070) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp245_2080) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp245_2090) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")

vlmpa_names <- as.character(vlmpa_spdf@data$NAME)

vlmpa_df_chl <- matrix(nrow=29)
vlmpa_df_chl <- vlmpa_names
vlmpa_df_chl <- as.data.frame(vlmpa_df_chl)
colnames(vlmpa_df_chl)[colnames(vlmpa_df_chl)=="vlmpa_df_chl"] <- "site"

vlmpa_df_chl$`2020` <- lapply(vlmpa_ssp245_2020[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2030` <- lapply(vlmpa_ssp245_2030[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2040` <- lapply(vlmpa_ssp245_2040[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2050` <- lapply(vlmpa_ssp245_2050[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2060` <- lapply(vlmpa_ssp245_2060[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2070` <- lapply(vlmpa_ssp245_2070[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2080` <- lapply(vlmpa_ssp245_2080[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2090` <- lapply(vlmpa_ssp245_2090[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_oxy <- matrix(nrow=29)
vlmpa_df_oxy <- vlmpa_names
vlmpa_df_oxy <- as.data.frame(vlmpa_df_oxy)
colnames(vlmpa_df_oxy)[colnames(vlmpa_df_oxy)=="vlmpa_df_oxy"] <- "site"

vlmpa_df_oxy$`2020` <- lapply(vlmpa_ssp245_2020[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2030` <- lapply(vlmpa_ssp245_2030[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2040` <- lapply(vlmpa_ssp245_2040[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2050` <- lapply(vlmpa_ssp245_2050[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2060` <- lapply(vlmpa_ssp245_2060[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2070` <- lapply(vlmpa_ssp245_2070[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2080` <- lapply(vlmpa_ssp245_2080[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2090` <- lapply(vlmpa_ssp245_2090[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_pH <- matrix(nrow=29)
vlmpa_df_pH <- vlmpa_names
vlmpa_df_pH <- as.data.frame(vlmpa_df_pH)
colnames(vlmpa_df_pH)[colnames(vlmpa_df_pH)=="vlmpa_df_pH"] <- "site"

vlmpa_df_pH$`2020` <- lapply(vlmpa_ssp245_2020[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2030` <- lapply(vlmpa_ssp245_2030[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2040` <- lapply(vlmpa_ssp245_2040[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2050` <- lapply(vlmpa_ssp245_2050[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2060` <- lapply(vlmpa_ssp245_2060[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2070` <- lapply(vlmpa_ssp245_2070[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2080` <- lapply(vlmpa_ssp245_2080[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2090` <- lapply(vlmpa_ssp245_2090[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_si <- matrix(nrow=29)
vlmpa_df_si <- vlmpa_names
vlmpa_df_si <- as.data.frame(vlmpa_df_si)
colnames(vlmpa_df_si)[colnames(vlmpa_df_si)=="vlmpa_df_si"] <- "site"

vlmpa_df_si$`2020` <- lapply(vlmpa_ssp245_2020[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2030` <- lapply(vlmpa_ssp245_2030[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2040` <- lapply(vlmpa_ssp245_2040[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2050` <- lapply(vlmpa_ssp245_2050[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2060` <- lapply(vlmpa_ssp245_2060[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2070` <- lapply(vlmpa_ssp245_2070[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2080` <- lapply(vlmpa_ssp245_2080[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2090` <- lapply(vlmpa_ssp245_2090[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_sst <- matrix(nrow=29)
vlmpa_df_sst <- vlmpa_names
vlmpa_df_sst <- as.data.frame(vlmpa_df_sst)
colnames(vlmpa_df_sst)[colnames(vlmpa_df_sst)=="vlmpa_df_sst"] <- "site"

vlmpa_df_sst$`2020` <- lapply(vlmpa_ssp245_2020[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2030` <- lapply(vlmpa_ssp245_2030[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2040` <- lapply(vlmpa_ssp245_2040[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2050` <- lapply(vlmpa_ssp245_2050[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2060` <- lapply(vlmpa_ssp245_2060[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2070` <- lapply(vlmpa_ssp245_2070[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2080` <- lapply(vlmpa_ssp245_2080[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2090` <- lapply(vlmpa_ssp245_2090[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_zoo <- matrix(nrow=29)
vlmpa_df_zoo <- vlmpa_names
vlmpa_df_zoo <- as.data.frame(vlmpa_df_zoo)
colnames(vlmpa_df_zoo)[colnames(vlmpa_df_zoo)=="vlmpa_df_zoo"] <- "site"

vlmpa_df_zoo$`2020` <- lapply(vlmpa_ssp245_2020[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2030` <- lapply(vlmpa_ssp245_2030[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2040` <- lapply(vlmpa_ssp245_2040[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2050` <- lapply(vlmpa_ssp245_2050[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2060` <- lapply(vlmpa_ssp245_2060[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2070` <- lapply(vlmpa_ssp245_2070[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2080` <- lapply(vlmpa_ssp245_2080[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2090` <- lapply(vlmpa_ssp245_2090[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_mean <- matrix(nrow=29)
vlmpa_df_mean <- vlmpa_names
vlmpa_df_mean <- as.data.frame(vlmpa_df_mean)
colnames(vlmpa_df_mean)[colnames(vlmpa_df_mean)=="vlmpa_df_mean"] <- "site"

vlmpa_df_mean$`2020` <- lapply(vlmpa_ssp245_2020[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2030` <- lapply(vlmpa_ssp245_2030[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2040` <- lapply(vlmpa_ssp245_2040[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2050` <- lapply(vlmpa_ssp245_2050[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2060` <- lapply(vlmpa_ssp245_2060[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2070` <- lapply(vlmpa_ssp245_2070[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2080` <- lapply(vlmpa_ssp245_2080[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2090` <- lapply(vlmpa_ssp245_2090[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

# now prep to make df with col for each variable and year of novelty 
decades <- c("2020", "2030", "2040", "2050", "2060", "2070", "2080", "2090")

chl <- vlmpa_df_chl %>% 
  pivot_longer(all_of(decades), names_to = "decade.chl", values_to = "HD")

chl_new <- unique(subset(chl, HD >= 0.5))
chl_new$decade.chl <- as.numeric(chl_new$decade.chl)
chl_new <- chl_new[order(chl_new$site, abs(chl_new$decade.chl)),]
chl_new <- chl_new[!duplicated(chl_new$site), ]

oxy <- vlmpa_df_oxy %>% 
  pivot_longer(all_of(decades), names_to = "decade.oxy", values_to = "HD")

oxy_new <- unique(subset(oxy, HD >= 0.5))
oxy_new$decade.oxy <- as.numeric(oxy_new$decade.oxy)
oxy_new <- oxy_new[order(oxy_new$site, abs(oxy_new$decade.oxy)),]
oxy_new <- oxy_new[!duplicated(oxy_new$site), ]

pH <- vlmpa_df_pH %>% 
  pivot_longer(all_of(decades), names_to = "decade.pH", values_to = "HD")

pH_new <- unique(subset(pH, HD >= 0.5))
pH_new$decade.pH <- as.numeric(pH_new$decade.pH)
pH_new <- pH_new[order(pH_new$site, abs(pH_new$decade.pH)),]
pH_new <- pH_new[!duplicated(pH_new$site), ]

si <- vlmpa_df_si %>% 
  pivot_longer(all_of(decades), names_to = "decade.si", values_to = "HD")

si_new <- unique(subset(si, HD >= 0.5))
si_new$decade.si <- as.numeric(si_new$decade.si)
si_new <- si_new[order(si_new$site, abs(si_new$decade.si)),]
si_new <- si_new[!duplicated(si_new$site), ]

sst <- vlmpa_df_sst %>% 
  pivot_longer(all_of(decades), names_to = "decade.sst", values_to = "HD")

sst_new <- unique(subset(sst, HD >= 0.5))
sst_new$decade.sst <- as.numeric(sst_new$decade.sst)
sst_new <- sst_new[order(sst_new$site, abs(sst_new$decade.sst)),]
sst_new <- sst_new[!duplicated(sst_new$site), ]

zoo <- vlmpa_df_zoo %>% 
  pivot_longer(all_of(decades), names_to = "decade.zoo", values_to = "HD")

zoo_new <- unique(subset(zoo, HD >= 0.5))
zoo_new$decade.zoo <- as.numeric(zoo_new$decade.zoo)
zoo_new <- zoo_new[order(zoo_new$site, abs(zoo_new$decade.zoo)),]
zoo_new <- zoo_new[!duplicated(zoo_new$site), ]

mean <- vlmpa_df_mean %>% 
  pivot_longer(all_of(decades), names_to = "decade.mean", values_to = "HD")

mean_new <- unique(subset(mean, HD >= 0.5))
mean_new$decade.mean <- as.numeric(mean_new$decade.mean)
mean_new <- mean_new[order(mean_new$site, abs(mean_new$decade.mean)),]
mean_new <- mean_new[!duplicated(mean_new$site), ]

##### ssp245 #####
##### now append to a master df #####
vlmpa_df <- as.data.frame(vlmpa_names)
colnames(vlmpa_df) <- "site"

vlmpa_df <- vlmpa_df %>%
  full_join(chl_new, by = intersect(colnames(vlmpa_df), colnames(chl_new)))
vlmpa_df <- vlmpa_df[-3]

vlmpa_df <- vlmpa_df %>%
  full_join(oxy_new, by = intersect(colnames(vlmpa_df), colnames(oxy_new)))
vlmpa_df <- vlmpa_df[-4]

vlmpa_df <- vlmpa_df %>%
  full_join(pH_new, by = intersect(colnames(vlmpa_df), colnames(pH_new)))
vlmpa_df <- vlmpa_df[-5]

vlmpa_df <- vlmpa_df %>%
  full_join(si_new, by = intersect(colnames(vlmpa_df), colnames(si_new)))
vlmpa_df <- vlmpa_df[-6]

vlmpa_df <- vlmpa_df %>%
  full_join(sst_new, by = intersect(colnames(vlmpa_df), colnames(sst_new)))
vlmpa_df <- vlmpa_df[-7]

vlmpa_df <- vlmpa_df %>%
  full_join(zoo_new, by = intersect(colnames(vlmpa_df), colnames(zoo_new)))
vlmpa_df <- vlmpa_df[-8]

vlmpa_df <- vlmpa_df %>%
  full_join(mean_new, by = intersect(colnames(vlmpa_df), colnames(mean_new)))
vlmpa_df <- vlmpa_df[-9]

vlmpa_df$novel.dims <- rowSums(!is.na(vlmpa_df[2:7]))

for (i in 1:nrow(vlmpa_df)) {
  vlmpa_df[i,10] <- min(vlmpa_df[i,2:7], na.rm=TRUE)
}

vlmpa_df$novel.dims <- factor(vlmpa_df$novel.dims)
colnames(vlmpa_df)[colnames(vlmpa_df) == "V10"] <- "novel.decade"
vlmpa_df$novel.decade <- factor(vlmpa_df$novel.decade)

vlmpa_df %>% 
  ggplot(aes(x=novel.dims)) +
  geom_histogram(bins=5, color="black", fill="light blue", stat = "count") +
  theme_classic()

vlmpa_df %>% 
  drop_na(novel.decade) %>% 
  ggplot(aes(x=novel.decade)) +
  geom_histogram(bins=5, color="black", fill="light blue", stat = "count") +
  theme_classic()

##### Write vlmpa outputs to csv's #####
write.csv(vlmpa_df, "ssp245_decade-novel-var.csv")
write.csv(as.matrix(vlmpa_df_pH), "ssp245_novel-pH.csv")
write.csv(as.matrix(vlmpa_df_chl), "ssp245_novel-chl.csv")
write.csv(as.matrix(vlmpa_df_oxy), "ssp245_novel-oxy.csv")
write.csv(as.matrix(vlmpa_df_si), "ssp245_novel-si.csv")
write.csv(as.matrix(vlmpa_df_sst), "ssp245_novel-sst.csv")
write.csv(as.matrix(vlmpa_df_zoo), "ssp245_novel-zoo.csv")
write.csv(as.matrix(vlmpa_df_mean), "ssp245_novel-mean.csv")

##### figure 3 - petal figure #####
# get the mean of each variable
vlmpa_df_chl[,c(2:9)] <- sapply(vlmpa_df_chl[, c(2:9)], as.numeric)
vlmpa_df_chl[30,2:9] <- colMeans(vlmpa_df_chl[,-c(1,10)])
vlmpa_df_chl[30,1] <- "Very large MPAs"

vlmpa_df_oxy[,c(2:9)] <- sapply(vlmpa_df_oxy[, c(2:9)], as.numeric)
vlmpa_df_oxy[30,2:9] <- colMeans(vlmpa_df_oxy[,-c(1,10)])
vlmpa_df_oxy[30,1] <- "Very large MPAs"

vlmpa_df_pH[,c(2:9)] <- sapply(vlmpa_df_pH[, c(2:9)], as.numeric)
vlmpa_df_pH[30,2:9] <- colMeans(vlmpa_df_pH[,-c(1,10)])
vlmpa_df_pH[30,1] <- "Very large MPAs"

vlmpa_df_si[,c(2:9)] <- sapply(vlmpa_df_si[, c(2:9)], as.numeric)
vlmpa_df_si[30,2:9] <- colMeans(vlmpa_df_si[,-c(1,10)])
vlmpa_df_si[30,1] <- "Very large MPAs"

vlmpa_df_sst[,c(2:9)] <- sapply(vlmpa_df_sst[, c(2:9)], as.numeric)
vlmpa_df_sst[30,2:9] <- colMeans(vlmpa_df_sst[,-c(1,10)])
vlmpa_df_sst[30,1] <- "Very large MPAs"

vlmpa_df_zoo[,c(2:9)] <- sapply(vlmpa_df_zoo[, c(2:9)], as.numeric)
vlmpa_df_zoo[30,2:9] <- colMeans(vlmpa_df_zoo[,-c(1,10)])
vlmpa_df_zoo[30,1] <- "Very large MPAs"

vlmpa_df_mean[,c(2:9)] <- sapply(vlmpa_df_mean[, c(2:9)], as.numeric)
vlmpa_df_mean[30,2:9] <- colMeans(vlmpa_df_mean[,-c(1,10)])
vlmpa_df_mean[30,1] <- "Very large MPAs"

# Need to add the var column to each df
vlmpa_df_chl$var <- "chl"
vlmpa_df_oxy$var <- "oxy"
vlmpa_df_pH$var <- "pH"
vlmpa_df_si$var <- "si"
vlmpa_df_sst$var <- "sst"
vlmpa_df_zoo$var <- "zoo"

# combine the four dfs #
petal_dat <- rbind(vlmpa_df_chl, vlmpa_df_oxy, vlmpa_df_pH, vlmpa_df_si, vlmpa_df_sst, vlmpa_df_zoo)
petal_dat <- petal_dat %>% 
  pivot_longer(c(2:9), names_to = "decade", values_to = "HD.val")
petal_dat$HD.val <- as.numeric(unlist(petal_dat$HD.val))
petal_dat <- within(petal_dat, site <- factor(site, levels = c(vlmpa_names, "Very large MPAs")))
with(petal_dat, levels(site))

vlmpa_petal <- vlmpa_names[c(9,20,15,18,
                             8,14,2,28,
                             21,1,27,4)]


vlmpa_plot <- petal_dat %>% 
  filter(decade == 2090) %>%
  filter(site %in% vlmpa_petal)

vlmpa_plot$site <- factor(vlmpa_plot$site, levels = vlmpa_petal)

figa <- vlmpa_plot %>% 
  ggplot(aes(x=var, y=HD.val, fill=var)) +
  geom_bar(width=1, stat="identity", color="black") +
  xlab("") + ylab("") +
  scale_y_continuous(limits = c(-.5, 1)) +
  scale_fill_brewer(palette = "Set2") +
  coord_polar() +
  theme_minimal() +
  theme(legend.position = "none" , axis.text.y = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks = element_blank()) +
  facet_wrap(~site, nrow = 3)

figb <- petal_dat %>% 
  filter(decade == 2090) %>% 
  filter(site == 'Very large MPAs') %>% 
  ggplot(aes(x=var, y=HD.val, fill=var)) +
  geom_bar(width=1,stat="identity",color="black") +
  xlab("") + ylab("") +
  scale_y_continuous(limits = c(-.5, 1)) +
  scale_fill_brewer(palette = "Set2") +
  coord_polar() +
  theme_minimal() +
  theme(legend.position = "none" , axis.text.y = element_blank() ,
        axis.ticks = element_blank())

ggpubr::ggarrange(
  figb, figa, llabels = c("a", "b"),
  nrow = 1
)

##### ssp370 #####
raster_2020 <- list(chl_ssp370[[1]], 
                    oxy_ssp370[[1]], 
                    pH_ssp370[[1]], 
                    si_ssp370[[1]], 
                    sst_ssp370[[1]], 
                    zoo_ssp370[[1]],
                    ssp370_raster[[1]])

raster_2030 <- list(chl_ssp370[[2]], 
                    oxy_ssp370[[2]], 
                    pH_ssp370[[2]], 
                    si_ssp370[[2]], 
                    sst_ssp370[[2]], 
                    zoo_ssp370[[2]],
                    ssp370_raster[[2]])

raster_2040 <- list(chl_ssp370[[3]], 
                    oxy_ssp370[[3]], 
                    pH_ssp370[[3]], 
                    si_ssp370[[3]], 
                    sst_ssp370[[3]], 
                    zoo_ssp370[[3]],
                    ssp370_raster[[3]])

raster_2050 <- list(chl_ssp370[[4]], 
                    oxy_ssp370[[4]], 
                    pH_ssp370[[4]], 
                    si_ssp370[[4]], 
                    sst_ssp370[[4]], 
                    zoo_ssp370[[4]],
                    ssp370_raster[[4]])

raster_2060 <- list(chl_ssp370[[5]], 
                    oxy_ssp370[[5]], 
                    pH_ssp370[[5]], 
                    si_ssp370[[5]], 
                    sst_ssp370[[5]], 
                    zoo_ssp370[[5]],
                    ssp370_raster[[5]])

raster_2070 <- list(chl_ssp370[[6]], 
                    oxy_ssp370[[6]], 
                    pH_ssp370[[6]], 
                    si_ssp370[[6]], 
                    sst_ssp370[[6]], 
                    zoo_ssp370[[6]],
                    ssp370_raster[[6]])

raster_2080 <- list(chl_ssp370[[7]], 
                    oxy_ssp370[[7]], 
                    pH_ssp370[[7]], 
                    si_ssp370[[7]], 
                    sst_ssp370[[7]], 
                    zoo_ssp370[[7]],
                    ssp370_raster[[7]])

raster_2090 <- list(chl_ssp370[[8]], 
                    oxy_ssp370[[8]], 
                    pH_ssp370[[8]], 
                    si_ssp370[[8]], 
                    sst_ssp370[[8]], 
                    zoo_ssp370[[8]],
                    ssp370_raster[[8]])

# create lists for each decade
vlmpa_ssp370_2020 <- list()
vlmpa_ssp370_2030 <- list()
vlmpa_ssp370_2040 <- list()
vlmpa_ssp370_2050 <- list()
vlmpa_ssp370_2060 <- list()
vlmpa_ssp370_2070 <- list()
vlmpa_ssp370_2080 <- list()
vlmpa_ssp370_2090 <- list()


for (i in 1:7) {
  vlmpa_ssp370_2020[[i]] <- raster::extract(raster_2020[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp370_2030[[i]] <- raster::extract(raster_2030[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp370_2040[[i]] <- raster::extract(raster_2040[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp370_2050[[i]] <- raster::extract(raster_2050[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp370_2060[[i]] <- raster::extract(raster_2060[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp370_2070[[i]] <- raster::extract(raster_2070[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp370_2080[[i]] <- raster::extract(raster_2080[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp370_2090[[i]] <- raster::extract(raster_2090[[i]], vlmpa_spdf, Fun=MEAN, small=TRUE, na.rm=TRUE, sp=TRUE)
}

names(vlmpa_ssp370_2020) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp370_2030) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp370_2040) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp370_2050) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp370_2060) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp370_2070) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp370_2080) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp370_2090) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")

vlmpa_names <- as.character(vlmpa_spdf@data$NAME)

vlmpa_df_chl <- matrix(nrow=29)
vlmpa_df_chl <- vlmpa_names
vlmpa_df_chl <- as.data.frame(vlmpa_df_chl)
colnames(vlmpa_df_chl)[colnames(vlmpa_df_chl)=="vlmpa_df_chl"] <- "site"

vlmpa_df_chl$`2020` <- lapply(vlmpa_ssp370_2020[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2030` <- lapply(vlmpa_ssp370_2030[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2040` <- lapply(vlmpa_ssp370_2040[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2050` <- lapply(vlmpa_ssp370_2050[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2060` <- lapply(vlmpa_ssp370_2060[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2070` <- lapply(vlmpa_ssp370_2070[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2080` <- lapply(vlmpa_ssp370_2080[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2090` <- lapply(vlmpa_ssp370_2090[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_oxy <- matrix(nrow=29)
vlmpa_df_oxy <- vlmpa_names
vlmpa_df_oxy <- as.data.frame(vlmpa_df_oxy)
colnames(vlmpa_df_oxy)[colnames(vlmpa_df_oxy)=="vlmpa_df_oxy"] <- "site"

vlmpa_df_oxy$`2020` <- lapply(vlmpa_ssp370_2020[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2030` <- lapply(vlmpa_ssp370_2030[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2040` <- lapply(vlmpa_ssp370_2040[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2050` <- lapply(vlmpa_ssp370_2050[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2060` <- lapply(vlmpa_ssp370_2060[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2070` <- lapply(vlmpa_ssp370_2070[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2080` <- lapply(vlmpa_ssp370_2080[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2090` <- lapply(vlmpa_ssp370_2090[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_pH <- matrix(nrow=29)
vlmpa_df_pH <- vlmpa_names
vlmpa_df_pH <- as.data.frame(vlmpa_df_pH)
colnames(vlmpa_df_pH)[colnames(vlmpa_df_pH)=="vlmpa_df_pH"] <- "site"

vlmpa_df_pH$`2020` <- lapply(vlmpa_ssp370_2020[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2030` <- lapply(vlmpa_ssp370_2030[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2040` <- lapply(vlmpa_ssp370_2040[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2050` <- lapply(vlmpa_ssp370_2050[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2060` <- lapply(vlmpa_ssp370_2060[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2070` <- lapply(vlmpa_ssp370_2070[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2080` <- lapply(vlmpa_ssp370_2080[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2090` <- lapply(vlmpa_ssp370_2090[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_si <- matrix(nrow=29)
vlmpa_df_si <- vlmpa_names
vlmpa_df_si <- as.data.frame(vlmpa_df_si)
colnames(vlmpa_df_si)[colnames(vlmpa_df_si)=="vlmpa_df_si"] <- "site"

vlmpa_df_si$`2020` <- lapply(vlmpa_ssp370_2020[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2030` <- lapply(vlmpa_ssp370_2030[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2040` <- lapply(vlmpa_ssp370_2040[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2050` <- lapply(vlmpa_ssp370_2050[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2060` <- lapply(vlmpa_ssp370_2060[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2070` <- lapply(vlmpa_ssp370_2070[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2080` <- lapply(vlmpa_ssp370_2080[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2090` <- lapply(vlmpa_ssp370_2090[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_sst <- matrix(nrow=29)
vlmpa_df_sst <- vlmpa_names
vlmpa_df_sst <- as.data.frame(vlmpa_df_sst)
colnames(vlmpa_df_sst)[colnames(vlmpa_df_sst)=="vlmpa_df_sst"] <- "site"

vlmpa_df_sst$`2020` <- lapply(vlmpa_ssp370_2020[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2030` <- lapply(vlmpa_ssp370_2030[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2040` <- lapply(vlmpa_ssp370_2040[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2050` <- lapply(vlmpa_ssp370_2050[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2060` <- lapply(vlmpa_ssp370_2060[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2070` <- lapply(vlmpa_ssp370_2070[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2080` <- lapply(vlmpa_ssp370_2080[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2090` <- lapply(vlmpa_ssp370_2090[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_zoo <- matrix(nrow=29)
vlmpa_df_zoo <- vlmpa_names
vlmpa_df_zoo <- as.data.frame(vlmpa_df_zoo)
colnames(vlmpa_df_zoo)[colnames(vlmpa_df_zoo)=="vlmpa_df_zoo"] <- "site"

vlmpa_df_zoo$`2020` <- lapply(vlmpa_ssp370_2020[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2030` <- lapply(vlmpa_ssp370_2030[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2040` <- lapply(vlmpa_ssp370_2040[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2050` <- lapply(vlmpa_ssp370_2050[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2060` <- lapply(vlmpa_ssp370_2060[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2070` <- lapply(vlmpa_ssp370_2070[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2080` <- lapply(vlmpa_ssp370_2080[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2090` <- lapply(vlmpa_ssp370_2090[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_mean <- matrix(nrow=29)
vlmpa_df_mean <- vlmpa_names
vlmpa_df_mean <- as.data.frame(vlmpa_df_mean)
colnames(vlmpa_df_mean)[colnames(vlmpa_df_mean)=="vlmpa_df_mean"] <- "site"

vlmpa_df_mean$`2020` <- lapply(vlmpa_ssp370_2020[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2030` <- lapply(vlmpa_ssp370_2030[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2040` <- lapply(vlmpa_ssp370_2040[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2050` <- lapply(vlmpa_ssp370_2050[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2060` <- lapply(vlmpa_ssp370_2060[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2070` <- lapply(vlmpa_ssp370_2070[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2080` <- lapply(vlmpa_ssp370_2080[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2090` <- lapply(vlmpa_ssp370_2090[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

# now prep to make df with col for each variable and year of novelty 
decades <- c("2020", "2030", "2040", "2050", "2060", "2070", "2080", "2090")

chl <- vlmpa_df_chl %>% 
  pivot_longer(all_of(decades), names_to = "decade.chl", values_to = "HD")

chl_new <- unique(subset(chl, HD >= 0.5))
chl_new$decade.chl <- as.numeric(chl_new$decade.chl)
chl_new <- chl_new[order(chl_new$site, abs(chl_new$decade.chl)),]
chl_new <- chl_new[!duplicated(chl_new$site), ]

oxy <- vlmpa_df_oxy %>% 
  pivot_longer(all_of(decades), names_to = "decade.oxy", values_to = "HD")

oxy_new <- unique(subset(oxy, HD >= 0.5))
oxy_new$decade.oxy <- as.numeric(oxy_new$decade.oxy)
oxy_new <- oxy_new[order(oxy_new$site, abs(oxy_new$decade.oxy)),]
oxy_new <- oxy_new[!duplicated(oxy_new$site), ]

pH <- vlmpa_df_pH %>% 
  pivot_longer(all_of(decades), names_to = "decade.pH", values_to = "HD")

pH_new <- unique(subset(pH, HD >= 0.5))
pH_new$decade.pH <- as.numeric(pH_new$decade.pH)
pH_new <- pH_new[order(pH_new$site, abs(pH_new$decade.pH)),]
pH_new <- pH_new[!duplicated(pH_new$site), ]

si <- vlmpa_df_si %>% 
  pivot_longer(all_of(decades), names_to = "decade.si", values_to = "HD")

si_new <- unique(subset(si, HD >= 0.5))
si_new$decade.si <- as.numeric(si_new$decade.si)
si_new <- si_new[order(si_new$site, abs(si_new$decade.si)),]
si_new <- si_new[!duplicated(si_new$site), ]

sst <- vlmpa_df_sst %>% 
  pivot_longer(all_of(decades), names_to = "decade.sst", values_to = "HD")

sst_new <- unique(subset(sst, HD >= 0.5))
sst_new$decade.sst <- as.numeric(sst_new$decade.sst)
sst_new <- sst_new[order(sst_new$site, abs(sst_new$decade.sst)),]
sst_new <- sst_new[!duplicated(sst_new$site), ]

zoo <- vlmpa_df_zoo %>% 
  pivot_longer(all_of(decades), names_to = "decade.zoo", values_to = "HD")

zoo_new <- unique(subset(zoo, HD >= 0.5))
zoo_new$decade.zoo <- as.numeric(zoo_new$decade.zoo)
zoo_new <- zoo_new[order(zoo_new$site, abs(zoo_new$decade.zoo)),]
zoo_new <- zoo_new[!duplicated(zoo_new$site), ]

mean <- vlmpa_df_mean %>% 
  pivot_longer(all_of(decades), names_to = "decade.mean", values_to = "HD")

mean_new <- unique(subset(mean, HD >= 0.5))
mean_new$decade.mean <- as.numeric(mean_new$decade.mean)
mean_new <- mean_new[order(mean_new$site, abs(mean_new$decade.mean)),]
mean_new <- mean_new[!duplicated(mean_new$site), ]

##### now append to a master df #####
vlmpa_df <- as.data.frame(vlmpa_names)
colnames(vlmpa_df) <- "site"

vlmpa_df <- vlmpa_df %>%
  full_join(chl_new, by = intersect(colnames(vlmpa_df), colnames(chl_new)))
vlmpa_df <- vlmpa_df[-3]

vlmpa_df <- vlmpa_df %>%
  full_join(oxy_new, by = intersect(colnames(vlmpa_df), colnames(oxy_new)))
vlmpa_df <- vlmpa_df[-4]

vlmpa_df <- vlmpa_df %>%
  full_join(pH_new, by = intersect(colnames(vlmpa_df), colnames(pH_new)))
vlmpa_df <- vlmpa_df[-5]

vlmpa_df <- vlmpa_df %>%
  full_join(si_new, by = intersect(colnames(vlmpa_df), colnames(si_new)))
vlmpa_df <- vlmpa_df[-6]

vlmpa_df <- vlmpa_df %>%
  full_join(sst_new, by = intersect(colnames(vlmpa_df), colnames(sst_new)))
vlmpa_df <- vlmpa_df[-7]

vlmpa_df <- vlmpa_df %>%
  full_join(zoo_new, by = intersect(colnames(vlmpa_df), colnames(zoo_new)))
vlmpa_df <- vlmpa_df[-8]

vlmpa_df <- vlmpa_df %>%
  full_join(mean_new, by = intersect(colnames(vlmpa_df), colnames(mean_new)))
vlmpa_df <- vlmpa_df[-9]

vlmpa_df$novel.dims <- rowSums(!is.na(vlmpa_df[2:7]))

for (i in 1:nrow(vlmpa_df)) {
  vlmpa_df[i,10] <- min(vlmpa_df[i,2:7], na.rm=TRUE)
}

vlmpa_df$novel.dims <- factor(vlmpa_df$novel.dims)
colnames(vlmpa_df)[colnames(vlmpa_df) == "V10"] <- "novel.decade"
vlmpa_df$novel.decade <- factor(vlmpa_df$novel.decade)

vlmpa_df %>% 
  ggplot(aes(x=novel.dims)) +
  geom_histogram(bins=5, color="black", fill="light blue", stat = "count") +
  theme_classic()

vlmpa_df %>% 
  drop_na(novel.decade) %>% 
  ggplot(aes(x=novel.decade)) +
  geom_histogram(bins=5, color="black", fill="light blue", stat = "count") +
  theme_classic()

##### Write vlmpa outputs to csv's #####
write.csv(vlmpa_df, "ssp370_decade-novel-var.csv")
write.csv(as.matrix(vlmpa_df_pH), "ssp370_novel-pH.csv")
write.csv(as.matrix(vlmpa_df_chl), "ssp370_novel-chl.csv")
write.csv(as.matrix(vlmpa_df_oxy), "ssp370_novel-oxy.csv")
write.csv(as.matrix(vlmpa_df_si), "ssp370_novel-si.csv")
write.csv(as.matrix(vlmpa_df_sst), "ssp370_novel-sst.csv")
write.csv(as.matrix(vlmpa_df_zoo), "ssp370_novel-zoo.csv")
write.csv(as.matrix(vlmpa_df_mean), "ssp370_novel-mean.csv")

##### figure 3 - petal figure #####
# get the mean of each variable
vlmpa_df_chl[,c(2:9)] <- sapply(vlmpa_df_chl[, c(2:9)], as.numeric)
vlmpa_df_chl[30,2:9] <- colMeans(vlmpa_df_chl[,-c(1,10)])
vlmpa_df_chl[30,1] <- "Very large MPAs"

vlmpa_df_oxy[,c(2:9)] <- sapply(vlmpa_df_oxy[, c(2:9)], as.numeric)
vlmpa_df_oxy[30,2:9] <- colMeans(vlmpa_df_oxy[,-c(1,10)])
vlmpa_df_oxy[30,1] <- "Very large MPAs"

vlmpa_df_pH[,c(2:9)] <- sapply(vlmpa_df_pH[, c(2:9)], as.numeric)
vlmpa_df_pH[30,2:9] <- colMeans(vlmpa_df_pH[,-c(1,10)])
vlmpa_df_pH[30,1] <- "Very large MPAs"

vlmpa_df_si[,c(2:9)] <- sapply(vlmpa_df_si[, c(2:9)], as.numeric)
vlmpa_df_si[30,2:9] <- colMeans(vlmpa_df_si[,-c(1,10)])
vlmpa_df_si[30,1] <- "Very large MPAs"

vlmpa_df_sst[,c(2:9)] <- sapply(vlmpa_df_sst[, c(2:9)], as.numeric)
vlmpa_df_sst[30,2:9] <- colMeans(vlmpa_df_sst[,-c(1,10)])
vlmpa_df_sst[30,1] <- "Very large MPAs"

vlmpa_df_zoo[,c(2:9)] <- sapply(vlmpa_df_zoo[, c(2:9)], as.numeric)
vlmpa_df_zoo[30,2:9] <- colMeans(vlmpa_df_zoo[,-c(1,10)])
vlmpa_df_zoo[30,1] <- "Very large MPAs"

vlmpa_df_mean[,c(2:9)] <- sapply(vlmpa_df_mean[, c(2:9)], as.numeric)
vlmpa_df_mean[30,2:9] <- colMeans(vlmpa_df_mean[,-c(1,10)])
vlmpa_df_mean[30,1] <- "Very large MPAs"

# Need to add the var column to each df
vlmpa_df_chl$var <- "chl"
vlmpa_df_oxy$var <- "oxy"
vlmpa_df_pH$var <- "pH"
vlmpa_df_si$var <- "si"
vlmpa_df_sst$var <- "sst"
vlmpa_df_zoo$var <- "zoo"

# combine the four dfs #
petal_dat <- rbind(vlmpa_df_chl, vlmpa_df_oxy, vlmpa_df_pH, vlmpa_df_si, vlmpa_df_sst, vlmpa_df_zoo)
petal_dat <- petal_dat %>% 
  pivot_longer(c(2:9), names_to = "decade", values_to = "HD.val")
petal_dat$HD.val <- as.numeric(unlist(petal_dat$HD.val))
petal_dat <- within(petal_dat, site <- factor(site, levels = c(vlmpa_names, "Very large MPAs")))
with(petal_dat, levels(site))

vlmpa_petal <- vlmpa_names[c(9,20,15,18,
                             8,14,2,28,
                             21,1,27,4)]


vlmpa_plot <- petal_dat %>% 
  filter(decade == 2090) %>%
  filter(site %in% vlmpa_petal)

vlmpa_plot$site <- factor(vlmpa_plot$site, levels = vlmpa_petal)

figa <- vlmpa_plot %>% 
  ggplot(aes(x=var, y=HD.val, fill=var)) +
  geom_bar(width=1, stat="identity", color="black") +
  xlab("") + ylab("") +
  scale_y_continuous(limits = c(-.5, 1)) +
  scale_fill_brewer(palette = "Set2") +
  coord_polar() +
  theme_minimal() +
  theme(legend.position = "none" , axis.text.y = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks = element_blank()) +
  facet_wrap(~site, nrow = 3)

figb <- petal_dat %>% 
  filter(decade == 2090) %>% 
  filter(site == 'Very large MPAs') %>% 
  ggplot(aes(x=var, y=HD.val, fill=var)) +
  geom_bar(width=1,stat="identity",color="black") +
  xlab("") + ylab("") +
  scale_y_continuous(limits = c(-.5, 1)) +
  scale_fill_brewer(palette = "Set2") +
  coord_polar() +
  theme_minimal() +
  theme(legend.position = "none" , axis.text.y = element_blank() ,
        axis.ticks = element_blank())

ggpubr::ggarrange(
  figb, figa, llabels = c("a", "b"),
  nrow = 1
)

# ssp585
raster_2020 <- list(chl_ssp585[[1]], 
                    oxy_ssp585[[1]], 
                    pH_ssp585[[1]], 
                    si_ssp585[[1]], 
                    sst_ssp585[[1]], 
                    zoo_ssp585[[1]],
                    ssp585_raster[[1]])

raster_2030 <- list(chl_ssp585[[2]], 
                    oxy_ssp585[[2]], 
                    pH_ssp585[[2]], 
                    si_ssp585[[2]], 
                    sst_ssp585[[2]], 
                    zoo_ssp585[[2]],
                    ssp585_raster[[2]])

raster_2040 <- list(chl_ssp585[[3]], 
                    oxy_ssp585[[3]], 
                    pH_ssp585[[3]], 
                    si_ssp585[[3]], 
                    sst_ssp585[[3]], 
                    zoo_ssp585[[3]],
                    ssp585_raster[[3]])

raster_2050 <- list(chl_ssp585[[4]], 
                    oxy_ssp585[[4]], 
                    pH_ssp585[[4]], 
                    si_ssp585[[4]], 
                    sst_ssp585[[4]], 
                    zoo_ssp585[[4]],
                    ssp585_raster[[4]])

raster_2060 <- list(chl_ssp585[[5]], 
                    oxy_ssp585[[5]], 
                    pH_ssp585[[5]], 
                    si_ssp585[[5]], 
                    sst_ssp585[[5]], 
                    zoo_ssp585[[5]],
                    ssp585_raster[[5]])

raster_2070 <- list(chl_ssp585[[6]], 
                    oxy_ssp585[[6]], 
                    pH_ssp585[[6]], 
                    si_ssp585[[6]], 
                    sst_ssp585[[6]], 
                    zoo_ssp585[[6]],
                    ssp585_raster[[6]])

raster_2080 <- list(chl_ssp585[[7]], 
                    oxy_ssp585[[7]], 
                    pH_ssp585[[7]], 
                    si_ssp585[[7]], 
                    sst_ssp585[[7]], 
                    zoo_ssp585[[7]],
                    ssp585_raster[[7]])

raster_2090 <- list(chl_ssp585[[8]], 
                    oxy_ssp585[[8]], 
                    pH_ssp585[[8]], 
                    si_ssp585[[8]], 
                    sst_ssp585[[8]], 
                    zoo_ssp585[[8]],
                    ssp585_raster[[8]])

# create lists for each decade
vlmpa_ssp585_2020 <- list()
vlmpa_ssp585_2030 <- list()
vlmpa_ssp585_2040 <- list()
vlmpa_ssp585_2050 <- list()
vlmpa_ssp585_2060 <- list()
vlmpa_ssp585_2070 <- list()
vlmpa_ssp585_2080 <- list()
vlmpa_ssp585_2090 <- list()


for (i in 1:7) {
  vlmpa_ssp585_2020[[i]] <- raster::extract(raster_2020[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp585_2030[[i]] <- raster::extract(raster_2030[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp585_2040[[i]] <- raster::extract(raster_2040[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp585_2050[[i]] <- raster::extract(raster_2050[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp585_2060[[i]] <- raster::extract(raster_2060[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp585_2070[[i]] <- raster::extract(raster_2070[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp585_2080[[i]] <- raster::extract(raster_2080[[i]], vlmpa_spdf, Fun=mean, small=TRUE, na.rm=TRUE, sp=TRUE)
  vlmpa_ssp585_2090[[i]] <- raster::extract(raster_2090[[i]], vlmpa_spdf, Fun=MEAN, small=TRUE, na.rm=TRUE, sp=TRUE)
}

names(vlmpa_ssp585_2020) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp585_2030) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp585_2040) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp585_2050) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp585_2060) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp585_2070) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp585_2080) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")
names(vlmpa_ssp585_2090) <- c("Chlorophyll", "Oxygen", "pH", "Silica", "SST", "Zooplankton", "Mean Hellinger distance")

vlmpa_names <- as.character(vlmpa_spdf@data$NAME)

vlmpa_df_chl <- matrix(nrow=29)
vlmpa_df_chl <- vlmpa_names
vlmpa_df_chl <- as.data.frame(vlmpa_df_chl)
colnames(vlmpa_df_chl)[colnames(vlmpa_df_chl)=="vlmpa_df_chl"] <- "site"

vlmpa_df_chl$`2020` <- lapply(vlmpa_ssp585_2020[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2030` <- lapply(vlmpa_ssp585_2030[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2040` <- lapply(vlmpa_ssp585_2040[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2050` <- lapply(vlmpa_ssp585_2050[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2060` <- lapply(vlmpa_ssp585_2060[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2070` <- lapply(vlmpa_ssp585_2070[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2080` <- lapply(vlmpa_ssp585_2080[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_chl$`2090` <- lapply(vlmpa_ssp585_2090[[1]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_oxy <- matrix(nrow=29)
vlmpa_df_oxy <- vlmpa_names
vlmpa_df_oxy <- as.data.frame(vlmpa_df_oxy)
colnames(vlmpa_df_oxy)[colnames(vlmpa_df_oxy)=="vlmpa_df_oxy"] <- "site"

vlmpa_df_oxy$`2020` <- lapply(vlmpa_ssp585_2020[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2030` <- lapply(vlmpa_ssp585_2030[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2040` <- lapply(vlmpa_ssp585_2040[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2050` <- lapply(vlmpa_ssp585_2050[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2060` <- lapply(vlmpa_ssp585_2060[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2070` <- lapply(vlmpa_ssp585_2070[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2080` <- lapply(vlmpa_ssp585_2080[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_oxy$`2090` <- lapply(vlmpa_ssp585_2090[[2]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_pH <- matrix(nrow=29)
vlmpa_df_pH <- vlmpa_names
vlmpa_df_pH <- as.data.frame(vlmpa_df_pH)
colnames(vlmpa_df_pH)[colnames(vlmpa_df_pH)=="vlmpa_df_pH"] <- "site"

vlmpa_df_pH$`2020` <- lapply(vlmpa_ssp585_2020[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2030` <- lapply(vlmpa_ssp585_2030[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2040` <- lapply(vlmpa_ssp585_2040[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2050` <- lapply(vlmpa_ssp585_2050[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2060` <- lapply(vlmpa_ssp585_2060[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2070` <- lapply(vlmpa_ssp585_2070[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2080` <- lapply(vlmpa_ssp585_2080[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_pH$`2090` <- lapply(vlmpa_ssp585_2090[[3]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_si <- matrix(nrow=29)
vlmpa_df_si <- vlmpa_names
vlmpa_df_si <- as.data.frame(vlmpa_df_si)
colnames(vlmpa_df_si)[colnames(vlmpa_df_si)=="vlmpa_df_si"] <- "site"

vlmpa_df_si$`2020` <- lapply(vlmpa_ssp585_2020[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2030` <- lapply(vlmpa_ssp585_2030[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2040` <- lapply(vlmpa_ssp585_2040[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2050` <- lapply(vlmpa_ssp585_2050[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2060` <- lapply(vlmpa_ssp585_2060[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2070` <- lapply(vlmpa_ssp585_2070[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2080` <- lapply(vlmpa_ssp585_2080[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_si$`2090` <- lapply(vlmpa_ssp585_2090[[4]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_sst <- matrix(nrow=29)
vlmpa_df_sst <- vlmpa_names
vlmpa_df_sst <- as.data.frame(vlmpa_df_sst)
colnames(vlmpa_df_sst)[colnames(vlmpa_df_sst)=="vlmpa_df_sst"] <- "site"

vlmpa_df_sst$`2020` <- lapply(vlmpa_ssp585_2020[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2030` <- lapply(vlmpa_ssp585_2030[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2040` <- lapply(vlmpa_ssp585_2040[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2050` <- lapply(vlmpa_ssp585_2050[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2060` <- lapply(vlmpa_ssp585_2060[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2070` <- lapply(vlmpa_ssp585_2070[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2080` <- lapply(vlmpa_ssp585_2080[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_sst$`2090` <- lapply(vlmpa_ssp585_2090[[5]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_zoo <- matrix(nrow=29)
vlmpa_df_zoo <- vlmpa_names
vlmpa_df_zoo <- as.data.frame(vlmpa_df_zoo)
colnames(vlmpa_df_zoo)[colnames(vlmpa_df_zoo)=="vlmpa_df_zoo"] <- "site"

vlmpa_df_zoo$`2020` <- lapply(vlmpa_ssp585_2020[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2030` <- lapply(vlmpa_ssp585_2030[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2040` <- lapply(vlmpa_ssp585_2040[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2050` <- lapply(vlmpa_ssp585_2050[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2060` <- lapply(vlmpa_ssp585_2060[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2070` <- lapply(vlmpa_ssp585_2070[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2080` <- lapply(vlmpa_ssp585_2080[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_zoo$`2090` <- lapply(vlmpa_ssp585_2090[[6]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

vlmpa_df_mean <- matrix(nrow=29)
vlmpa_df_mean <- vlmpa_names
vlmpa_df_mean <- as.data.frame(vlmpa_df_mean)
colnames(vlmpa_df_mean)[colnames(vlmpa_df_mean)=="vlmpa_df_mean"] <- "site"

vlmpa_df_mean$`2020` <- lapply(vlmpa_ssp585_2020[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2030` <- lapply(vlmpa_ssp585_2030[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2040` <- lapply(vlmpa_ssp585_2040[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2050` <- lapply(vlmpa_ssp585_2050[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2060` <- lapply(vlmpa_ssp585_2060[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2070` <- lapply(vlmpa_ssp585_2070[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2080` <- lapply(vlmpa_ssp585_2080[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )
vlmpa_df_mean$`2090` <- lapply(vlmpa_ssp585_2090[[7]], function(x) if (!is.null(x)) mean(x, na.rm=TRUE) else NA )

# now prep to make df with col for each variable and year of novelty 
decades <- c("2020", "2030", "2040", "2050", "2060", "2070", "2080", "2090")

chl <- vlmpa_df_chl %>% 
  pivot_longer(all_of(decades), names_to = "decade.chl", values_to = "HD")

chl_new <- unique(subset(chl, HD >= 0.5))
chl_new$decade.chl <- as.numeric(chl_new$decade.chl)
chl_new <- chl_new[order(chl_new$site, abs(chl_new$decade.chl)),]
chl_new <- chl_new[!duplicated(chl_new$site), ]

oxy <- vlmpa_df_oxy %>% 
  pivot_longer(all_of(decades), names_to = "decade.oxy", values_to = "HD")

oxy_new <- unique(subset(oxy, HD >= 0.5))
oxy_new$decade.oxy <- as.numeric(oxy_new$decade.oxy)
oxy_new <- oxy_new[order(oxy_new$site, abs(oxy_new$decade.oxy)),]
oxy_new <- oxy_new[!duplicated(oxy_new$site), ]

pH <- vlmpa_df_pH %>% 
  pivot_longer(all_of(decades), names_to = "decade.pH", values_to = "HD")

pH_new <- unique(subset(pH, HD >= 0.5))
pH_new$decade.pH <- as.numeric(pH_new$decade.pH)
pH_new <- pH_new[order(pH_new$site, abs(pH_new$decade.pH)),]
pH_new <- pH_new[!duplicated(pH_new$site), ]

si <- vlmpa_df_si %>% 
  pivot_longer(all_of(decades), names_to = "decade.si", values_to = "HD")

si_new <- unique(subset(si, HD >= 0.5))
si_new$decade.si <- as.numeric(si_new$decade.si)
si_new <- si_new[order(si_new$site, abs(si_new$decade.si)),]
si_new <- si_new[!duplicated(si_new$site), ]

sst <- vlmpa_df_sst %>% 
  pivot_longer(all_of(decades), names_to = "decade.sst", values_to = "HD")

sst_new <- unique(subset(sst, HD >= 0.5))
sst_new$decade.sst <- as.numeric(sst_new$decade.sst)
sst_new <- sst_new[order(sst_new$site, abs(sst_new$decade.sst)),]
sst_new <- sst_new[!duplicated(sst_new$site), ]

zoo <- vlmpa_df_zoo %>% 
  pivot_longer(all_of(decades), names_to = "decade.zoo", values_to = "HD")

zoo_new <- unique(subset(zoo, HD >= 0.5))
zoo_new$decade.zoo <- as.numeric(zoo_new$decade.zoo)
zoo_new <- zoo_new[order(zoo_new$site, abs(zoo_new$decade.zoo)),]
zoo_new <- zoo_new[!duplicated(zoo_new$site), ]

mean <- vlmpa_df_mean %>% 
  pivot_longer(all_of(decades), names_to = "decade.mean", values_to = "HD")

mean_new <- unique(subset(mean, HD >= 0.5))
mean_new$decade.mean <- as.numeric(mean_new$decade.mean)
mean_new <- mean_new[order(mean_new$site, abs(mean_new$decade.mean)),]
mean_new <- mean_new[!duplicated(mean_new$site), ]

##### ssp585 ######
##### now append to a master df #####
vlmpa_df <- as.data.frame(vlmpa_names)
colnames(vlmpa_df) <- "site"

vlmpa_df <- vlmpa_df %>%
  full_join(chl_new, by = intersect(colnames(vlmpa_df), colnames(chl_new)))
vlmpa_df <- vlmpa_df[-3]

vlmpa_df <- vlmpa_df %>%
  full_join(oxy_new, by = intersect(colnames(vlmpa_df), colnames(oxy_new)))
vlmpa_df <- vlmpa_df[-4]

vlmpa_df <- vlmpa_df %>%
  full_join(pH_new, by = intersect(colnames(vlmpa_df), colnames(pH_new)))
vlmpa_df <- vlmpa_df[-5]

vlmpa_df <- vlmpa_df %>%
  full_join(si_new, by = intersect(colnames(vlmpa_df), colnames(si_new)))
vlmpa_df <- vlmpa_df[-6]

vlmpa_df <- vlmpa_df %>%
  full_join(sst_new, by = intersect(colnames(vlmpa_df), colnames(sst_new)))
vlmpa_df <- vlmpa_df[-7]

vlmpa_df <- vlmpa_df %>%
  full_join(zoo_new, by = intersect(colnames(vlmpa_df), colnames(zoo_new)))
vlmpa_df <- vlmpa_df[-8]

vlmpa_df <- vlmpa_df %>%
  full_join(mean_new, by = intersect(colnames(vlmpa_df), colnames(mean_new)))
vlmpa_df <- vlmpa_df[-9]

vlmpa_df$novel.dims <- rowSums(!is.na(vlmpa_df[2:7]))

for (i in 1:nrow(vlmpa_df)) {
  vlmpa_df[i,10] <- min(vlmpa_df[i,2:7], na.rm=TRUE)
}

vlmpa_df$novel.dims <- factor(vlmpa_df$novel.dims)
colnames(vlmpa_df)[colnames(vlmpa_df) == "V10"] <- "novel.decade"
vlmpa_df$novel.decade <- factor(vlmpa_df$novel.decade)

vlmpa_df %>% 
  ggplot(aes(x=novel.dims)) +
  geom_histogram(bins=5, color="black", fill="light blue", stat = "count") +
  theme_classic()

vlmpa_df %>% 
  drop_na(novel.decade) %>% 
  ggplot(aes(x=novel.decade)) +
  geom_histogram(bins=5, color="black", fill="light blue", stat = "count") +
  theme_classic()

##### Write vlmpa outputs to csv's #####
write.csv(vlmpa_df, "ssp585_decade-novel-var.csv")
write.csv(as.matrix(vlmpa_df_pH), "ssp585_novel-pH.csv")
write.csv(as.matrix(vlmpa_df_chl), "ssp585_novel-chl.csv")
write.csv(as.matrix(vlmpa_df_oxy), "ssp585_novel-oxy.csv")
write.csv(as.matrix(vlmpa_df_si), "ssp585_novel-si.csv")
write.csv(as.matrix(vlmpa_df_sst), "ssp585_novel-sst.csv")
write.csv(as.matrix(vlmpa_df_zoo), "ssp585_novel-zoo.csv")
write.csv(as.matrix(vlmpa_df_mean), "ssp585_novel-mean.csv")

##### figure 3 - petal figure #####
# get the mean of each variable
vlmpa_df_chl[,c(2:9)] <- sapply(vlmpa_df_chl[, c(2:9)], as.numeric)
vlmpa_df_chl[30,2:9] <- colMeans(vlmpa_df_chl[,-c(1,10)])
vlmpa_df_chl[30,1] <- "Very large MPAs"

vlmpa_df_oxy[,c(2:9)] <- sapply(vlmpa_df_oxy[, c(2:9)], as.numeric)
vlmpa_df_oxy[30,2:9] <- colMeans(vlmpa_df_oxy[,-c(1,10)])
vlmpa_df_oxy[30,1] <- "Very large MPAs"

vlmpa_df_pH[,c(2:9)] <- sapply(vlmpa_df_pH[, c(2:9)], as.numeric)
vlmpa_df_pH[30,2:9] <- colMeans(vlmpa_df_pH[,-c(1,10)])
vlmpa_df_pH[30,1] <- "Very large MPAs"

vlmpa_df_si[,c(2:9)] <- sapply(vlmpa_df_si[, c(2:9)], as.numeric)
vlmpa_df_si[30,2:9] <- colMeans(vlmpa_df_si[,-c(1,10)])
vlmpa_df_si[30,1] <- "Very large MPAs"

vlmpa_df_sst[,c(2:9)] <- sapply(vlmpa_df_sst[, c(2:9)], as.numeric)
vlmpa_df_sst[30,2:9] <- colMeans(vlmpa_df_sst[,-c(1,10)])
vlmpa_df_sst[30,1] <- "Very large MPAs"

vlmpa_df_zoo[,c(2:9)] <- sapply(vlmpa_df_zoo[, c(2:9)], as.numeric)
vlmpa_df_zoo[30,2:9] <- colMeans(vlmpa_df_zoo[,-c(1,10)])
vlmpa_df_zoo[30,1] <- "Very large MPAs"

vlmpa_df_mean[,c(2:9)] <- sapply(vlmpa_df_mean[, c(2:9)], as.numeric)
vlmpa_df_mean[30,2:9] <- colMeans(vlmpa_df_mean[,-c(1,10)])
vlmpa_df_mean[30,1] <- "Very large MPAs"

# Need to add the var column to each df
vlmpa_df_chl$var <- "chl"
vlmpa_df_oxy$var <- "oxy"
vlmpa_df_pH$var <- "pH"
vlmpa_df_si$var <- "si"
vlmpa_df_sst$var <- "sst"
vlmpa_df_zoo$var <- "zoo"

# combine the four dfs #
petal_dat <- rbind(vlmpa_df_chl, vlmpa_df_oxy, vlmpa_df_pH, vlmpa_df_si, vlmpa_df_sst, vlmpa_df_zoo)
petal_dat <- petal_dat %>% 
  pivot_longer(c(2:9), names_to = "decade", values_to = "HD.val")
petal_dat$HD.val <- as.numeric(unlist(petal_dat$HD.val))
petal_dat <- within(petal_dat, site <- factor(site, levels = c(vlmpa_names, "Very large MPAs")))
with(petal_dat, levels(site))

vlmpa_petal <- vlmpa_names[c(9,11,8,18,
                             28,2,14,12,
                             10,27,1,4)]


vlmpa_plot <- petal_dat %>% 
  filter(decade == 2090) %>%
  filter(site %in% vlmpa_petal)

vlmpa_plot$site <- factor(vlmpa_plot$site, levels = vlmpa_petal)

figa <- vlmpa_plot %>% 
  ggplot(aes(x=var, y=HD.val, fill=var)) +
  geom_bar(width=1, stat="identity", color="black") +
  xlab("") + ylab("") +
  scale_y_continuous(limits = c(-.5, 1)) +
  scale_fill_brewer(palette = "Set2") +
  coord_polar() +
  theme_minimal() +
  theme(legend.position = "none" , axis.text.y = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks = element_blank()) +
  facet_wrap(~site, nrow = 3)

figb <- petal_dat %>% 
  filter(decade == 2090) %>% 
  filter(site == 'Very large MPAs') %>% 
  ggplot(aes(x=var, y=HD.val, fill=var)) +
  geom_bar(width=1,stat="identity",color="black") +
  xlab("") + ylab("") +
  scale_y_continuous(limits = c(-.5, 1)) +
  scale_fill_brewer(palette = "Set2") +
  coord_polar() +
  theme_minimal() +
  theme(legend.position = "none" , axis.text.y = element_blank() ,
        axis.ticks = element_blank())

ggpubr::ggarrange(
  figb, figa, llabels = c("a", "b"),
  nrow = 1
)

##### figure 4 - novel dims #####
##### ssp245 #####
library(ggpubr)
library(scales)

novel_ssp245$novel.dims <- apply(novel_ssp245[3:8], 1, function(x) 6-sum(is.na(x)))
novel_ssp245$pct.cvr <- 1/64800

novel_dims <- novel_ssp245 %>% 
  filter(cell_type == "ocean") %>% 
  ggplot(aes(x=as.factor(novel.dims))) +
  geom_histogram(stat = "count", color="black", fill="steelblue", bins=7) +
  labs(x="Novel dimensions (Hellinger distance > 0.5)") +
  theme_classic()

novel_dims

novel_vars <- novel_ssp245 %>%
  filter(cell_type == "ocean") %>% 
  pivot_longer(c("decade.chl", "decade.oxy", "decade.pH", "decade.sst", "decade.si", "decade.zoo"), names_to="var", values_to="decade") %>% 
  mutate(decade = factor(decade, levels = decade_order)) %>%
  drop_na() %>% 
  ggplot(aes(x=as.factor(decade))) +
  geom_bar(aes(y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..]), color="black", fill="steelblue") + 
  labs(x="Decade", y="Ocean surface area") +
  facet_wrap(~var) +
  scale_y_continuous(labels=percent) +
  theme_classic()

novel_vars

novel_decade <- novel_ssp245 %>% 
  filter(cell_type == "ocean") %>% 
  filter(decade.novel != "Inf") %>% 
  ggplot(aes(x=as.factor(decade.novel))) +
  geom_bar(aes(y = (..count..)/sum(..count..)), color="black", fill="steelblue") + 
  scale_y_continuous(labels=percent) +
  labs(x="Emergence of novelty", y="Ocean surface area") +
  theme_classic()

novel_decade

dims_emerge <- ggarrange(novel_vars, novel_decade, labels=c("b", "c"), nrow=1)

# create spatial points data frame
spg <- novel_ssp245[c(1:2,12)]
coordinates(spg) <- ~ x + y
# coerce to SpatialPixelsDataFrame
gridded(spg) <- TRUE
# coerce to raster
rasterDF <- raster(spg)
rasterDF

mapTheme <- rasterTheme(region=rev(grDevices::heat.colors(100)))

plt <- levelplot(rasterDF, par.settings=mapTheme, at = seq(-1,6,by=1),
                 main = "Novel dimensions",
                 xlab = "", ylab = "",
                 colorkey=list(space="bottom"),
                 auto.key = list(title="Hellinger distance"),
                 margin = list(draw=FALSE),
                 xaxs="i", yaxs="i",
                 panel = function(...){
                   panel.levelplot(...)
                   panel.abline(h=0, col="grey")
                   panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                 },
                 scales = list(y=list(at=seq(-45,45,45)),
                               x=list(at=seq(90,270,90))
                 )
)

novel_dims_map <- plt + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) + 
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

ggarrange(novel_dims_map, dims_emerge, labels=c("a",""), nrow=2)

# now do no-pH
novel_ssp245$novel.dims.nopH <- apply(novel_ssp245[c(3,4,6:8)], 1, function(x) 5-sum(is.na(x)))

novel_dims <- novel_ssp245 %>% 
  filter(cell_type == "ocean") %>% 
  ggplot(aes(x=as.factor(novel.dims.nopH))) +
  geom_histogram(stat = "count", color="black", fill="steelblue", bins=7) +
  labs(x="Novel dimensions (Hellinger distance > 0.5)") +
  theme_classic()

novel_dims

novel_vars <- novel_ssp245 %>%
  filter(cell_type == "ocean") %>% 
  pivot_longer(c("decade.chl", "decade.oxy", "decade.sst", "decade.si", "decade.zoo"), names_to="var", values_to="decade") %>% 
  mutate(decade = factor(decade, levels = decade_order)) %>%
  drop_na() %>% 
  ggplot(aes(x=as.factor(decade))) +
  geom_bar(aes(y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..]), color="black", fill="steelblue") + 
  labs(x="Decade", y="Ocean surface area") +
  facet_wrap(~var) +
  scale_y_continuous(labels=percent) +
  theme_classic()

novel_vars

novel_decade <- novel_ssp245 %>% 
  filter(cell_type == "ocean") %>% 
  filter(decade.novel.nopH != "Inf") %>%
  ggplot(aes(x=as.factor(decade.novel.nopH))) +
  geom_bar(aes(y = (..count..)/sum(..count..)), color="black", fill="steelblue") + 
  scale_y_continuous(labels=percent) +
  labs(x="Emergence of novelty", y="Ocean surface area") +
  theme_classic()

novel_decade

dims_emerge <- ggarrange(novel_vars, novel_decade, labels=c("b", "c"), nrow=1)

# create spatial points data frame
spg <- novel_ssp245[c(1:2,14)]
coordinates(spg) <- ~ x + y
# coerce to SpatialPixelsDataFrame
gridded(spg) <- TRUE
# coerce to raster
rasterDF <- raster(spg)
rasterDF

plt <- levelplot(rasterDF, par.settings=mapTheme, at = seq(-1,5,by=1),
                 main = "Novel dimensions [no pH]",
                 xlab = "", ylab = "",
                 colorkey=list(space="bottom"),
                 auto.key = list(title="Hellinger distance"),
                 margin = list(draw=FALSE),
                 xaxs="i", yaxs="i",
                 panel = function(...){
                   panel.levelplot(...)
                   panel.abline(h=0, col="grey")
                   panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                 },
                 scales = list(y=list(at=seq(-45,45,45)),
                               x=list(at=seq(90,270,90))
                 )
)

novel_dims_map <- plt + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) + 
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

ggarrange(novel_dims_map, dims_emerge, labels=c("a",""), nrow=2)


##### ssp370 #####
novel_ssp370$novel.dims <- apply(novel_ssp370[3:8], 1, function(x) 6-sum(is.na(x)))
novel_ssp370$pct.cvr <- 1/64800

novel_dims <- novel_ssp370 %>% 
  filter(cell_type == "ocean") %>% 
  ggplot(aes(x=as.factor(novel.dims))) +
  geom_histogram(stat = "count", color="black", fill="steelblue", bins=7) +
  labs(x="Novel dimensions (Hellinger distance > 0.5)") +
  theme_classic()

novel_dims

novel_vars <- novel_ssp370 %>%
  filter(cell_type == "ocean") %>% 
  pivot_longer(c("decade.chl", "decade.oxy", "decade.pH", "decade.sst", "decade.si", "decade.zoo"), names_to="var", values_to="decade") %>% 
  mutate(decade = factor(decade, levels = decade_order)) %>%
  drop_na() %>% 
  ggplot(aes(x=as.factor(decade))) +
  geom_bar(aes(y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..]), color="black", fill="steelblue") + 
  labs(x="Decade", y="Ocean surface area") +
  facet_wrap(~var) +
  scale_y_continuous(labels=percent) +
  theme_classic()

novel_vars

novel_decade <- novel_ssp370 %>% 
  filter(cell_type == "ocean") %>% 
  filter(decade.novel != "Inf") %>% 
  ggplot(aes(x=as.factor(decade.novel))) +
  geom_bar(aes(y = (..count..)/sum(..count..)), color="black", fill="steelblue") + 
  scale_y_continuous(labels=percent) +
  labs(x="Emergence of novelty", y="Ocean surface area") +
  theme_classic()

novel_decade

dims_emerge <- ggarrange(novel_vars, novel_decade, labels=c("b", "c"), nrow=1)

# create spatial points data frame
spg <- novel_ssp370[c(1:2,12)]
coordinates(spg) <- ~ x + y
# coerce to SpatialPixelsDataFrame
gridded(spg) <- TRUE
# coerce to raster
rasterDF <- raster(spg)
rasterDF

mapTheme <- rasterTheme(region=rev(grDevices::heat.colors(100)))

plt <- levelplot(rasterDF, par.settings=mapTheme, at = seq(-1,6,by=1),
                 main = "Novel dimensions",
                 xlab = "", ylab = "",
                 colorkey=list(space="bottom"),
                 auto.key = list(title="Hellinger distance"),
                 margin = list(draw=FALSE),
                 xaxs="i", yaxs="i",
                 panel = function(...){
                   panel.levelplot(...)
                   panel.abline(h=0, col="grey")
                   panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                 },
                 scales = list(y=list(at=seq(-45,45,45)),
                               x=list(at=seq(90,270,90))
                 )
)

novel_dims_map <- plt + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) + 
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

ggarrange(novel_dims_map, dims_emerge, labels=c("a",""), nrow=2)

# now do no-pH
novel_ssp370$novel.dims.nopH <- apply(novel_ssp370[c(3,4,6:8)], 1, function(x) 5-sum(is.na(x)))

novel_dims <- novel_ssp370 %>% 
  filter(cell_type == "ocean") %>% 
  ggplot(aes(x=as.factor(novel.dims.nopH))) +
  geom_histogram(stat = "count", color="black", fill="steelblue", bins=7) +
  labs(x="Novel dimensions (Hellinger distance > 0.5)") +
  theme_classic()

novel_dims

novel_vars <- novel_ssp370 %>%
  filter(cell_type == "ocean") %>% 
  pivot_longer(c("decade.chl", "decade.oxy", "decade.sst", "decade.si", "decade.zoo"), names_to="var", values_to="decade") %>% 
  mutate(decade = factor(decade, levels = decade_order)) %>%
  drop_na() %>% 
  ggplot(aes(x=as.factor(decade))) +
  geom_bar(aes(y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..]), color="black", fill="steelblue") + 
  labs(x="Decade", y="Ocean surface area") +
  facet_wrap(~var) +
  scale_y_continuous(labels=percent) +
  theme_classic()

novel_vars

novel_decade <- novel_ssp370 %>% 
  filter(cell_type == "ocean") %>% 
  filter(decade.novel.nopH != "Inf") %>%
  ggplot(aes(x=as.factor(decade.novel.nopH))) +
  geom_bar(aes(y = (..count..)/sum(..count..)), color="black", fill="steelblue") + 
  scale_y_continuous(labels=percent) +
  labs(x="Emergence of novelty", y="Ocean surface area") +
  theme_classic()

novel_decade

dims_emerge <- ggarrange(novel_vars, novel_decade, labels=c("b", "c"), nrow=1)

# create spatial points data frame
spg <- novel_ssp370[c(1:2,14)]
coordinates(spg) <- ~ x + y
# coerce to SpatialPixelsDataFrame
gridded(spg) <- TRUE
# coerce to raster
rasterDF <- raster(spg)
rasterDF

plt <- levelplot(rasterDF, par.settings=mapTheme, at = seq(-1,5,by=1),
                 main = "Novel dimensions [no pH]",
                 xlab = "", ylab = "",
                 colorkey=list(space="bottom"),
                 auto.key = list(title="Hellinger distance"),
                 margin = list(draw=FALSE),
                 xaxs="i", yaxs="i",
                 panel = function(...){
                   panel.levelplot(...)
                   panel.abline(h=0, col="grey")
                   panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                 },
                 scales = list(y=list(at=seq(-45,45,45)),
                               x=list(at=seq(90,270,90))
                 )
)

novel_dims_map <- plt + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) + 
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

ggarrange(novel_dims_map, dims_emerge, labels=c("a",""), nrow=2)

##### ssp585 #####
novel_ssp585$novel.dims <- apply(novel_ssp585[3:8], 1, function(x) 6-sum(is.na(x)))
novel_ssp585$pct.cvr <- 1/64800

novel_dims <- novel_ssp585 %>% 
  filter(cell_type == "ocean") %>% 
  ggplot(aes(x=as.factor(novel.dims))) +
  geom_histogram(stat = "count", color="black", fill="steelblue", bins=7) +
  labs(x="Novel dimensions (Hellinger distance > 0.5)") +
  theme_classic()

novel_dims

novel_vars <- novel_ssp585 %>%
  filter(cell_type == "ocean") %>% 
  pivot_longer(c("decade.chl", "decade.oxy", "decade.pH", "decade.sst", "decade.si", "decade.zoo"), names_to="var", values_to="decade") %>% 
  mutate(decade = factor(decade, levels = decade_order)) %>%
  drop_na() %>% 
  ggplot(aes(x=as.factor(decade))) +
  geom_bar(aes(y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..]), color="black", fill="steelblue") + 
  labs(x="Decade", y="Ocean surface area") +
  facet_wrap(~var) +
  scale_y_continuous(labels=percent) +
  theme_classic()

novel_vars

novel_decade <- novel_ssp585 %>% 
  filter(cell_type == "ocean") %>% 
  filter(decade.novel != "Inf") %>% 
  ggplot(aes(x=as.factor(decade.novel))) +
  geom_bar(aes(y = (..count..)/sum(..count..)), color="black", fill="steelblue") + 
  scale_y_continuous(labels=percent) +
  labs(x="Emergence of novelty", y="Ocean surface area") +
  theme_classic()

novel_decade

dims_emerge <- ggarrange(novel_vars, novel_decade, labels=c("b", "c"), nrow=1)

# create spatial points data frame
spg <- novel_ssp585[c(1:2,12)]
coordinates(spg) <- ~ x + y
# coerce to SpatialPixelsDataFrame
gridded(spg) <- TRUE
# coerce to raster
rasterDF <- raster(spg)
rasterDF

mapTheme <- rasterTheme(region=rev(grDevices::heat.colors(100)))

plt <- levelplot(rasterDF, par.settings=mapTheme, at = seq(-1,6,by=1),
                 main = "Novel dimensions",
                 xlab = "", ylab = "",
                 colorkey=list(space="bottom"),
                 auto.key = list(title="Hellinger distance"),
                 margin = list(draw=FALSE),
                 xaxs="i", yaxs="i",
                 panel = function(...){
                   panel.levelplot(...)
                   panel.abline(h=0, col="grey")
                   panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                 },
                 scales = list(y=list(at=seq(-45,45,45)),
                               x=list(at=seq(90,270,90))
                 )
)

novel_dims_map <- plt + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) + 
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

ggarrange(novel_dims_map, dims_emerge, labels=c("a",""), nrow=2)

# now do no-pH
novel_ssp585$novel.dims.nopH <- apply(novel_ssp585[c(3,4,6:8)], 1, function(x) 5-sum(is.na(x)))

novel_dims <- novel_ssp585 %>% 
  filter(cell_type == "ocean") %>% 
  ggplot(aes(x=as.factor(novel.dims.nopH))) +
  geom_histogram(stat = "count", color="black", fill="steelblue", bins=7) +
  labs(x="Novel dimensions (Hellinger distance > 0.5)") +
  theme_classic()

novel_dims

novel_vars <- novel_ssp585 %>%
  filter(cell_type == "ocean") %>% 
  pivot_longer(c("decade.chl", "decade.oxy", "decade.sst", "decade.si", "decade.zoo"), names_to="var", values_to="decade") %>% 
  mutate(decade = factor(decade, levels = decade_order)) %>%
  drop_na() %>% 
  ggplot(aes(x=as.factor(decade))) +
  geom_bar(aes(y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..]), color="black", fill="steelblue") + 
  labs(x="Decade", y="Ocean surface area") +
  facet_wrap(~var) +
  scale_y_continuous(labels=percent) +
  theme_classic()

novel_vars

novel_decade <- novel_ssp585 %>% 
  filter(cell_type == "ocean") %>% 
  filter(decade.novel.nopH != "Inf") %>%
  ggplot(aes(x=as.factor(decade.novel.nopH))) +
  geom_bar(aes(y = (..count..)/sum(..count..)), color="black", fill="steelblue") + 
  scale_y_continuous(labels=percent) +
  labs(x="Emergence of novelty", y="Ocean surface area") +
  theme_classic()

novel_decade

dims_emerge <- ggarrange(novel_vars, novel_decade, labels=c("b", "c"), nrow=1)

# create spatial points data frame
spg <- novel_ssp585[c(1:2,14)]
coordinates(spg) <- ~ x + y
# coerce to SpatialPixelsDataFrame
gridded(spg) <- TRUE
# coerce to raster
rasterDF <- raster(spg)
rasterDF

plt <- levelplot(rasterDF, par.settings=mapTheme, at = seq(-1,5,by=1),
                 main = "Novel dimensions [no pH]",
                 xlab = "", ylab = "",
                 colorkey=list(space="bottom"),
                 auto.key = list(title="Hellinger distance"),
                 margin = list(draw=FALSE),
                 xaxs="i", yaxs="i",
                 panel = function(...){
                   panel.levelplot(...)
                   panel.abline(h=0, col="grey")
                   panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                 },
                 scales = list(y=list(at=seq(-45,45,45)),
                               x=list(at=seq(90,270,90))
                 )
)

novel_dims_map <- plt + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) + 
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

ggarrange(novel_dims_map, dims_emerge, labels=c("a",""), nrow=2)

##### Update Fig 4 #####
# add ssp column
novel_ssp245$ssp <- 'ssp245'
novel_ssp370$ssp <- 'ssp370'
novel_ssp585$ssp <- 'ssp585'

# add cell ID
novel_ssp245$cell_ID <- 1:64800
novel_ssp370$cell_ID <- 1:64800
novel_ssp585$cell_ID <- 1:64800

# merge gall of the ssp novel dfs
novel_all_ssp <- rbind(novel_ssp245, novel_ssp370, novel_ssp585)
novel_all_ssp <- transform(novel_all_ssp, 
                           decade.chl = as.numeric(decade.chl),
                           decade.oxy = as.numeric(decade.oxy),
                           decade.pH  = as.numeric(decade.pH),
                           decade.si  = as.numeric(decade.si),
                           decade.sst = as.numeric(decade.sst),
                           decade.zoo = as.numeric(decade.zoo),
                           decade.novel = as.numeric(decade.novel))

for (i in 1:nrow(novel_all_ssp)) {
  if(novel_all_ssp[i,11] == 'land')
    next
  novel_all_ssp[i,17] <- ifelse(novel_all_ssp[i,12] == 1, 
                                NA,
                                apply(novel_all_ssp[i,3:8], 1, function(x) (sort(x, na.last = NA))[2])
                                )
}

colnames(novel_all_ssp)[colnames(novel_all_ssp) == "V17"] <- "decade.emerge"

cols <- c("#D3D3D3", "#1B9E77", "#7570B3", "#D95F02")

novel_vars <- novel_all_ssp %>%
  filter(cell_type == "ocean") %>% 
  pivot_longer(c("decade.chl", "decade.oxy", "decade.pH", "decade.sst", "decade.si", "decade.zoo"), names_to="var", values_to="decade") %>% 
  mutate(decade = factor(decade, levels = decade_order)) %>%
  drop_na() %>% 
  ggplot(aes(x=as.factor(decade))) +
  geom_bar(aes(y = (..count..)/tapply(..count..,..PANEL..,sum)[..PANEL..], fill=ssp), color="black", position = "dodge2") + 
  labs(x="Decade", y="Ocean surface area") +
  facet_wrap(~var, scales = "free_y") +
  scale_y_continuous(labels=percent) +
  scale_fill_manual(values=cols[-1]) +
  theme_classic()

novel_vars

novel_decade <- novel_all_ssp %>% 
  filter(cell_type == "ocean") %>% 
  drop_na(decade.emerge) %>% 
  ggplot(aes(x=as.factor(decade.emerge))) +
  geom_bar(aes(y = (..count..)/sum(..count..), fill=ssp), color="black", position = "dodge2") + 
  scale_y_continuous(labels=percent) +
  scale_fill_manual(values=cols[-1]) +
  labs(x="Emergence of novelty", y="Ocean surface area") +
  theme_classic()

novel_decade

dims_emerge <- ggpubr::ggarrange(novel_vars, novel_decade, labels=c("D", "E"), nrow=2)
dims_emerge

# bring about 3 panel for maps
spg <- subset(novel_all_ssp, ssp == 'ssp245')
coordinates(spg) <- ~x+y
gridded(spg) <- TRUE

layer <- raster(spg[,10])

raster_245 <- brick(layer); rm(spg, layer)
plot(raster_245)

# SSP2-4.5
novel_245 <- levelplot(raster_245, par.settings=mapTheme, at = seq(-1,6,by=1),
                     main = "", xlab = "", ylab = "",
                     colorkey=list(space="right"),
                     auto.key = list(title = "Hellinger distance"),
                     margin = FALSE,
                     panel = function(...){
                       panel.levelplot(...)
                       panel.abline(h=0, col="grey")
                       panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                     },
                     scales = list(y=list(at=seq(-45,45,45)),
                                   x=list(at=seq(90,270,90)))
)

novel_245 <- novel_245 + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) +
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

# SSP3-7.0
spg <- subset(novel_all_ssp, ssp == 'ssp370')
coordinates(spg) <- ~x+y
gridded(spg) <- TRUE

layer <- raster(spg[,10])

raster_370 <- brick(layer); rm(spg, layer)
plot(raster_370)

novel_370 <- levelplot(raster_370, par.settings=mapTheme, at = seq(-1,6,by=1),
                     main = "", xlab = "", ylab = "",
                     colorkey=list(space="right"),
                     auto.key = list(title = "Hellinger distance"),
                     margin = FALSE,
                     panel = function(...){
                       panel.levelplot(...)
                       panel.abline(h=0, col="grey")
                       panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                     },
                     scales = list(y=list(at=seq(-45,45,45)),
                                   x=list(at=seq(90,270,90)))
)

novel_370 <- novel_370 + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) +
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

# SSP5-8.5
spg <- subset(novel_all_ssp, ssp == 'ssp585')
coordinates(spg) <- ~x+y
gridded(spg) <- TRUE

layer <- raster(spg[,10])

raster_585 <- brick(layer); rm(spg, layer)

novel_585 <- levelplot(raster_585, par.settings=mapTheme, at = seq(-1,6,by=1),
                     main = "", xlab = "", ylab = "",
                     colorkey=list(space="right"),
                     auto.key = list(title = "Hellinger distance"),
                     margin = FALSE,
                     panel = function(...){
                       panel.levelplot(...)
                       panel.abline(h=0, col="grey")
                       panel.abline(h=c(-23.4,23.4), col="grey", lty=2)
                     },
                     scales = list(y=list(at=seq(-45,45,45)),
                                   x=list(at=seq(90,270,90)))
)

novel_585 <- novel_585 + latticeExtra::layer(sp.lines(coastline, fill="lightgray")) +
  latticeExtra::layer(sp.polygons(vlmpa_spdf))

fig4_maps <- c(novel_245, novel_370, novel_585,
               layout = c(1,3), merge.legends=F)

ggpubr::ggarrange(fig4_maps, dims_emerge, labels=c("",""), ncol=2)

##### need to calculate EoN for each grid cell #####
# SSP2-4.5
for (i in 1:64800) {
  novel_ssp245$EoN[i] <- max(as.numeric(as.character(novel_ssp245$decade.novel[i])), 
                             as.numeric(as.character(novel_ssp245$decade.novel.nopH[i])), 
                             na.rm = TRUE)
  novel_ssp245$EoN[i] <- ifelse(novel_ssp245$novel.dims[i] < 2, NA, novel_ssp245$EoN[i])
}

sum(table(novel_ssp245$EoN)) / 43270

# SSP3-7.0
for (i in 1:64800) {
  novel_ssp370$EoN[i] <- max(as.numeric(as.character(novel_ssp370$decade.novel[i])), 
                             as.numeric(as.character(novel_ssp370$decade.novel.nopH[i])), 
                             na.rm = TRUE)
  novel_ssp370$EoN[i] <- ifelse(novel_ssp370$novel.dims[i] < 2, NA, novel_ssp370$EoN[i])
}

sum(table(novel_ssp370$EoN)) / 43270

# SSP5-8.5
for (i in 1:64800) {
  novel_ssp585$EoN[i] <- max(as.numeric(as.character(novel_ssp585$decade.novel[i])), 
                             as.numeric(as.character(novel_ssp585$decade.novel.nopH[i])), 
                             na.rm = TRUE)
  novel_ssp585$EoN[i] <- ifelse(novel_ssp585$novel.dims[i] < 2, NA, novel_ssp585$EoN[i])
}

sum(table(novel_ssp585$EoN)) / 43270
