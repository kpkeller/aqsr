context("test-service_checks")

test_that("incorrect service fails", {
    expect_error(checkService("qa"), "Service ")
    expect_error(checkService("dailydata"), "Service ")
    expect_error(checkService("sign up"), "Service ")
    expect_true(checkService("annualData"))
})

context("test-variable-checks")

test_that("incorrect service fails", {
    expect_error(checkVars(), "missing")
    expect_true(checkVars("cbsas"))
    expect_error(checkVars("bySite", "siteid"), "param")
    expect_error(checkVars("bySite", "param"), "param")
    expect_error(checkVars("bySite", vars=list(param=30)), "bdate")

})
