#' @title API wrapper that fetches data from IsoMemo Applications
#'
#' @description Data retrieval for databases within the IsoMemo initiative (https://isomemo.com/). Given the parameters Database
#' name, category names, and field names.
#'
#'
#' @param db (character) database options:  "14CSea"   "CIMA"     "IntChron" "LiVES"
#' @param category (character) domain specific categories of fields to retrieve: "Dating info","Isotopic proxies." If set to NULL (default) all categories are returned
#' @param field (character) fields to return. If set to NULL (default) all fields will be returned
#' @param mapping (character) Optionally, provide a specific mapping in order to obtain a list
#'  of databases only for that mapping. Check available mapping ids with getMappings()
#'
#' @return A data frame containing the requested databases, category domains, and variables of interest from the user
#' @export
#'
getData <- function(db = getDatabaseList(mapping = "IsoMemo"),
                    category = NULL,
                    field = NULL,
                    mapping = "IsoMemo") {
  if (is.null(db)) return(NULL)

  isoData <- getRemoteDataAPI(db = db, category = category, field = field, mapping = mapping)

  if(length(isoData) == 0){
    warning("data.frame is empty, the category or field may not exist in the database")
    return(NULL)
  } else {
    asFactorColumns <- colnames(isoData) %in% c("source", "datingType")
    isoData[asFactorColumns] <- lapply(isoData[asFactorColumns], as.factor)

    isoData
  }
}


#' Get field mapping table
#'
#' @param colnamesAPI (logical) Optionally, return a dataframe with the column names as they come
#'  from the 'IsoMemo' API
#' @inheritParams getData
#' @return A data frame that describes data field name, data type, and domain category
#' @export
getFields <- function(mapping = "IsoMemo", colnamesAPI = FALSE) {
  res <- getMappingAPI(mapping = mapping)

  if (!colnamesAPI && length(res) == 4) {
    names(res) <- c("field", "fieldType", "category", "mapping")
  }
  res
}

#' Get Mappings
#'
#' Get all available mapping ids
#'
#' @return A character vector with all available mapping ids
#' @export
getMappings <- function() {
  res <- callAPI("mapping-ids")
  if (!is.null(res) && length(res) > 0)
    res$mappingIds
  else
    res
}

#' Get Database List
#'
#' @inheritParams getData
#'
#' @return A character vector with all available databases
#' @export
getDatabaseList <- function(mapping = "IsoMemo") {
  res <- callAPI("dbsources", mappingId = mapping)
  if (!is.null(res) && length(res) > 0)
    res$dbsource
  else
    res
}


#' Call API
#'
#' @param action (character) name of the endpoint, one of "mapping-ids", "dbsources", "iso-data" or
#'  "mapping"
#' @param ... parameters for the endpoint, e.g. mappingId = "IsoMemo", dbsource = "LiVES,
#'  field = "site,longitude", ...
callAPI <- function(action, ...) {
  params <- list(...)
  paramString <- paste(names(params), params, sep = "=", collapse = "&")

  apiBaseURL <- config$apiBaseUrl()
  url <- paste(apiBaseURL, action, "?", paramString, sep = "")

  data <- try({
    fromJSON(url)
  }, silent = TRUE)

  if (inherits(data, "try-error")) {
    warning(data[[1]])
    res <- list()
    attr(res, "errorApi") <- data[[1]]
  } else if (data$status == 200) {
    res <- data
  } else if (!is.null(data$message)) {
    warning(data$message)
    res <- list()
    attr(res, "errorApi") <- data$message
  } else if (!is.null(data$error)) {
    warning(data$error)
    res <- list()
    attr(res, "errorApi") <- data$error
  } else {
    warning("An error occured")
    res <- list()
    attr(res, "errorApi") <- "An error occured"
  }

  res
}

getRemoteDataAPI <- function(db = NULL, field = NULL, category = NULL, mapping = "IsoMemo") {
  res <- callAPI(
    "iso-data",
    mappingId = mapping,
    dbsource = paste(db, collapse = ","),
    field = paste(field, collapse = ","),
    category = paste(category, collapse = ",")
  )

  if (!is.null(res) && length(res) > 0) {
    attr(res$isodata, "updated") <- res$updated
    res$isodata
  } else res
}

getMappingAPI <- function(mapping = "IsoMemo") {
  res <- callAPI("mapping", mappingId = mapping)
  if (!is.null(res) && length(res) > 0)
    res$mapping
  else
    res
}

