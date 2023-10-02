terraform {
    backend "http" {
        address = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/nMwXMW9AaEXaxZ0bhpHoWPFBvTeTjobSQEx8f3qSpzSTQ5-WbXIBxlqiz1iO3_PC/n/grkwgmqwtyw9/b/bucket-20231001-2114/o/state-k8s"
        update_method = "PUT"
    }
}