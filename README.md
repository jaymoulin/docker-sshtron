> [!CAUTION]
> As-of 2021, this product does not have a free support team anymore. If you want this product to be maintained, please support my work.

# ![SSHTron](https://cdn.rawgit.com/zachlatta/sshtron/master/logo.svg) - Docker image (Multiarch)

SSHTron is a multiplayer lightcycle game that runs through SSH. Just run the command below and you'll be playing in seconds:

    $ ssh sshtron.zachlatta.com

_Controls: WASD or vim keybindings to move (**do not use your arrow keys**). Escape or Ctrl+C to exit._

![Demo](https://cdn.rawgit.com/zachlatta/sshtron/master/static/img/gameplay.gif)

This Docker image is based on [Zach Latta's sshtron](https://github.com/zachlatta/sshtron)

Build your own docker image
---------------------------
```sh
# Build the SSHTron Docker image
$ docker build -t sshtron .
```

Run your container based on already compiled image
--------------------------------------------------
```sh
# Spin up the container with always-restart policy
$ docker run -t -d -p 2022:2022 --restart always --name sshtron jaymoulin/sshtron
```
OR
```sh
# Spin up the container with always-restart policy
$ docker run -t -d -p 2022:2022 --restart always --name sshtron ghcr.io/jaymoulin/sshtron
```

## CVE-2016-0777

[CVE-2016-0777](https://www.qualys.com/2016/01/14/cve-2016-0777-cve-2016-0778/openssh-cve-2016-0777-cve-2016-0778.txt)
revealed two SSH client vulnerabilities that can be exploited by a malicious SSH server. While SSHTron does not exploit
these vulnerabilities, you should still patch your client before you play. SSHTron is open source, but the server
could always be running a modified version of SSHTron that does exploit the vulnerabilities described
in [CVE-2016-0777](https://www.qualys.com/2016/01/14/cve-2016-0777-cve-2016-0778/openssh-cve-2016-0777-cve-2016-0778.txt).

If you haven't yet patched your SSH client, you can follow
[these instructions](https://www.jacobtomlinson.co.uk/quick%20tip/2016/01/15/fixing-ssh-vulnerability-CVE-2016-0777/) to do so now.

## License

SSHTron Docker Image is licensed under the MIT License. See the full license text in [`LICENSE`](LICENSE).
