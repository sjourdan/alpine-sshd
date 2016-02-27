# Alpine SSHD (Dropbear)

This is a small Alpine-based container using [openssh-sftp-server](https://pkgs.alpinelinux.org/package/main/x86/openssh-sftp-server) and [Dropbear SSH](https://matt.ucc.asn.au/dropbear/dropbear.html).

## Usage

It takes 2 variables: `USER` and `PASSWORD`, both in cleartext. Redirect the TCP/22 port to whatever port you want.

    docker run -d \
    -p 2222:22 \
    -e USER=myusername \
    -p PASSWORD=mypassword \
    sjourdan/alpine-sshd

## Dropbear Notes

Options used in this container:

```
-R              Create hostkeys as required
-F              Don't fork into background
-E              Log to stderr rather than syslog
-m              Don't display the motd on login
-w              Disallow root logins
-g              Disable password logins for root
```

## Build

    $ make build
