terraform {
    backend "http" {
        address = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/V7vD4DKCSK8TWipBZiES0UD_podq9YNu1g11ltDSAHfantxvuC6OlgVDW533vVfq/n/grkwgmqwtyw9/b/bucket-20231001-2114/o/state"
        update_method = "PUT"
    }
}