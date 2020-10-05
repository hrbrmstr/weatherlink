httr::user_agent(
  sprintf(
    "weatherlink R package v%s: (<%s>)",
    utils::packageVersion("weatherlink"),
    utils::packageDescription("weatherlink")$URL
  )
) -> .WEATHERLINK_UA