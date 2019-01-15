context("test-write_compendium_description")


# This code runs before the tests. It creates a test compendium in
# the temporary directory where all the functions 
# can be applied safely and subsequently tested.

# create temporary directory in file system
playground_path <- paste0(tempdir(), "/testcompendium")
dir.create(playground_path, showWarnings = FALSE)

# Create an RStudio Project in the playgroups
usethis::create_project(path = playground_path,
                        open = FALSE)

# add an Rmd with some packages in use
cat("library(dplyr)\nrequire(ggplot2)\nglue::glue_collapse(glue::glue('{1:10}'))\n", file = paste0(playground_path, "/test.Rmd"))

# Update the compendium description with pkgs found in Rmd
write_compendium_description(path = playground_path)

# ingest the new DESC file
description_that_was_created <- paste(readLines(paste0(playground_path, "/DESCRIPTION")), collapse = " ")
# extract Depends
depends_only <- gsub('.* Depends:', "", description_that_was_created)
# Did it get the pkgs in our Rmd?
pkgs_in_depends_lgl <- stringr::str_detect(depends_only, c("dplyr", "glue", "ggplot2"))

# run the test
test_that("write_compendium_description writes a DESCRIPTION with pkgs named in an Rmd", {
  expect_equal(pkgs_in_depends_lgl, rep(TRUE, 3))
})


