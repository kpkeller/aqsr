##' @name create_user
##' @title Create user-key object for accessing AQS API
##' @param email Email address of user
##' @param key Key phrase of user
##' @details The AQS API requires an email address and key for all queries. The key is not used for authentication (as in a password), but it is used for identification.
##' @details The email and key can be stored as environment variables as AQS_EMAIL and AQS_KEY, respectively, rather than specified as function arguments.
##' @return \code{create_user} returns a list containing the email and key.
##' @seealso \code{\link{aqs_get}}
##' @export
create_user <- function(email,
                        key) {
    if(missing(email)) {
        email <- Sys.getenv("AQS_EMAIL")
        if(!nzchar(email))
            stop("need AQS email address identifier")
        key <- Sys.getenv("AQS_KEY")
        if(!nzchar(key))
            stop("need AQS key")
    }
    list(email=email,
         key=key)
}



##' @rdname create_user
##' @param ... Additional arguments passed to \code{\link{aqs_get}}
##' @details
##' Use \code{aqs_signup} to register an email and obtain a key phrase. The key value is emailed to the provided address, it is not return directly from the API.
##' @export
aqs_signup <- function(email,
                       ...){
    out <- aqs_get(service="signup",
                   endpoint=NULL,
                   aqs_user=list(email=email,
                                 key=NULL),
                   ...)
    out
}
