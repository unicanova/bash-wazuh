

```bash
bogdan@dmitry-MS-7816:~$ curl -u foo:bar -k -X GET "http://127.0.0.1:55000/manager/stats?pretty"
{
   "error": 0,
   "data": [
      {
         "hour": 17,
         "firewall": 0,
         "alerts": [
            {
               "times": 1,
               "sigid": 1002,
               "level": 2
            },
            {
               "times": 30,
               "sigid": 530,
               "level": 0
            },
            {
               "times": 1,
               "sigid": 502,
               "level": 3
            }
         ],
         "totalAlerts": 32,
         "syscheck": 0,
         "events": 32
      }
   ]
}

```


```bash
bogdan@dmitry-MS-7816:~$ curl -u foo:bar -k "http://127.0.0.1:55000/rootcheck/000?status=outstanding&offset=0&limit=1&pretty"
{
   "error": 0,
   "data": {
      "totalItems": 120,
      "items": [
         {
            "status": "outstanding",
            "oldDay": "2018-01-11 18:16:26",
            "readDay": "2018-01-11 18:16:26",
            "event": "File '/var/lib/docker/aufs/mnt/182cc6544643742c6334b4c6c11ce5b95d353d8337edacfa5165028366623e79/dev/null' is owned by root and has written permissions to anyone."
         }
      ]
   }
}
```
