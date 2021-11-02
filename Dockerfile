from nvidia/cuda:11.2.2-base-ubuntu20.04

ARG CONDA=Anaconda3-2021.05-Linux-x86_64.sh

RUN apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install -y wget git vim \
	&& rm -rf /var/lib/apt/lists/*

# User
RUN useradd -ms /bin/bash lab
WORKDIR /home/lab
RUN mkdir /lab && chown -R lab:lab /lab
USER lab

# Install conda
RUN wget --quiet https://repo.anaconda.com/archive/$CONDA && \
	chmod +x "./$CONDA" && \
	"./$CONDA" -b -p ~/anaconda && \
	rm "./$CONDA" && \
	~/anaconda/bin/conda init

RUN bash -i -c "conda update -n base -c defaults conda"

# conda env
RUN bash -i -c "conda create -y -n lab -c conda-forge python=3.9 cudnn=8.1 cudatoolkit=11.2 nodejs && conda clean --force-pkgs-dirs -y && conda clean --all -y"
RUN bash -i -c "conda activate lab; pip install --no-cache-dir tensorflow-gpu==2.6.1"

COPY requirements.txt .
RUN bash -i -c "conda activate lab; pip install --no-cache-dir -r requirements.txt"

COPY lab.sh .
WORKDIR /lab
RUN echo "conda activate lab" >> /home/lab/.bashrc
ENTRYPOINT ["bash", "-i", "/home/lab/lab.sh"]
