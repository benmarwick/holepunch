context("test-write_dockerfile")

# This code runs before the tests. It creates a test compendium in
# the temporary directory where all the functions 
# can be applied safely and subsequently tested.

# create temporary directory in file system
playground_path <- paste0(tempdir(), "/testcompendium")
dir.create(playground_path, showWarnings = FALSE)

# Create an RStudio Project in the playground
usethis::create_project(path = playground_path,
                        open = FALSE)

# make a git repo
testing_dir <- getwd()
setwd(playground_path)
usethis::use_git()
usethis::use_git_config(
  scope = "project",
  user.name = "Testing Name",
  user.email = "testing_email@example.org"
)
# add a remote to make it work
git2r::remote_set_url(name = "testing", url = "git@github.com:testing/testcompendium.git")
setwd(testing_dir)

# add an Rmd with some packages in use
cat("library(dplyr)\nrequire(ggplot2)\nglue::glue_collapse(glue::glue('{1:10}'))\n", file = paste0(playground_path, "/test.Rmd"))

# add an R script file with some packages in use
cat("library(tidyr)\nrequire(purrr)\n", file = paste0(playground_path, "/test.R"))

library(holepunch)
write_dockerfile(path = playground_path)

test_that("write_dockerfile works", {
  #
})

## try a different approach
dockerfile <- containerit::dockerfile(from = playground_path, )
print(dockerfile)
writeLines(dockerfile, con = "Dockerfile")


z <- containerit::dockerfile(
  from = playground_path,
  image = "rocker/binder:latest",
  add_self = FALSE,
  container_workdir = NULL,
  silent = TRUE,
  cmd = containerit::Cmd("R")
)
write(print(z), file = paste0(playground_path, "/Dockerfile"))





