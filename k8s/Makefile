deploy:
	for i in $$(ls -d */); do kubectl apply -f $$i/;done;

secret:
	kubectl create secret generic pgpassword --from-literal PGPASSWORD=<password>
