config <- modules::module({
    apiBaseUrl <- function() {
        Sys.getenv("API_BASE_URL", "https://isomemodb.com/api/v1/")
    }
})