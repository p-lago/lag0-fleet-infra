#!/bin/bash
curl --fail -H "Authorization: Bearer Oracle" -L0 http://169.254.169.254/opc/v2/instance/metadata/oke_init_script | base64 --decode >/var/run/oke-init.sh
bash /var/run/oke-init.sh
bash /usr/libexec/oci-growfs -y
echo -e '[[registry]]\nprefix = "docker.io"\ninsecure = false\nblocked = false\nlocation = "docker.io"\n\n[[registry.mirror]]\nlocation = "harbor.lag0.com.br/dhub"\ninsecure = false' >> /etc/containers/registries.conf.d/harbor.conf
systemctl daemon-reload
systemctl restart crio