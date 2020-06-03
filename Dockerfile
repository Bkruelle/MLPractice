FROM nvcr.io/nvidia/pytorch:20.02-py3
RUN pip install jupyter
RUN pip install scikit-image tqdm pandas lxml pillow matplotlib opencv-python torchvision
RUN pip install pytorch-ignite
RUN pip install jupyterlab ipympl
RUN conda install -c conda-forge nodejs
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib
RUN pip install visdom
RUN pip install albumentations
RUN pip install torch torchvision

ENV CUDA_VISIBLE_DEVICES=7

