#' Count the number of matches in a string.
#'
#' Vectorised over \code{string} and \code{pattern}, shorter is recycled to
#' same length as longest.
#'
#' @inheritParams str_detect
#' @keywords character
#' @return integer vector
#' @seealso
#'  \code{\link[stringi]{stri_count}} which this function wraps.
#'
#'  \code{\link{str_locate}}/\code{\link{str_locate_all}} to locate position
#'  of matches
#'
#' @export
#' @examples
#' fruit <- c("apple", "banana", "pear", "pineapple")
#' str_count(fruit, "a")
#' str_count(fruit, "p")
#' str_count(fruit, "e")
#' str_count(fruit, c("a", "b", "p", "p"))
#'
#' str_count(c("a.", "...", ".a.a"), ".")
#' str_count(c("a.", "...", ".a.a"), fixed("."))
str_count <- function(string, pattern) {
  switch(type(pattern),
    fixed = stri_count_fixed(string, pattern),
    coll  = stri_count_coll(string, pattern, attr(pattern, "options")),
    regex = stri_count_regex(string, pattern, attr(pattern, "options")),
  )
}