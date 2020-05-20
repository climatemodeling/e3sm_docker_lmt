# lmt_e3sm_docker

A docker container for running E3SM under a cloud environment.

### Usage:
- cd lmt_e3sm_docker
- docker build -t lmt_e3sm_v1 .
- docker run -it --rm lmt_e3sm_v1
- In the container, go to /home/lmtuser/E3SM/cime/scripts
- ./create_test ERS.f09_g16.I1850CLM45CN.cloud_gnu
