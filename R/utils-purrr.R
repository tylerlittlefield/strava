# src: https://github.com/hrbrmstr/include-in-pkgs
map <- function(.x, .f, ...) {
  if (inherits(.f, "formula")) {
    .body <- dimnames(attr(terms(.f), "factors"))[[1]]
    .f <- function(.x, .=.x) {}
    body(.f) <- as.expression(parse(text=.body))
  }

  if (inherits(.f, "function")) {
    lapply(.x, .f, ...)
  } else if (is.numeric(.f)) {
    lapply(.x, `[`, .f)
  }
}
