#!/usr/bin/env bash

java \
	-Declipse.application=org.eclipse.jdt.ls.core.id1 \
	-Dosgi.bundles.defaultStartLevel=4 \
	-Declipse.product=org.eclipse.jdt.ls.core.product \
	-Dlog.level=ALL \
	-Xmx1G \
	--add-modules=ALL-SYSTEM \
	--add-opens java.base/java.util=ALL-UNNAMED \
	--add-opens java.base/java.lang=ALL-UNNAMED \
	-jar /usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar \
	-configuration /usr/share/java/jdtls/config_linux \
	-data $HOME/.jdtls-workspace
