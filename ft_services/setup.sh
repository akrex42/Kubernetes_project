minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
docker build . -t nginx_image -f srcs/nginx/Dockerfile
docker build . -t phpmyadmin_image -f srcs/phpmyadmin/Dockerfile
docker build . -t wordpress_image -f srcs/wordpress/Dockerfile
docker build . -t mysql_image -f srcs/mysql/Dockerfile
docker build . -t telegraf_image -f srcs/telegraf/Dockerfile
docker build . -t grafana_image -f srcs/grafana/Dockerfile
docker build . -t influxdb_image -f srcs/influxdb/Dockerfile
docker build . -t ftps_image -f srcs/ftps/Dockerfile
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/configmetal.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin1.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/ftps/ftps.yaml
minikube dashboard
