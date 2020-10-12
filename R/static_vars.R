# Static values

base_url <- "https://aqs.epa.gov/data/api/"

test_user <- list(username="test@aqs.api",
                  key="test")


##' @name list_services
##' @title List of Services and Endpoints for AQS API
##' @return A list containing the possible services or the possible endpoints for a specified service
##' @seealso aqs_list
##' @export
list_services <- function(){
    c("signup",
      "metaData",
      "list",
      "monitors",
      "sampleData",
      "dailyData",
      "annualData",
      "qaBlanks",
      "qaCollocated",
      "qaFlowRateVerifications",
      "qaFlowRateAudits",
      "qaOnePointQcRawData",
      "qaPepAudits")

}



##' @name list_endpoints
##' @rdname list_services
##' @param service Service for which endpoints should be returned. A value of NULL returns a list with all services.
##' @export
list_endpoints <- function(service=NULL){
    endpoints <- list(signup=NULL,
                      metaData=c("isAvailable",
                                 "revisionHistory",
                                 "issues",
                                 "fieldsByService"),
                      list=c("states",
                             "countiesByState",
                             "sitesByCounty",
                             "cbsas",
                             "classes",
                             "parametersByClass",
                             "pqaos",
                             "mas"),
                      sampleData=c("bySite",
                                   "byCounty",
                                   "byState",
                                   "byBox",
                                   "byCBSA"),
                      dailyData=c("bySite",
                                  "byCounty",
                                  "byState",
                                  "byBox",
                                  "byCBSA"),
                      annualData=c("bySite",
                                   "byCounty",
                                   "byState",
                                   "byBox",
                                   "byCBSA"),
                      qaBlanks=c("bySite",
                                 "byCounty",
                                 "byState",
                                 "byPQAO",
                                 "byMA"),
                      qaCollocated=c("bySite",
                                     "byCounty",
                                     "byState",
                                     "byPQAO",
                                     "byMA"),
                      qaFlowRateVerifications=c("bySite",
                                                "byCounty",
                                                "byState",
                                                "byPQAO",
                                                "byMA"),
                      qaFlowRateAudits=c("bySite",
                                         "byCounty",
                                         "byState",
                                         "byPQAO",
                                         "byMA"),
                      qaOnePointQcRawData=c("bySite",
                                            "byCounty",
                                            "byState",
                                            "byPQAO",
                                            "byMA"),
                      qaPepAudits=c("bySite",
                                    "byCounty",
                                    "byState",
                                    "byPQAO",
                                    "byMA"))
    if (is.null(service)){
      return(endpoints)
    } else {
      if (length(service)>1) stop("'service' should have length 1.")
      service <- match.arg(service, names(endpoints))
      return(endpoints[[service]])
    }
}


##' @name list_required_vars
##' @rdname list_services
##' @param endpoint Endpoint for which variables should be returned. A value of NULL returns a list with all services.
##' @export
list_required_vars <- function(endpoint=NULL){

  vars <- list(isAvailable=NULL,
               issues=NULL,
               revisionHistory=NULL,
               fieldsByService=c("service"),
               states=NULL,
               countiesByState=c("state"),
               sitesByCounty=c("state",
                               "county"),
               cbsas=NULL,
               classes=NULL,
               parametersByClass=c("pc"),
               pqaos=NULL,
               mas=NULL,
               bySite=c("param",
                        "bdate",
                        "edate",
                        "state",
                        "county",
                        "site"),
               byCounty=c("param",
                          "bdate",
                          "edate",
                          "state",
                          "county"),
               byState=c("param",
                         "bdate",
                         "edate",
                         "state"),
               byBox=c("param",
                       "bdate",
                       "edate",
                       "minlat",
                       "maxlat",
                       "minlon",
                       "maxlon"),
               byCBSA=c("param",
                        "bdate",
                        "edate",
                        "cbsa"),
               byPQAO=c("param",
                        "bdate",
                        "edate",
                        "pqao"),
               byMA=c("param",
                      "bdate",
                      "edate",
                      "ma"))
  if (is.null(endpoint)){
    return(vars)
  } else {
    if (length(endpoint)>1) stop("'service' should have length 1.")
    endpoint <- match.arg(endpoint, names(vars))
    return(vars[[endpoint]])
  }
}


##' @name list_optional_vars
##' @rdname list_services
##' @param endpoint Endpoint for which variables should be returned. A value of NULL returns a list with all services.
##' @export
list_optional_vars <- function(endpoint=NULL){

  vars <- list(isAvailable=NULL,
               issues=NULL,
               revisionHistory=NULL,
               fieldsByService=NULL,
               states=NULL,
               countiesByState=NULL,
               sitesByCounty=NULL,
               cbsas=NULL,
               classes=NULL,
               parametersByClass=NULL,
               pqaos=NULL,
               mas=NULL,
               bySite=c("cbdate",
                        "cedate"),
               byCounty=c("cbdate",
                          "cedate"),
               byState=c("cbdate",
                         "cedate"),
               byBox=c("cbdate",
                       "cedate"),
               byCBSA=c("cbdate",
                        "cedate"),
               byPQAO=c("cbdate",
                        "cedate"),
               byMA=c("cbdate",
                      "cedate"))
  if (is.null(endpoint)){
    return(vars)
  } else {
    if (length(endpoint)>1) stop("'service' should have length 1.")
    endpoint <- match.arg(endpoint, names(vars))
    return(vars[[endpoint]])
  }
}
