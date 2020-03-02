##' @name aqs_list
##' @title List available services by endpoint
##' @inheritParams aqs_get
##' @param ... Additional arguments passed to \code{\link{aqs_get}}.
##' @seealso aqs_get list_services
##' @export
aqs_list <- function(aqs_user,
                     endpoint=c("states",
                                "countiesByState",
                                "sitesByCounty",
                                "cbsas",
                                "classes",
                                "parametersByClass",
                                "pqaos",
                                "mas"),
                     vars=NULL,
                     ...){
        out <- aqs_get(service="list",
                            endpoint=endpoint,
                            aqs_user=aqs_user,
                            vars=vars,
                            ...)
    out
}


##' @rdname aqs_list
##' @export
aqs_list_states <- function(aqs_user,
                            ...){
    aqs_list(aqs_user,
             endpoint="states",
             ...)
}


##' @rdname aqs_list
##' @inheritParams aqs_sampleData
##' @export
aqs_list_counties <- function(aqs_user,
                              state,
                            ...){
    aqs_list(aqs_user,
             endpoint="countiesByState",
             vars=list(state=state),
             ...)
}



##' @rdname aqs_list
##' @inheritParams aqs_sampleData
##' @export
aqs_list_sites <- function(aqs_user,
                              state,
                           county,
                              ...){
    aqs_list(aqs_user,
             endpoint="sitesByCounty",
             vars=list(state=state,
                       county=county),
             ...)
}
##' @rdname aqs_list
##' @inheritParams aqs_sampleData
##' @export
aqs_list_classes <- function(aqs_user,
                           ...){
    aqs_list(aqs_user,
             endpoint="classes",
             ...)
}


##' @rdname aqs_list
##' @inheritParams aqs_sampleData
##' @param pc Parameter class, for use when \code{endpoint} is \code{parametersByClass}
##' @export
aqs_list_parameters <- function(aqs_user,
                           pc,
                           ...){
    aqs_list(aqs_user,
             endpoint="parametersByClass",
             vars=list(pc=pc),
             ...)
}
