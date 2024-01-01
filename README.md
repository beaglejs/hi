# hi
BeagleJS Hello Project

```
sudo apt update
sudo apt install build-essential
```

이렇게 했더니 역시 실패하네... 직접 소스부터 설치하자.

```
git clone https://github.com/beaglejs/hi.git
```

```
needrestart is being skipped since dpkg has failed
E: Sub-process /usr/bin/dpkg returned an error code (1)
E: Unable to read /tmp/apt-dpkg-install-rvlaKL - opendir (2: No such file or directory)
```

문제가 발생하였다. needrestart 를 스킵할 수 있는 방법이 있을까?

```
needrestart is being skipped since dpkg has failed
W: Download is performed unsandboxed as root as file '/home/ubuntu-server/hi/script/archives/partial/libc6_2.35-0ubuntu3.5_amd64.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
E: Sub-process /usr/bin/dpkg returned an error code (1)
E: Unable to read /tmp/apt-dpkg-install-ySJreo - opendir (2: No such file or directory)
```

우분투 데스크탑으로 변경하는 것으로...




