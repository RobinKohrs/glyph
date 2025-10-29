library(tidyverse)
library(here)
library(glue)
library(sf)
library(davR)
library(jsonlite)
library(fs)


# Define a vector of plot IDs to process
plot_ids <- c("207920", "270924") # Add other IDs here as you get them

# Loop through each plot ID
for (plot_id in plot_ids) {
  # Define the list of images for the swiper using relative paths
  image_paths <- fs::dir_ls(here::here("docs", "data", plot_id), glob = "*.png")

  image_list <- lapply(image_paths, function(path) {
    list(path = paste0("../data/", plot_id, "/", basename(path)))
  })

  # Generate the image swiper widget.
  # This calls the function with your image data. No overlay is specified.
  swiper_widget <- html_create_image_swiper(
    image_data = image_list,
    gradient_color = "#fff",
    aspect_ratio = "1/1",
    max_width = "822"
  )

  # Define the output path for the swiper HTML file
  output_file <- here::here("docs", "swipers", paste0(plot_id, ".html"))

  # Write the widget to the file
  writeLines(as.character(swiper_widget), output_file)
}
