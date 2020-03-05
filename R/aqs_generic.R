# General functions for communicating with API
# and checking responses

# Send query to AQS API
##' @name aqs_get
##' @title Get data from query to AQS API
##' @param url URL for API request. If provided, all other arguments except \code{run} are ignored. Intended primarily for use with URLs constructed by an earlier call to \code{aqs_get} with \code{run=FALSE}.
##' @param service API service for which data are requested. See \code{\link{list_services}}
##' @param endpoint Service endpoint
##' @param aqs_user User information in the form of a list with \code{email} and \code{key}. See \code{\link{create_user}}.
##' @param vars List of variables for the endpoint request. See \code{\link{list_vars}}.
##' @param run Logical indicating whether request should be submitted (\code{TRUE}, default), or only the query URL returned (\code{FALSE}).
##' @param rawResponse Logical indicating that JSON response should be returned directly without checking or formatting. Used primarily in debugging.
##' @importFrom httr modify_url GET
##' @seealso \code{\link{aqs_sampleData}} \code{\link{aqs_list}} \code{\link{create_user}}
##' @export
aqs_get <- function(url=NULL,
                    service,
                    endpoint,
                    aqs_user,
                    vars=NULL,
                    run=TRUE,
                    rawResponse=FALSE){
    if (!is.null(url)){
        call_url <- url
    } else {
    if (missing(aqs_user)) stop("User info required. Please provide your credentials (see 'create_user()'")
    if (service!="signup") checkUser(aqs_user)

    checkService(service)
    checkEndpoint(service, endpoint)
    if (!is.null(endpoint)) checkVars(endpoint, vars)

    query_list <- list(email=aqs_user$email,
                       key=aqs_user$key)
    query_list <- c(query_list,
                    vars)

    call_url <- httr::modify_url(url=base_url,
                           path=paste0("data/api/",
                                       service,
                                       ifelse(!is.null(endpoint),
                                              paste0("/",endpoint), "")),
                           query=query_list)
    }
    if (run){
        out <- httr::GET(call_url)
        if (!rawResponse){
            check_response(out)
            out <- aqs_extract_data(out)
            # out <- out
        }
    } else {
        out <- call_url
    }
    out
}

##' @importFrom httr http_type http_error content status_code
##' @importFrom jsonlite fromJSON
check_response <- function(obj){
    # Adapted from https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html
    if (httr::http_type(obj) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    parsed <- jsonlite::fromJSON(httr::content(obj, "text"), simplifyVector = FALSE)

    if (httr::http_error(obj)) {
        stop(
            sprintf(
                "AQS API request failed [%s]\n%s\n",
                httr::status_code(obj),
                parsed
            ),
            call. = FALSE
        )
    }
}


# Checks user object
checkUser <- function(usr){
    email <- usr$email
    key <- usr$key
    if (is.null(email)){
        stop("User email address is missing.")
    }
    if (is.null(key)){
        stop("User key is missing.")
    }
    1
}


checkService <- function(service){
    ismatch <- pmatch(service,  list_services(), nomatch=0)
    if (!ismatch){
        stop(paste0("Service '", service, "' is not in the list of accepted services. See list_services()."))
    }
    return(TRUE)
}


checkEndpoint <- function(service, endpoint){
    possible_endpoints <- list_endpoints(service)
    if (is.null(possible_endpoints)){
        if (is.null(endpoint)){
            return(TRUE)
        } else {
            ismatch <- FALSE
        }
    } else {
        ismatch <- match(endpoint,  possible_endpoints, nomatch=0)
    }
    if (!ismatch){
        stop(paste0("Endpoint '", endpoint, "' is not in the list of accepted endpoints for service ", service, ". See list_endpoints()."))
    }
    return(TRUE)
}

# Need to match all variables here, not just one
checkVars <- function(endpoint, vars){
    current_vars <- list_vars(endpoint)
    if (is.null(current_vars) & (missing(vars) || is.null(vars))){
        return(TRUE)
    }
    # Check that needed vars are provided
    for (i in seq_along(current_vars)){
        ismatch <- match(current_vars[i],  names(vars), nomatch=0)
        if (!ismatch){
            stop(paste0("Variable '", current_vars[i], "' is required for endpoint ", endpoint, ". See list_vars()."))
        }
    }
    p <- length(vars)
    # Check that provided vars are acceptable
    for (i in 1:p){
        ismatch <- match(names(vars)[i],  current_vars, nomatch=0)
        if (!ismatch){
            stop(paste0("Variable '", names(vars)[i], "' is not in the list of required variables for endpoint ", endpoint, ". See list_vars()."))
        }
    }

return(TRUE)

}


