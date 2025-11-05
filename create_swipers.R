library(tidyverse)
library(here)
library(glue)
library(sf)
library(davR)
library(jsonlite)
library(fs)


# Define a vector of plot IDs to process
plot_ids <- c("207920", "270924", "211198") # Add other IDs here as you get them

# Loop through each plot ID
for (plot_id in plot_ids) {
  # Define the list of images for the swiper using relative paths
  image_paths <- fs::dir_ls(here::here("docs", "data", plot_id), glob = "*.png")

  image_list <- lapply(image_paths, function(path) {
    list(path = paste0("https://raw.githubusercontent.com/RobinKohrs/glyph/refs/heads/main/docs/data/", plot_id, "/", basename(path)))
  })

  # Define the output path for the swiper HTML file
  output_file <- here::here("docs", "swipers", paste0(plot_id, ".html"))

  # Generate the image swiper widget.
  # This calls the function with your image data. No overlay is specified.
  swiper_widget <- davR::html_create_image_swiper(
    image_data = image_list,
    gradient_color = "#fff",
    gradient_stops = c("0" = "#fff", "5" = "#fff", "15" = "transparent", "50" = "transparent", "85" = "transparent", "95" = "#fff", "100" = "#fff"),
    aspect_ratio = "1/1",
    max_width = "822",
    main_image_width = 80,
    output_file = output_file,
    dot_size = "13px",
    include_html_header = TRUE
  )

  clipr::write_clip(swiper_widget)

}
