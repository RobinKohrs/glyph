library(tidyverse)
library(here)
library(glue)
library(sf)
library(davR)
library(jsonlite)


# Define the list of images for the swiper.
# The URLs are based on the link you provided and your mention of "output 1-4".
image_list <- list(
  list(path = "https://raw.githubusercontent.com/RobinKohrs/glyph/refs/heads/main/207920/output_1.png"),
  list(path = "https://raw.githubusercontent.com/RobinKohrs/glyph/refs/heads/main/207920/output_2.png"),
  list(path = "https://raw.githubusercontent.com/RobinKohrs/glyph/refs/heads/main/207920/output_3.png"),
  list(path = "https://raw.githubusercontent.com/RobinKohrs/glyph/refs/heads/main/207920/output_4.png")
)

# Generate the image swiper widget.
# This calls the function with your image data. No overlay is specified.
swiper_widget <- html_create_image_swiper(
  image_data = image_list, gradient_color = "#fff",
  aspect_ratio = "16/9"
)

# To display the widget, simply call the variable in your console,
# or include it as the last line in an R Markdown chunk.
swiper_widget %>% clipr::write_clip()
writeLines(swiper_widget, sys_make_path("docs/index.html"))
