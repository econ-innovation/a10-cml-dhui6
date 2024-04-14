organize_files <- function(source_dir, destination_dir, files_per_folder = 100) {
  file_count <- 0
  folder_count <- 0
  current_folder <- NULL
  
  dir.create(destination_dir, recursive = TRUE, showWarnings = FALSE)
  
  file_list <- list.files(source_dir, full.names = TRUE, recursive = TRUE)
  
  for (file in file_list) {
    if (file_count %% files_per_folder == 0) {
      folder_count <- folder_count + 1
      current_folder <- file.path(destination_dir, paste0('Folder_', folder_count))
      dir.create(current_folder, showWarnings = FALSE)
    }
    
    destination_file_path <- file.path(current_folder, basename(file))
    
    file.rename(file, destination_file_path)
    
    file_count <- file_count + 1
  }
  
  print(paste("Total files moved:", file_count))
}


source_directory <- "D:\denghui\Desktop\econ-innovation\作业数据\assignment_cml"
destination_directory <- "D:\denghui\Desktop\econ-innovation\作业数据\assignment_cml-1"
organize_files(source_directory, destination_directory)

#调用
source("organize_files.R")
