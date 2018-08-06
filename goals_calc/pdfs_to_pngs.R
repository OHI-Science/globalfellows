setwd("./goals_calc")
library(stringr)
library(pdftools)
library(png)

goal_calc_pdfs <- list.files(".", pattern = ".pdf$", full.names = FALSE)

for(i in goal_calc_pdfs){
  name <- substr(i, 1, str_length(i) - 4)
  render <- pdf_render_page(i, page = 1, dpi = 300)
  png::writePNG(render, paste0(name, ".png"))
}

rm(goal_calc_pdfs, i, name, render)
setwd("..")