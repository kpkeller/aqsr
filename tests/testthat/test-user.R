context("test-user")


test_that("missing user fails aqs_list", {
    expect_error(aqs_list(endpoint="states",
             run=FALSE), "User info required.")
})
test_that("missing user fails aqs_list_states", {
    expect_error(aqs_list_states(
                          run=FALSE))
})
