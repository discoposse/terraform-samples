output "api_result" {
	value = jsondecode(data.external.api_request.result)
}