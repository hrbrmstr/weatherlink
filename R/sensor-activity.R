#' Get latest reporting times for all sensors attached to all weather stations associated with your API Key
#'
#' Returns the most recent times data was uploaded for all sensors associated with the api key that was passed. T
#'
#' @param api_key,api_secret WeatherLink API (V2) key/secret. Generate & retrieve them from
#'        [your account page](https://www.weatherlink.com/account). Automagically retrieved from
#'        `WEATHERLINK_API_KEY` and `WEATHERLINK_API_SECRET` environment variables.
#' @return data frame with a `generated_at` attribute
#' @references [API Endpoint](https://weatherlink.github.io/v2-api/api-reference);
#'   [Data structure types](https://weatherlink.github.io/v2-api/data-structure-types)
#' @export
wl_sensor_activity <- function(api_key = Sys.getenv("WEATHERLINK_API_KEY"),
                               api_secret = Sys.getenv("WEATHERLINK_API_SECRET")) {

  list(
    `api-key` = api_key,
    `t` = as.character(as.integer(Sys.time()))
  ) -> params

  digest::hmac(
    key = api_secret,
    object = paste(names(params), as.character(params), sep = "", collapse = ""),
    algo = "sha256"
  ) -> params[["api-signature"]]

  httr::GET(
    url = "https://api.weatherlink.com/v2/sensor-activity",
    query = params,
    .WEATHERLINK_UA
  ) -> res

  httr::stop_for_status(res)

  res <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(res)

  attr(out$sensor_activity, "generated_at") <- anytime::anytime(out$generated_at)

  out$sensor_activity$time_received <- anytime::anytime(out$sensor_activity$time_received)
  out$sensor_activity$time_recorded <- anytime::anytime(out$sensor_activity$time_recorded)

  invisible(out$sensor_activity)

}