
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![R-CMD-check](https://github.com/hrbrmstr/weatherlink/workflows/R-CMD-check/badge.svg)](https://github.com/hrbrmstr/weatherlink/actions?query=workflow%3AR-CMD-check)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/weatherlink.svg?branch=batman)](https://travis-ci.org/hrbrmstr/weatherlink)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.6.0-blue.svg)
![License](https://img.shields.io/badge/License-AGPL-blue.svg)

# weatherlink

Query and Orchestrate the Davis WeatherLink API

## Description

Davis Instruments provides a public API
(<https://weatherlink.github.io/v2-api/>) for owners and users of their
weather datalogger products. Tools are provided to query and orchestrate
the Davis WeatherLink API (V2).

## What’s Inside The Tin

The following functions are implemented:

  - `wl_conditions`: Get current conditions data for one station
  - `wl_nodes`: Get all nodes attached to all weather stations
    associated with your API Key
  - `wl_sensor_activity`: Get latest reporting times for all sensors
    attached to all weather stations associated with your API Key
  - `wl_sensors`: Get a catalog of all types of sensors
  - `wl_stations`: Get all weather stations associated with your API Key

## TODO

Add coverage for the following API endpoints:

  - `/stations/{station-ids}`
  - `/nodes/{node-ids}`
  - `/sensors/{sensor-ids}`
  - `/sensor-activity/{sensor-ids}`

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/weatherlink.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/weatherlink")
# or
remotes::install_bitbucket("hrbrmstr/weatherlink")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(weatherlink)

# current version
packageVersion("weatherlink")
## [1] '0.1.0'
```

## weatherlink Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |       10 | 0.42 | 179 | 0.43 |          66 | 0.38 |      101 | 0.37 |
| YAML |        1 | 0.04 |  22 | 0.05 |           2 | 0.01 |        2 | 0.01 |
| Rmd  |        1 | 0.04 |   8 | 0.02 |          18 | 0.10 |       34 | 0.12 |
| SUM  |       12 | 0.50 | 209 | 0.50 |          86 | 0.50 |      137 | 0.50 |

clock Package Metrics for weatherlink

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
