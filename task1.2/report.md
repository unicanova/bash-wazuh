```bash
bogdan@dmitry-MS-7816:~$ curl -u foo:bar -X GET "http://127.0.0.1:55000/agents?pretty&offset=0&limit=5&sort=-ip,name"
{
   "error": 0,
   "data": {
      "totalItems": 2,
      "items": [
         {
            "status": "Active",
            "name": "7ed595934345",
            "ip": "any",
            "dateAdd": "2018-01-11 19:12:09",
            "version": "Wazuh v3.1.0",
            "manager_host": "dmitry-MS-7816",
            "os": {
               "platform": "ubuntu",
               "version": "16.04.3 LTS",
               "name": "Ubuntu"
            },
            "id": "001"
         },
         {
            "status": "Active",
            "name": "dmitry-MS-7816",
            "ip": "127.0.0.1",
            "dateAdd": "2018-01-11 17:59:15",
            "version": "Wazuh v3.1.0",
            "manager_host": "dmitry-MS-7816",
            "os": {
               "platform": "ubuntu",
               "version": "16.04.3 LTS",
               "name": "Ubuntu"
            },
            "id": "000"
         }
      ]
   }
}
```