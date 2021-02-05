## code to prepare `dracula` dataset goes here
library(fs)
library(readr)
library(here)

url <- "http://www.gutenberg.org/ebooks/345.txt.utf-8"
local_file <- here("data-raw", "dracula.txt")

# Download text if it isn't already here
if(!file_exists(local_file)){
  download.file(url, local_file, mode = "wb")
}

dracula <- read_lines(local_file)

usethis::use_data(dracula, overwrite = TRUE)
