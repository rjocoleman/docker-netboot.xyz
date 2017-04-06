FROM alpine:3.5

RUN apk --update add --no-cache tftp-hpa; \
 mkdir -p /tftpboot;

EXPOSE 69/udp

ADD https://boot.netboot.xyz/ipxe/netboot.xyz.kpxe /tftpboot/
ADD https://boot.netboot.xyz/ipxe/netboot.xyz-undionly.kpxe /tftpboot/

RUN find /tftpboot -type f -exec chmod 0444 {} +

ENTRYPOINT ["in.tftpd"]
CMD ["-L", "--verbose", "-u", "root", "--secure", "/tftpboot"]
