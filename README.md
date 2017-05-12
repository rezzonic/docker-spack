# spack

*warning: this all is still being tested*

Docker image with [Spack](https://github.com/LLNL/spack).

How to use

## To build further Docker images

Dockerfile:

```
FROM rezzonic/spack

RUN $SPACK_ROOT/bin/spack install openmpi
```

## To run from shifter

Pull the image from DockerHub

```
shifterimg pull tinchou/apache-pig
```

Script to be launched from within the Docker image

```
#!/bin/bash

$SPACK_ROOT/bin/spack install openmpi

```


SLURM script to launch the image

```
#!/bin/bash
  
#SBATCH --image=rezzonic/spack
 
srun shifter ./my-env-my-job.sh
```
