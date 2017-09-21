# Docker Netboot.xyz

A very minimal TFTP server running on Alpine 3.6 in a Docker container to serve [Netboot.xyz](https://netboot.xyz).

Git Repo: https://github.com/rjocoleman/docker-netboot.xyz

Docker Hub: https://hub.docker.com/r/rjocoleman/netboot.xyz/

## Usage

Run the docker container:

```shell
docker run -p 69:69/udp rjocoleman/netboot.xyz

# OR

docker create \
 --name=netboot.xyz \
 --restart=always \
 -p 69:69/udp \
 rjocoleman/netboot.xyz
```

Set your DHCP options (standard PXE boot stuff):

```shell
next-server 192.168.1.1 # your docker host (or container static IP)
filename netboot.xyz.kpxe # or netboot.xyz-undionly.kpxe
```

## Errata

You could also use a Docker network to give the container its own discrete IP to avoid collision with other port 69/udp running on the host.

I noticed an [iPXE error](http://ipxe.org/err/410de1) once when selecting a menu item that downloaded an application from a remote source. Disabling signature checks (in the Netboot.xyz menu) bypasses the error.
