git_push <- function() {
  project_path <- "L:/GitHub/econ_dash"
  setwd(project_path)
  
  # Add changes to staging
  add_command <- '"C:/Users/flanneryj/AppData/Local/Programs/Git/cmd/git.exe" add .'
  if (system(add_command, intern = TRUE) != "") {
    cat("Failed to add changes.\n")
    return()
  }
  
  # Commit changes
  commit_command <- '"C:/Users/flanneryj/AppData/Local/Programs/Git/cmd/git.exe" commit -m "Automated commit of CSV files"'
  commit_result <- system(commit_command, intern = TRUE)
  if (grepl("nothing to commit", commit_result)) {
    cat("Nothing to commit.\n")
    return()
  } else if (grepl("error", commit_result, ignore.case = TRUE)) {
    cat("Failed to commit changes.\n")
    return()
  }
  
  # Push changes
  push_command <- '"C:/Users/flanneryj/AppData/Local/Programs/Git/cmd/git.exe" push origin main'
  if (system(push_command, intern = TRUE) != "") {
    cat("Failed to push to GitHub.\n")
    return()
  }
  
  cat("Successfully pushed to GitHub.\n")
}



git_push <- function() {
  project_path <- "L:/GitHub/econ_dash"
  setwd(project_path)
  
  # Run a system command and return TRUE if successful, FALSE otherwise
  run_command <- function(command) {
    tryCatch({
      # If the command has output, it is considered successful
      output <- system(command, intern = TRUE)
      if (length(output) == 0) {
        return(TRUE) # No output but command ran successfully
      }
      return(TRUE)
    }, error = function(e) {
      return(FALSE)
    })
  }
  
  # Add changes to staging
  if (!run_command("C:/Users/flanneryj/AppData/Local/Programs/Git/cmd/git.exe add .")) {
    cat("Failed to add changes.\n")
    return()
  }
  
  # Commit changes
  commit_result <- run_command("C:/Users/flanneryj/AppData/Local/Programs/Git/cmd/git.exe commit -m 'Automated commit of CSV files'")
  if (!commit_result) {
    cat("Failed to commit changes or nothing to commit.\n")
    return()
  }
  
  # Push changes
  if (!run_command("C:/Users/flanneryj/AppData/Local/Programs/Git/cmd/git.exe push origin main")) {
    cat("Failed to push to GitHub.\n")
    return()
  }
  
  cat("Successfully pushed to GitHub.\n")
}


# Call the function
git_push()

