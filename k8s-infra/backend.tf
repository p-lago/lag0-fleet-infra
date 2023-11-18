terraform {
    backend "http" {
        address = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/E_SfVyERw9Xm0yhEPz9BsmsMRksQ_cdMUcEKr1mzvYblDyPjAYlWlOv_2LqWw2IR/n/grkwgmqwtyw9/b/bucket-20231001-2114/o/state-k8s"
        update_method = "PUT"
    }
}