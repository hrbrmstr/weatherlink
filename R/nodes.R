#' Get all nodes attached to all weather stations associated with your API Key
#'
#' Returns data for all nodes attached to all gateways associated with the API Key passed in the query parameters.
#' Currently all nodes are returned in a single response. A future enhancement will provide pagination to reduce
#' the size of the response.
#'
#' @param api_key,api_secret WeatherLink API (V2) key/secret. Generate & retrieve them from
#'        [your account page](https://www.weatherlink.com/account). Automagically retrieved from
#'        `WEATHERLINK_API_KEY` and `WEATHERLINK_API_SECRET` environment variables.
#' @return data frame with a `generated_at` attribute
#' @references [API Endpoint](https://weatherlink.github.io/v2-api/api-reference);
#'   [Data structure types](https://weatherlink.github.io/v2-api/data-structure-types)
#' @export
wl_nodes <- function(api_key = Sys.getenv("WEATHERLINK_API_KEY"),
                     api_secret = Sys.getenv("WEATHERLINK_API_SECRET")) {

  list(
    `api-key` = Sys.getenv("WEATHERLINK_API_KEY"),
    `t` = as.character(as.integer(Sys.time()))
  ) -> params

  digest::hmac(
    key = Sys.getenv("WEATHERLINK_API_SECRET"),
    object = paste(names(params), as.character(params), sep = "", collapse = ""),
    algo = "sha256"
  ) -> params[["api-signature"]]

  httr::GET(
    url = "https://api.weatherlink.com/v2/nodes",
    query = params,
    .WEATHERLINK_UA
  ) -> res

  httr::stop_for_status(res)

  res <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(res)

  attr(out$nodes, "generated_at") <- anytime::anytime(out$generated_at)

  invisible(out$nodes)

}