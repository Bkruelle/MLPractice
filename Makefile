JN_PORT = 3150
WORKING_DIR=/home/kruelle
DATA_DIR=/data
VNC_PORT=3135
TFB_PORT=3134
VIS_PORT=8197

docker:
	sudo docker image build -t kruelle_ml_practice --network=host -f Dockerfile .

bash:
	docker run -it --rm \
		--runtime=nvidia \
		-p $(VIS_PORT):$(VIS_PORT) \
		-v $(WORKING_DIR):/root \
		-v $(DATA_DIR):/kruelle \
		--shm-size 128g \
		kruelle_ml_practice /bin/bash

notebook:
	sudo docker run -it --rm \
		-p $(JN_PORT):$(JN_PORT) \
		-v $(WORKING_DIR):/root \
		-v $(DATA_DIR):/kruelle \
		-v /mlruns:/mlruns \
		-w /root \
		--shm-size 8g\
		kruelle_ml_practice /bin/bash -c "jupyter notebook --no-browser --port $(JN_PORT) --ip 0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/root'"

tfb:
	sudo tensorboard --logdir /home/kruelle/runs --host=172.19.24.118 --port=$(TFB_PORT)

aws:
	docker run -ti -v $(DATA_DIR):/root ubuntu bash
