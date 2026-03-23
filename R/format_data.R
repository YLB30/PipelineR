#' Reshape Yahoo data into long format (for database insertion).
#'
#' Transforme un tibble tidyquant (stock.prices) en format long :
#' colonnes symbol, date, open, high, low, close, volume, adjusted.
#'
#' @param data Tibble issu de tq_get(x, get = "stock.prices").
#' @return Tibble en format long, trié par symbol et date.
#' @examples
#' library(tidyquant)
#' data <- tq_get("AAPL", get = "stock.prices")
#' long_data <- format_data(data)
#' head(long_data)
#'
#' @export
format_data <- function(data) {
  if (!requireNamespace("tidyquant", quietly = TRUE) ||
      !requireNamespace("dplyr", quietly = TRUE) ||
      !requireNamespace("tidyr", quietly = TRUE)) {
    stop("Packages tidyquant, dplyr et tidyr requis.")
  }

  required_cols <- c("symbol", "date", "open", "high", "low", "close",
                     "volume", "adjusted")

  if (!all(required_cols %in% names(data))) {
    stop("data doit contenir les colonnes : ", paste(required_cols, collapse = ", "))
  }

  data %>%
    select(all_of(required_cols)) %>%
    arrange(symbol, date) %>%
    mutate(
      date = as.Date(date),
      across(c(open, high, low, close, adjusted, volume), as.numeric)
    )
}
