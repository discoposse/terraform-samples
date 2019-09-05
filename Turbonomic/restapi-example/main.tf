resource "restapi_object" "placement_request" {
	path = "/reservations?apiCallBlock=false"
	data = "{\"demandName\":\"1567627563091_apiuser\",\"action\":\"PLACEMENT\",\"parameters\":[{\"placementParameters\":{\"count\":1,\"templateID\":\"T-ae876334ffeed3950f51f67288b2b100\",\"constraintIDs\":[\"d4efa6855bf2807c4d7b4deddf6ed1065e6819c7\"]}}]}"
	object_id = "vm2"
}