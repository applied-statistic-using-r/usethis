#' Create a simple `NEWS.md`
#'
#' This creates a basic `NEWS.md` in the root directory.
#'
#' @inheritParams use_template
#' @export
use_news_md <- function(open = TRUE) {
  use_template(
    "NEWS.md",
    data = package_data(),
    open = open
  )
}

use_news_heading <- function(version) {
  news_path <- file.path(proj_get(), "NEWS.md")
  if (!file.exists(news_path)) {
    return(invisible())
  }

  news <- readLines(news_path)
  title <- paste0("# ", project_name(), " ", version)

  if (title == news[[1]]) {
    return(invisible())
  }

  done("Adding new heading to NEWS.md")
  write_utf8(news_path, c(title, "", news))
}
