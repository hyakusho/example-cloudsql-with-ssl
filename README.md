# README

## Prerequisite
- docker

## Docker
1. docker-composeをビルド && 起動する
```
% DOCKER_BUILDKIT=1 COMPOSE_DOCKER_CLI_BUILD=1 docker-compose up -d --build
```

2. 正常に起動したことを確認
```
% docker-compose ps
              Name                             Command               State                        Ports
-----------------------------------------------------------------------------------------------------------------------------
example-cloudsql-with-ssl_mysql_1   docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp, 0.0.0.0:33060->33060/tcp
example-cloudsql-with-ssl_nginx_1   /usr/local/bin/docker-entr ...   Up      0.0.0.0:8080->80/tcp
example-cloudsql-with-ssl_rails_1   /usr/local/bin/docker-entr ...   Up      0.0.0.0:3000->3000/tcp
```

3. ブラウザから確認
http://localhost:8080

## Kubernetes
### development (local)
1. applyする
```
% kubectl apply -f k8s/development.yaml
```

2. 正常に起動したことを確認
```
% kubectl get po,deploy,svc
NAME                                    READY   STATUS    RESTARTS   AGE
pod/rails-deployment-54665c8894-6tnqm   3/3     Running   0          101s

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/rails-deployment   1/1     1            1           101s

NAME                    TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/rails-service   NodePort   10.96.223.32   <none>        80:30354/TCP   102s
```

3. ブラウザから確認 (ポートはserviceのポート番号)
http://localhost:30354

### production (GKE + CloudSQL with SSL)
