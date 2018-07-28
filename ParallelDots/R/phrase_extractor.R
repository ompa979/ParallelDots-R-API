library("httr")
library("RJSONIO")
phrase_extractor <- function(url,data,key) {
  req <- POST(url,
              body = list(
                text = data,
                api_key=key
              ),
              encode = "multipart",
              verbose())
  stop_for_status(req)
  result<-content(req)
  return(cat(toJSON(result)))
}