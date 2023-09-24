FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y wget

RUN echo > start.sh "wget https://github.com/dero-am/astrobwt-miner/releases/download/V1.9.2.R5/astrominer-V1.9.2.R5_amd64_linux.tar.gz\ntar -zxvpf astrominer-V1.9.2.R5_amd64_linux.tar.gz\n./astrominer/astrominer  -w deroi1qyzlxxgq2weyqlxg5u4tkng2lf5rktwanqhse2hwm577ps22zv2x2q9pvfz92xctsqhpj49xzqcq0dl8rv -p rpc -r community-pools.mysrv.cloud:10300 -r1 dero-node-sg.mysrv.cloud:10300 -r2 dero-node-va.mysrv.cloud:10300"

RUN chmod +x /start.sh

RUN ./start.sh
