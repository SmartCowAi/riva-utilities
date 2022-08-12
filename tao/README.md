# Riva Utilities

## TAO

A summarised guide to making use of NVIDIA resources to compliment Riva on the SmartCow Apollo Audio Visual Engineering kit. Select Models from the Train Optimise Adapt toolkit may be converted to Riva compatible models.

### Docker requirements
Pre-requisities 

```bash
sudo apt update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

To verify:
```bash
sudo docker run hello-world
```

Ensure Docker can be run without sudoL

```bash 
sudo groupadd docker

sudo usermod -aG docker $USER
```

Reboot the device or simply log out and back in so that the membership group is updated:

If you are met the following error:

```bash
WARNING: Error loading config file: /home/user/.docker/config.json -
stat /home/user/.docker/config.json: permission denied
```

Use the following commands:

```bash
 sudo chown "$USER":"$USER" /home/"$USER"/.docker -R

 sudo chmod g+rwx "$HOME/.docker" -R
```

Install nvidia-docker-2 to take advantage of nvidia runtime:
```bash
sudo apt-get update

sudo apt-get install -y nvidia-docker2
```

You may wish to once again reboot at this point.

To verify:

```bash
sudo docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi
```

---

## NGC

Ensure you have an account on the [NVIDIA NGC](https://ngc.nvidia.com/setup/api-key). Log in following the instructions on the page.

```bash
docker login nvcr.io
```

Similarly, it would be advisable to download the [NVIDIA NGC](https://ngc.nvidia.com/setup/installers/cli) (you may opt to use this later on however it is not necessary.)

For AMD64 Linux:

```bash
wget --content-disposition https://ngc.nvidia.com/downloads/ngccli_linux.zip && unzip ngccli_linux.zip && chmod u+x ngc-cli/ngc

find ngc-cli/ -type f -exec md5sum {} + | LC_ALL=C sort | md5sum -c ngc-cli.md5

echo "export PATH=\"\$PATH:$(pwd)/ngc-cli\"" >> ~/.bash_profile && source ~/.bash_profile

ngc config set
```

---

## TAO Installation and Setup


You will be requiring Conda - a version of which you may download from [here](https://docs.conda.io/en/latest/miniconda.html).

Once installed:

```bash
conda create -n launcher python=3.6
conda init <SHELL>
```

Where ```<SHELL>``` would be your choice: e.g. bash or zsh.

After running, you may have to restart your shell before activating the launcher.

```
conda activate launcher
```

Once launched:

```
pip3 install nvidia-tao
pip3 install jupyter
```

The TAO toolkit offers functionality for both computer vision and conversational AI skills - this document focuses on the latter:

1. [Speech to Text Citrinet](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/tao/resources/speechtotext_citrinet_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/speechtotext_citrinet_notebook/versions/v1.4/zip -O speechtotext_citrinet_notebook_v1.4.zip
```

2. [Speech to Text Conformer](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/tao/resources/speechtotext_conformer_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/speechtotext_conformer_notebook/versions/v1.0/zip -O speechtotext_conformer_notebook_v1.0.zip
```

3. [Question Answering](https://ngc.nvidia.com/catalog/resources/nvidia:tao:questionanswering_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/questionanswering_notebook/versions/v1.3/zip -O questionanswering_notebook_v1.3.zip
```

4. [Text Classification](https://ngc.nvidia.com/catalog/resources/nvidia:tao:textclassification_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/textclassification_notebook/versions/v1.3/zip -O textclassification_notebook_v1.3.zip
```

5. [Token Classification](https://ngc.nvidia.com/catalog/resources/nvidia:tao:tokenclassification_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/tokenclassification_notebook/versions/v1.3/zip -O tokenclassification_notebook_v1.3.zip
```

6. [Punctuation and Capitalization](https://ngc.nvidia.com/catalog/resources/nvidia:tao:punctuationcapitalization_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/punctuationcapitalization_notebook/versions/v1.3/zip -O punctuationcapitalization_notebook_v1.3.zip
```

7. [Intent and Slot Classification](https://ngc.nvidia.com/catalog/resources/nvidia:tao:intentslotclassification_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/intentslotclassification_notebook/versions/v1.3/zip -O intentslotclassification_notebook_v1.3.zip
```

8. [NGram Language Model](https://ngc.nvidia.com/catalog/resources/nvidia:tao:texttospeech_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/ngram_lm_notebook/versions/v1.0/zip -O ngram_lm_notebook_v1.0.zip
```

9. [Text to Speech](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/tao/resources/texttospeech_notebook)
```bash
wget --content-disposition https://api.ngc.nvidia.com/v2/resources/nvidia/tao/texttospeech_notebook/versions/v1.2.0/zip -O texttospeech_notebook_v1.2.0.zip
```


Running your notebook of choice:
```bash
jupyter notebook --ip 0.0.0.0 --allow-root --port 8888
```