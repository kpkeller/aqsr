context("test-sample-dates")

test_that("incorrect 'edate' fails", {
    expect_error(aqs_sampleData(edate="01", bdate="20000101"), "string of length 8")
    expect_error(aqs_sampleData(edate="today", bdate="20000101"), "string of length 8")
    expect_error(aqs_sampleData(edate="2000-01-01", bdate="20000101"), "string of length 8")
    expect_error(aqs_sampleData(edate=20000101, bdate="20000101"), "string of length 8")

})

test_that("short 'bdate' fails", {
    expect_error(aqs_sampleData(edate="20000101", bdate="01"), "string of length 8")
})


test_that("bdate after edate fails", {
    expect_error(aqs_sampleData(edate="19990101", bdate="20000101"), "same as or prior to 'edate'")
})
