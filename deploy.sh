docker build -t orirothschild/multi-client:latest -t orirothschild/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t orirothschild/multi-server:latest -t orirothschild/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t orirothschild/multi-worker:latest -t orirothschild/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push orirothschild/multi-client:latest
docker push orirothschild/multi-server:latest
docker push orirothschild/multi-worker:latest

docker push orirothschild/multi-client:$SHA
docker push orirothschild/multi-server:$SHA
docker push orirothschild/multi-worker:$SHA

kubectl apply -f k8s 
# kubectl set image deployments/server-deployment server=cygnetops/multi-server-pgfix-5-11
# kubectl set image deployments/client-deployment client=stephengrider/multi-client:$SHA
#kubectl set image deployments/worker-deployment worker=stephengrider/multi-worker:$SHA

# kubectl set image deployments/server-deployment server=orirothschild/multi-server:$SHA
# kubectl set image deployments/client-deployment server=orirothschild/multi-client:$SHA
# kubectl set image deployments/worker-deployment server=orirothschild/multi-worker:$SHA