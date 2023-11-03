config <- modules::module({
    apiBaseUrl <- function() {
      if (Sys.getenv("API_BASE_URL") != "") {
        return(Sys.getenv("API_BASE_URL"))
      } else {
        return(Sys.getenv("API_BASE_URL_DEFAULT", "https://isomemodb.com/api/v1/"))
      }
    }
})
