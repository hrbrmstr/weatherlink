#' Get historic conditions data for one station
#'
#' Returns historic conditions data for a weather station selected by a station ID.
#'
#' @param station_id (chr) Station id
#' @param api_key,api_secret WeatherLink API (V2) key/secret. Generate & retrieve them from
#'        [your account page](https://www.weatherlink.com/account). Automagically retrieved from
#'        `WEATHERLINK_API_KEY` and `WEATHERLINK_API_SECRET` environment variables.
#' @return list ith a `generated_at` attribute
#' @references [API Endpoint](https://weatherlink.github.io/v2-api/api-reference);
#'   [Data structure types](https://weatherlink.github.io/v2-api/data-structure-types)
#' @export
wl_historic_conditions <- function(station_id,
                          api_key = Sys.getenv("WEATHERLINK_API_KEY"),
                          api_secret = Sys.getenv("WEATHERLINK_API_SECRET")) {

  list(
    `api-key` = api_key,
    `station-id` = station_id[1],
    `t` = as.character(as.integer(Sys.time()))
  ) -> params

  digest::hmac(
    key = api_secret,
    object = paste(names(params), as.character(params), sep = "", collapse = ""),
    algo = "sha256"
  ) -> params[["api-signature"]]

  httr::GET(
    url = sprintf("https://api.weatherlink.com/v2/historic/%s", as.character(station_id[1])),
    query = list(
      `api-key` = api_key,
      `t` = as.character(as.integer(Sys.time())),
      `api-signature` = params[["api-signature"]]
    ),
    .WEATHERLINK_UA
  ) -> res

  httr::stop_for_status(res)

  res <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(res)

  attr(out$sensors, "generated_at") <- anytime::anytime(out$generated_at)

  invisible(out$sensors)

}