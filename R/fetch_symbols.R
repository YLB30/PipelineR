#' Fetch S&P 500 symbols information
#'
#' Retrieves all rows from the `sp500.info` table in the database and returns
#' them as a data frame.
#'
#' @return A data frame containing all columns from `sp500.info`.
#'
#' @details
#' This function opens a database connection with `connect_db()`, queries the
#' `sp500.info` table, and closes the connection automatically with
#' `on.exit()`.
#'
#' @examples
#' \dontrun{
#' fetch_symbols()
#' }
#'
#' @export
fetch_symbols <- function() {
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con), add = TRUE)

  DBI::dbGetQuery(con, "SELECT * FROM sp500.info;")
}
