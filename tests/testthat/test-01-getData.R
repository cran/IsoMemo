test_that("getData() actually retrieves all data", {
  df <- getData()
  expect_match(levels(df$source)[1],"14CSea")
  expect_match(levels(df$source)[2],"CIMA")
  expect_match(levels(df$source)[3],"IntChron")
  expect_match(levels(df$source)[4],"LiVES")
  expect_type(getData(db="IntChron",category = "Location", field = "latitude")[[1]], "double")
  expect_warning(getData(db="IntChron",category = "Location", field = "measure"),NULL)
})
