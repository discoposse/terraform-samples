data "external" "api_request" {
  program = ["sh", "curl_script.sh"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    # id = "abc123"
  }
}