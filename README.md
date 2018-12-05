# Alpine SSHD (Dropbear)

[![Docker Repository on Quay](https://quay.io/repository/sjourdan/alpine-sshd/status "Docker Repository on Quay")](https://quay.io/repository/sjourdan/alpine-sshd)
[![](https://badge.imagelayers.io/sjourdan/alpine-sshd:latest.svg)](https://imagelayers.io/?images=sjourdan/alpine-sshd:latest 'Get your own badge on imagelayers.io')

This is a small Alpine-based container using [openssh-sftp-server](https://pkgs.alpinelinux.org/package/main/x86/openssh-sftp-server) and [Dropbear SSH](https://matt.ucc.asn.au/dropbear/dropbear.html).

The intended usage is to (temporary) access/modify shared volumes by SSH/SFTP.

## Usage

It takes 2 variables: `USER` and `PASSWORD`, both in cleartext. Redirect the TCP/22 port to whatever port you want.

    docker run -d \
    -p 2222:22 \
    -e USER=myusername \
    -e PASSWORD=mypassword \
    sjourdan/alpine-sshd

- _Take a look at environment variables for more options_

Then you can use this container to SFTP and/or SSH:

```
sftp -P2222 user1@192.168.99.100
user1@192.168.99.100's password:
Connected to 192.168.99.100.
sftp> pwd
Remote working directory: /home/user1
sftp>
```

## Environment variables

```bash
ENV USER # Required, username for SSH user
ENV PASSWORD # Required, password for SSH user
ENV PORT # Optional, port which dropbear will listen to
```

## Dropbear Notes

Options used in this container:

```
-R              Create hostkeys as required
-F              Don't fork into background
-E              Log to stderr rather than syslog
-w              Disallow root logins
-g              Disable password logins for root
```

## Build

    $ make build
