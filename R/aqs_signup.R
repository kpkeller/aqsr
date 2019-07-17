##' @name aqs_signup
##' @title Sign up for AQS API
##' @description Submits a request to register email address and obtain key.
##' @param email Email address to register
##' @param ... Additional arguments passed to \code{\link{aqs_get}}
##' @details The AQS API requires an email address and key for all queries. The key is not used for authentication (as in a password), but it is used for identification.
##' The key value is emailed to the provided address, it is not return directly from the API.
##' @export
aqs_signup <- function(email,
                            ...){
    out <- aqs_get(service="signup",
                        endpoint=NULL,
                        aqs_user=list(username=email,
                                      key=NULL),
                        ...)
    out
}


