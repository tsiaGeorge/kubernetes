docker build -t tsianspire/multi-client:latest -t tsianspire/multi-client:$SHA ./client
docker build -t tsianspire/multi-server:latest -t tsianspire/multi-server:$SHA ./server
docker build -t tsianspire/multi-worker:latest -t tsianspire/multi-worker:$SHA ./worker

docker push tsianspire/multi-client:latest
docker push tsianspire/multi-server:latest
docker push tsianspire/multi-worker:latest

docker push tsianspire/multi-client:$SHA
docker push tsianspire/multi-server:$SHA
docker push tsianspire/multi-worker:$SHA

for i in $(ls -d k8s/*/); do kubectl apply -f $i;done;
kubectl set image deployments/client-deployment client=tsianspire/multi-client:$SHA
kubectl set image deployments/server-deployment server=tsianspire/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=tsianspire/multi-worker:$SHA
