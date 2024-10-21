FROM golang:1.23

COPY . /go/src
WORKDIR src

RUN apt-get update && \
    apt-get install -y munge libmunge-dev libmunge2 build-essential slurm-wlm slurm-wlm-basic-plugins

# RUN rm -f /etc/munge/munge.key

# COPY slurm.conf /etc/slurm/slurm.conf
# COPY munge.key /etc/munge/munge.key

RUN go build -o prometheus-slurm-exporter

EXPOSE 8080

# # Run slurm exporter
CMD ["./prometheus-slurm-exporter", "--listen-address=0.0.0.0:8080"]