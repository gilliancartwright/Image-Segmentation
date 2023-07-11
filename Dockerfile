FROM nvidia/cuda:11.8.0-base-ubuntu22.04

# base os
RUN apt-get update --yes --quiet && DEBIAN_FRONTEND=noninteractive apt-get install --yes --quiet --no-install-recommends \
    software-properties-common \
    build-essential wget \
    tar

# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -f -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

# install conda components - add the packages you need here
RUN . /opt/conda/etc/profile.d/conda.sh && \
    conda activate && \
    conda update -y -n base -c defaults conda && \
    conda install -y -c conda-forge numpy astropy && \
    conda install -y pandas && \
    conda install -y -c pytorch -c nvidia pytorch torchvision pytorch-cuda=11.7 && \
    conda install -y -c conda-forge segmentation-models-pytorch && \
    conda install -y -c anaconda scikit-learn && \
    conda install -y -c conda-forge albumentations

#pip install -U albumentations && \

# set up environment for when using the container, this is for when 
# we invoke the container with Apptainer/Singularity
RUN mkdir -p /.singularity.d/env && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >>/.singularity.d/env/91-environment.sh && \
    echo "conda activate" >>/.singularity.d/env/91-environment.sh

