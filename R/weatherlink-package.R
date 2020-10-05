#' Query and Orchestrate the Davis WeatherLink API
#'
#' Davis Instruments provides a public API (<https://weatherlink.github.io/v2-api/>)
#' for owners and users of their weather datalogger products. Tools are provided to query
#' and orchestrate the Davis WeatherLink API (V2)
#'
#' @md
#' @name weatherlink
#' @references [API Endpoint](https://weatherlink.github.io/v2-api/api-reference);
#'   [Data structure types](https://weatherlink.github.io/v2-api/data-structure-types)
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @import httr
#' @importFrom digest hmac
#' @importFrom anytime anytime
#' @importFrom jsonlite fromJSON
"_PACKAGE"
