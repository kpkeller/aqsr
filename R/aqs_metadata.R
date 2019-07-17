##' @name aqs_metadata
##' @title Query metadata functions in AQS API
##' @inheritParams aqs_get
##' @param ... Additional arguments passed to \code{\link{aqs_get}}.
##' @seealso \code{\link{aqs_get}} \code{\link{list_services}}
aqs_metadata <- function(aqs_user,
                     endpoint=c("isAvailable", "fieldsByService"),
                     ...){
    endpoint <- endpoint[[1]]
    out <- aqs_get(service="metaData",
                   endpoint=endpoint,
                    aqs_user=aqs_user,
                            ...)
    out
}

##' @rdname aqs_metadata
##' @export
aqs_isAvailable <- function(aqs_user){
    aqs_metadata(aqs_user=aqs_user,
                 endpoint="isAvailable")
}

##' @rdname aqs_metadata
##' @export
aqs_fieldsByService <- function(aqs_user,
                                service=c("fieldsByService ", "list", "sampleData","monitors","sampleData", "dailyData", "annualData", "qaBlanks", "qaCollocated", "qaFlowRateVerifications", "qaFlowRateAudits", "qaOnePointQcRawData", "qaPepAudits"),
                                ...){
    service <- match.arg(service)
    aqs_metadata(aqs_user=aqs_user,
                 endpoint="fieldsByService",
                 vars=list(service=service),
                 ...)
}
