##' @name aqs_sampleData
##' @title Extract data from the AQS API
##' @param aqs_user User credentials. See \code{\link{aqs_signup}}
##' @param endpoint Endpoint for selecting data. Required variables vary by endpoint.
##' @param param Parameter code for which to extract data
##' @param bdate Begin date for data sample interval. Should be a string in format "YYYYMMDD"
##' @param edate End date for data sample interval. Should be a string in format "YYYYMMDD"
##' @param state Two-digit state code. Required when \code{endpoint} is one of \code{byState}, \code{byCounty}, \code{bySite}.
##' @param county Three-digit county code. Required when \code{endpoint} is \code{byCounty} or \code{bySite}.
##' @param site Three-digit site code. Required when \code{endpoint} is \code{bySite}.
##' @param cbsa Three-digit census-bureau statistical area (CBSA) code. Required when \code{endpoint} is \code{byCBSA}.
##' @param minlat Minimum latitude for the bounding box. Required when \code{endpoint} is \code{byBox}.
##' @param maxlat Maximum latitude for the bounding box. Required when \code{endpoint} is \code{byBox}.
##' @param minlon Minimum longitude for the bounding box. Required when \code{endpoint} is \code{byBox}.
##' @param maxlon Maximum longitude for the bounding box. Required when \code{endpoint} is \code{byBox}.
##' @param ... Additional arguments passed to \code{\link{aqs_get}}
##' @seealso \code{\link{aqs_get}}
##' @family Data Query Functions
##' @export
aqs_sampleData <- function(aqs_user,
                         endpoint=c("bySite",
                                    "byCounty",
                                    "byState",
                                    "byBox",
                                    "byCBSA"),
                         param,
                         bdate,
                         edate,
                         state=NULL,
                         county=NULL,
                         site=NULL,
                        cbsa=NULL,
                        minlat=NULL,
                        maxlat=NULL,
                        minlon=NULL,
                        maxlon=NULL,
                         ...){

    vars <- list(param=param,
                 bdate=bdate,
                 edate=edate,
                 state=state,
                 county=county,
                 site=site,
                 cbsa=cbsa,
                 minlat,
                 maxlat,
                 minlon,
                 maxlon)
    # Only pass needed variables
    vars <- vars[names(vars) %in% list_vars(endpoint=endpoint)]
    out <- aqs_get(service="sampleData",
                   endpoint=endpoint,
                   aqs_user=aqs_user,
                   vars=vars,
                   ...)
    out
}

##' @rdname aqs_sampleData
##' @export
aqs_sampleData_bySite <- function(aqs_user,
                                  param,
                                  bdate,
                                  edate,
                                  state,
                                  county,
                                  site,
                                  ...){
    out <- aqs_sampleData(aqs_user=aqs_user,
                 endpoint="bySite",
                 param=param,
            bdate=bdate,
            edate=edate,
            state=state,
            county=county,
            site=site,
                 ...)
    out
}


##' @rdname aqs_sampleData
##' @export
aqs_sampleData_byCounty <- function(aqs_user,
                                    param,
                                    bdate,
                                    edate,
                                    state,
                                    county,
                                    ...){
    out <- aqs_sampleData(aqs_user=aqs_user,
                          endpoint="byCounty",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          state=state,
                          county=county,
                          ...)
    out
}

##' @rdname aqs_sampleData
##' @export
aqs_sampleData_byState <- function(aqs_user,
                                   param,
                                   bdate,
                                   edate,
                                   state,
                                   ...){
    out <- aqs_sampleData(aqs_user=aqs_user,
                          endpoint="byState",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          state=state,
                          ...)
    out
}

##' @rdname aqs_sampleData
##' @export
aqs_sampleData_byCBSA <- function(aqs_user,
                                   param,
                                   bdate,
                                   edate,
                                   cbsa,
                                   ...){
    out <- aqs_sampleData(aqs_user=aqs_user,
                          endpoint="byCBSA",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          cbsa=cbsa,
                          ...)
    out
}




##' @name aqs_annualData
##' @title Extract annual average data data from the AQS API
##' @inheritParams aqs_get
##' @inheritParams aqs_sampleData
##' @param param Parameter code for which to extract data
##' @param bdate Begin date for data sample interval. Should be a string in format "YYYYMMDD"
##' @param edate End date for data sample interval. Should be a string in format "YYYYMMDD"
##' @param state Two-digit state code. Required when \code{endpoint} is one of \code{byState}, \code{byCounty}, \code{bySite}.
##' @seealso \code{\link{aqs_get}}
##' @family Data Query Functions
aqs_annualData <- function(aqs_user,
                           endpoint=c("bySite",
                                      "byCounty",
                                      "byState",
                                      "byBox",
                                      "byCBSA"),
                           param,
                           bdate,
                           edate,
                           state=NULL,
                           county=NULL,
                           site=NULL,
                           cbsa=NULL,
                           minlat=NULL,
                           maxlat=NULL,
                           minlon=NULL,
                           maxlon=NULL,
                           ...){

    vars <- list(param=param,
                 bdate=bdate,
                 edate=edate,
                 state=state,
                 county=county,
                 site=site,
                 cbsa=cbsa,
                 minlat,
                 maxlat,
                 minlon,
                 maxlon)
    # Only pass needed variables
    vars <- vars[names(vars) %in% list_vars(endpoint=endpoint)]
    out <- aqs_get(service="annualData",
                   endpoint=endpoint,
                   aqs_user=aqs_user,
                   vars=vars,
                   ...)
    out
}

