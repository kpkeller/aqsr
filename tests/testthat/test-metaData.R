test_that("metaData works", {
    expect_s3_class(aqs_get(aqs_user=list(email="test@aqs.api",
                          key="test"),
            endpoint = "issues",
            service="metaData"),
            "data.frame")
})
