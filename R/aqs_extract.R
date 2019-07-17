
# Extract list of data from JSON object
##' @name aqs_extract_data
##' @title Extract AQS data from JSON object
##' @param r Response object
##' @return A data frame
##' @export
##' @seealso \code{\link{aqs_get}}
aqs_extract_data <- function(r){
    d <- content(r, "parsed")$Data
    d <- lapply(d, nullFill)
    do.call(rbind.data.frame, d)
}

nullFill <- function(x) lapply(x, function(w) if(is.null(w)){ NA} else {w})