##' @rdname aqs_annualData
##' @export
aqs_annualData_bySite <- function(aqs_user,
                                  param,
                                  bdate,
                                  edate,
                                  state,
                                  county,
                                  site,
                                  ...){
    out <- aqs_annualData(aqs_user=aqs_user,
                          endpoint="bySite",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          state=state,
                          county=county,
                          site=site,
                          ...)
    out
}


##' @rdname aqs_annualData
##' @export
aqs_annualData_byCounty <- function(aqs_user,
                                    param,
                                    bdate,
                                    edate,
                                    state,
                                    county,
                                    ...){
    out <- aqs_annualData(aqs_user=aqs_user,
                          endpoint="byCounty",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          state=state,
                          county=county,
                          ...)
    out
}

##' @rdname aqs_annualData
##' @export
aqs_annualData_byState <- function(aqs_user,
                                   param,
                                   bdate,
                                   edate,
                                   state,
                                   ...){
    out <- aqs_annualData(aqs_user=aqs_user,
                          endpoint="byState",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          state=state,
                          ...)
    out
}

##' @rdname aqs_annualData
##' @export
aqs_annualData_byCBSA <- function(aqs_user,
                                  param,
                                  bdate,
                                  edate,
                                  cbsa,
                                  ...){
    out <- aqs_annualData(aqs_user=aqs_user,
                          endpoint="byCBSA",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          cbsa=cbsa,
                          ...)
    out
}



##' @name aqs_dailyData
##' @title Extract daily average data data from the AQS API
##' @inheritParams aqs_get
##' @inheritParams aqs_sampleData
##' @param param Parameter code for which to extract data
##' @param bdate Begin date for data sample interval. Should be a string in format "YYYYMMDD"
##' @param edate End date for data sample interval. Should be a string in format "YYYYMMDD"
##' @param state Two-digit state code. Required when \code{endpoint} is one of \code{byState}, \code{byCounty}, \code{bySite}.
##' @seealso \code{\link{aqs_get}}
##' @family Data Query Functions
aqs_dailyData <- function(aqs_user,
                           endpoint=c("bySite",
                                      "byCounty",
                                      "byState",
                                      "byBox",
                                      "byCBSA"),
                           param,
                           bdate,
                           edate,
                           state=NULL,
                           county=NULL,
                           site=NULL,
                           cbsa=NULL,
                           minlat=NULL,
                           maxlat=NULL,
                           minlon=NULL,
                           maxlon=NULL,
                           ...){

    vars <- list(param=param,
                 bdate=bdate,
                 edate=edate,
                 state=state,
                 county=county,
                 site=site,
                 cbsa=cbsa,
                 minlat,
                 maxlat,
                 minlon,
                 maxlon)
    # Only pass needed variables
    vars <- vars[names(vars) %in% list_vars(endpoint=endpoint)]
    out <- aqs_get(service="dailyData",
                   endpoint=endpoint,
                   aqs_user=aqs_user,
                   vars=vars,
                   ...)
    out
}

##' @rdname aqs_dailyData
##' @export
aqs_dailyData_bySite <- function(aqs_user,
                                  param,
                                  bdate,
                                  edate,
                                  state,
                                  county,
                                  site,
                                  ...){
    out <- aqs_dailyData(aqs_user=aqs_user,
                          endpoint="bySite",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          state=state,
                          county=county,
                          site=site,
                          ...)
    out
}


##' @rdname aqs_dailyData
##' @export
aqs_dailyData_byCounty <- function(aqs_user,
                                    param,
                                    bdate,
                                    edate,
                                    state,
                                    county,
                                    ...){
    out <- aqs_dailyData(aqs_user=aqs_user,
                          endpoint="byCounty",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          state=state,
                          county=county,
                          ...)
    out
}

##' @rdname aqs_dailyData
##' @export
aqs_dailyData_byState <- function(aqs_user,
                                   param,
                                   bdate,
                                   edate,
                                   state,
                                   ...){
    out <- aqs_dailyData(aqs_user=aqs_user,
                          endpoint="byState",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          state=state,
                          ...)
    out
}

##' @rdname aqs_dailyData
##' @export
aqs_dailyData_byCBSA <- function(aqs_user,
                                  param,
                                  bdate,
                                  edate,
                                  cbsa,
                                  ...){
    out <- aqs_dailyData(aqs_user=aqs_user,
                          endpoint="byCBSA",
                          param=param,
                          bdate=bdate,
                          edate=edate,
                          cbsa=cbsa,
                          ...)
    out
}



