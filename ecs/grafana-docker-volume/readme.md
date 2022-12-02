# Docker volume for ECS task 

## Create the Task Definition. Remember to replace the XXXXXXX parameters in the `task-definition.json`
```
aws ecs register-task-definition \
    --cli-input-json file://task-definition.json --region $REGION
```

## Create the Docker Volume from the ECS Container Instance
```
[root@ip-192-168-119-212 ~]# docker create volume grafana
```

## Inspect the volume created to confirm the Driver. This is specified in the ECS task definition
```
[root@ip-192-168-119-212 ~]# docker volume inspect grafana
[
    {
        "CreatedAt": "2022-12-02T10:24:28Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/grafana/_data",
        "Name": "grafana",
        "Options": {},
        "Scope": "local"
    }
]
```


## Once the ECS Task is running, SSH into the ECS Container Instance to confirm that the Grafana data persist 
```
root@ip-192-168-119-212 ~]# ls -lrt /var/lib/docker/volumes/grafana/_data
total 1024
drwxrwxrwx 4 472 root     71 Dec  2 10:57 plugins
drwxr-x--- 2 472 root      6 Dec  2 10:57 file-collections
drwx------ 2 472 root      6 Dec  2 10:57 png
drwx------ 2 472 root      6 Dec  2 10:57 csv
drwxr-x--- 3 472 root     15 Dec  2 10:57 alerting
-rw-r----- 1 472 root 909312 Dec  2 10:57 grafana.db
```


