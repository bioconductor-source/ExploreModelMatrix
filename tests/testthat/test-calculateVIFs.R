test_that(".CalculateVIFsLM works", {
  sampleData <- data.frame(
    genotype = rep(c("A", "B"), each = 4),
    treatment = rep(c("trt", "ctrl"), 4),
    stringsAsFactors = FALSE
  )

  mm <- model.matrix(~ genotype, data = sampleData)

  expect_null(.CalculateVIFsLM(mm[, 1, drop = FALSE]))
  expect_equal(.CalculateVIFsLM(mm), data.frame(coefficient = "genotypeB",
                                                vif = 1))
})
