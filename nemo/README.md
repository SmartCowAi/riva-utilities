# Convert [Nemo](https://github.com/nvidia/nemo) models to Riva

## Important, do not run this on an ARM/ARM64 device - it will NOT work!

Drop your ```.nemo``` models in ```nemo/NeMo```.

You may find nemo models [here](https://catalog.ngc.nvidia.com/models?query=nemo&orderBy=weightPopularDESC).


Launch the Docker container:

```bash
./docker_run.sh
```

Execute the following command for conversion:

```bash
nemo2riva --out /NeMo/<MODEL_NAME>.riva /NeMo/<MODEL_NAME>.nemo --key <key>
```

Where:

1. <MODEL_NAME>.riva is your desired name for the Model
2. <MODEL_NAME>.nemo is the name of the nemo model as it appears in your directory
3. <key> is an encryption code you may select yourself - e.g. ```nvidia```