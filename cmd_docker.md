



```
docker run --name dbtest -e MYSQL_ROOT_PASSWORD=test123 -p 53306:3306 -v ~/docker/dbtest:/bind_mount -d mysql
docker run --name ubunfirst -p 50022:22 -v ~/docker/ubunfirst:/bind_mount -d ubuntu


```

