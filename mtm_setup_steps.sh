git clone https://github.com/facebookresearch/mtm.git

conda create -n mtm python=3.10
conda activate mtm

# Troubleshooting:

pip install "pip<24.1"
pip install setuptools==65.5.0 "wheel<0.40.0"

#

conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch

pip install -r requirements_dev.txt

# Mujoco steup

cd
mkdir .mujoco/
cd .mujoco/
wget https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz
tar -xvf mujoco210-linux-x86_64.tar.gz

# Put these in ~/.bashrc

export LD_LIBRARY_PATH=/home/loki/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export PATH="$LD_LIBRARY_PATH:$PATH"
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so

source ~/.bashrc

# Test simulation 

cd ~/.mujoco/mujoco210/bin
./simulate ../model/humanoid.xml

# Install mujoco-py

pip install "Cython<3"
sudo apt update
sudo apt-get install patchelf
sudo apt-get install python3-dev build-essential libssl-dev libffi-dev libxml2-dev  
sudo apt-get install libxslt1-dev zlib1g-dev libglew-dev python3-pip

git clone https://github.com/openai/mujoco-py
cd mujoco-py
pip install -r requirements.txt
pip install -r requirements.dev.txt

pip install -e . --no-cache

# Recommended to roboot system now

sudo apt install libosmesa6-dev libgl1-mesa-glx libglfw3
sudo ln -s /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu/libGL.so # may already exist
	
pip3 install -U 'mujoco-py<2.2,>=2.1'

# Verify installation

cd examples
python3 setting_state.py

# MJRL:

pip install git+https://github.com/aravindr93/mjrl.git@83d35df95eb64274c5e93bb32a0a4e2f6576638a

# MJ_ENVS:

git clone --branch stable --recursive https://github.com/vikashplus/mj_envs.git
cd mj_envs
pip install -e .

python utils/visualize_env.py --env_name hammer-v0

# MTM:
 
cd ~/mtm
pip install -e .


# # FOR SERVER WITH NO ROOT ACCESS:

# https://pytorch.org/rl/0.6/reference/generated/knowledge_base/MUJOCO_INSTALLATION.html
# https://github.com/openai/mujoco-py/issues/627

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.mujoco/mujoco210/bin
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
# export CPATH=$CONDA_PREFIX/include

# export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
# if [ -f "$CONDA_PREFIX/lib/libOSMesa32.so" ] && [ ! -f "$CONDA_PREFIX/lib/libOSMesa.so" ]; then
#     ln -s $CONDA_PREFIX/lib/libOSMesa32.so $CONDA_PREFIX/lib/libOSMesa.so
# fi

# export LD_PRELOAD=$HOME/anaconda3/envs/mtm/lib/libGLEW.so