git clone https://github.com/facebookresearch/mtm.git

conda create -n mtm python=3.10
conda activate mtm

# Troubleshooting:

pip install "pip<24.1"
pip install setuptools==65.5.0 "wheel<0.40.0"

#

conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
pip install -e .

# pip install -r requirements_dev.txt