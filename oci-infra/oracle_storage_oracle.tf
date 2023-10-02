terraform {
    backend "http" {
        address = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/10EhJAwIhm5BlWjBpGfVcwtSuJEr2rCQM9BR8ClojjocsVCQdqAaP_noiH_NNQYs/n/grkwgmqwtyw9/b/bucket-20231001-2114/o/state"
        update_method = "PUT"
    }
}