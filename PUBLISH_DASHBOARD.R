# Open this script in RStudio. Change question and account, then run it.
# Publish Q3-Q6 with your first free account and Q7-Q10 with your second.
question <- 10
account <- "dmontoyavalencia"

if (!requireNamespace("rsconnect", quietly = TRUE)) {
  install.packages("rsconnect", repos = "https://cloud.r-project.org")
}

# Locate the course folder from this open script, rather than Downloads.
if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {
  script_path <- rstudioapi::getSourceEditorContext()$path
  project_folder <- if (nzchar(script_path)) dirname(script_path) else getwd()
} else {
  project_folder <- getwd()
}

stopifnot(question %in% 3:10)
app_folder <- file.path(project_folder, paste0("dashboard_q", question))
primary_document <- paste0("dashboard_q", question, ".qmd")
stopifnot(file.exists(file.path(app_folder, primary_document)))

# This opens the official Posit browser authorization flow when needed.
configured <- rsconnect::accounts()
if (!any(configured$name == account & configured$server == "connect.posit.cloud")) {
  rsconnect::connectCloudUser()
}

# Bundle the source, data, and public image/CSS files. Credentials are stored
# by rsconnect outside the project and are not included in these files.
app_files <- c(primary_document, list.files(app_folder, pattern = "\\.csv$"),
  file.path("www", list.files(file.path(app_folder, "www"))))
rsconnect::writeManifest(appDir = app_folder, appFiles = app_files,
  appPrimaryDoc = primary_document, appMode = "quarto-shiny", quarto = TRUE)
rsconnect::deployApp(appDir = app_folder, appFiles = app_files,
  appPrimaryDoc = primary_document, appMode = "quarto-shiny", quarto = TRUE,
  appName = paste0("math421-dashboard-q", question),
  appTitle = paste("MATH 421 - Question", question),
  account = account, server = "connect.posit.cloud", launch.browser = TRUE)
