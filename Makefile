INSTALL_GID = 9999
PKG_USR_GID = 10000
PKG_USR_UID = 10000
PKG_USR_NAME = pkgusr

install:
	echo "install:x:$(INSTALL_GID):$(PKG_USR_NAME)" >> /etc/group
	echo "$(PKG_USR_NAME):x:$(PKG_USR_GID):" >> /etc/group
	echo "$(PKG_USR_NAME):x:$(PKG_USR_UID):$(PKG_USR_GID):Package users helpers:/usr/src/$(PKG_USR_NAME):/bin/bash" >> /etc/passwd
	install -o $(PKG_USR_UID) -g $(PKG_USR_GID) -m 755 -d /usr/src/$(PKG_USR_NAME)
	install -o $(PKG_USR_UID) -g $(PKG_USR_GID) -m 755 -d /etc/pkgusr/skel-package/src
	install -o $(PKG_USR_UID) -g $(PKG_USR_GID) -m 755 -d /etc/pkgusr/skel-package/patches
	chown -R $(PKG_USR_UID):$(PKG_USR_GID) etc
	chown -R $(PKG_USR_UID):$(PKG_USR_GID) usr
	cp -a etc usr /
	chown 0:0 /etc /usr{/bin,/lib,/sbin,}
	ln -s /etc/pkgusr/bash_profile /etc/pkgusr/skel-package/.bash_profile
	ln -s /etc/pkgusr/bashrc /etc/pkgusr/skel-package/.bashrc
