#!/bin/bash

set -eu -o pipefail

cd /var/repo

RPMS=(
  kernel-ml-4.18.20-1.el6.elrepo.x86_64.rpm
  kernel-ml-firmware-4.18.20-1.el6.elrepo.x86_64.rpm
  kernel-ml-devel-4.18.20-1.el6.elrepo.x86_64.rpm
  kernel-ml-doc-4.18.20-1.el6.elrepo.x86_64.rpm
  kernel-ml-headers-4.18.20-1.el6.elrepo.x86_64.rpm
  perf-4.18.20-1.el6.elrepo.x86_64.rpm
  python-perf-4.18.20-1.el6.elrepo.x86_64.rpm
  kernel-lt-4.4.182-1.el6.elrepo.x86_64.rpm
  kernel-lt-firmware-4.4.182-1.el6.elrepo.x86_64.rpm
  kernel-lt-devel-4.4.182-1.el6.elrepo.x86_64.rpm
  kernel-lt-doc-4.4.182-1.el6.elrepo.x86_64.rpm
  kernel-lt-headers-4.4.182-1.el6.elrepo.x86_64.rpm
  perf-4.4.182-1.el6.elrepo.x86_64.rpm
  python-perf-4.4.182-1.el6.elrepo.x86_64.rpm
  kernel-lt-3.10.108-1.el6.elrepo.x86_64.rpm
  kernel-lt-firmware-3.10.108-1.el6.elrepo.x86_64.rpm
  kernel-lt-devel-3.10.108-1.el6.elrepo.x86_64.rpm
  kernel-lt-doc-3.10.108-1.el6.elrepo.x86_64.rpm
  kernel-lt-headers-3.10.108-1.el6.elrepo.x86_64.rpm
  perf-3.10.108-1.el6.elrepo.x86_64.rpm
  python-perf-3.10.108-1.el6.elrepo.x86_64.rpm
)

# http://mirrors.gigenet.com/gigenet/elrepo-archive/kernel/el6/x86_64/RPMS/
for rpm in "${RPMS[@]}"; do
  echo >&2 "===]> Info: Downloading: $rpm"
  curl -Ls "http://mirrors.gigenet.com/gigenet/elrepo-archive/kernel/el6/x86_64/RPMS/${rpm}" -O
done

echo >&2 "===]> Info: Remove caches"
rm -rfv ./*.1

echo >&2 "===]> Info: Fix file permissions"
chown -R nginx:nginx /var/repo
