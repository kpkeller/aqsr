# aqsr
R Package for Accessing EPA AQS data

This package provides an R interface for the EPA Air Quality System (AQS) API. Information about the API, including Terms of Service, is available at https://aqs.epa.gov/aqsweb/documents/data_api.html.


### Creating a User Key

The AQS API requires an email address and key for all queries. The key is not used for authentication (as in a password), but it is used for identification. Sign-up using the `aqs_signup()` function, and your key phrase will be emailed.

Once an email address and key are registered, assign them to a list in the working environment using `create_user()`. For example:
```
my_user <- create_user(email="myemail@mydomain",
                    key="mykeyhere")
```
All functions for requesting data from the API require that this be provided in the `aqs_user` argument.

### Requesting Data

The primary function for requesting measurements stored in the AQS database is `aqs_sampleData()`. Information on parameter codes and required input for defining data requests can be obtained from the API using `aqs_list()`.
