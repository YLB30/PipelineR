#' Split tickers into small batches to avoid API overload.
#'
#' Divise un vecteur de tickers en lots de taille maximale spécifiée.
#' Les derniers lots peuvent être plus petits si nécessaire.
#'
#' @param tickers Un vecteur de caractères contenant les tickers (ou tout vecteur).
#' @param batch_size Taille maximale de chaque lot (par défaut 50).
#'
#' @return Une liste de vecteurs, chaque élément étant un lot de tickers.
#' @export
#'
#' @examples
#' tickers <- c("AAPL", "GOOG", "MSFT", "TSLA", "AMZN", "META")
#' batches <- split_batch(tickers, batch_size = 2)
#' batches
split_batch <- function(tickers, batch_size = 50) {
  if (length(tickers) == 0) return(list())

  n <- length(tickers)
  n_batches <- ceiling(n / batch_size)

  split(tickers, ceiling(seq_along(tickers) / batch_size))
}
