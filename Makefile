ECLIPSE_PATH="$(HOME)/.local/share/eclipse"

.PHONY: jdk
jdk:
	chmod +x scripts/install-jdk.sh
	./scripts/install-jdk.sh

.PHONY: jdtls
jdtls:
	rm -rf $(ECLIPSE_PATH) && mkdir -p $(ECLIPSE_PATH)
	curl https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml -o $(ECLIPSE_PATH)/eclipse-java-google-style.xml
	curl https://projectlombok.org/downloads/lombok-1.18.28.jar -o $(ECLIPSE_PATH)/lombok.jar
	curl -L https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.29.0/jdt-language-server-1.29.0-202310261436.tar.gz -o $(ECLIPSE_PATH)/eclipse.jdt.ls.tar.gz \
		&& cd $(ECLIPSE_PATH) && mkdir eclipse.jdt.ls \
		&& tar -xvf eclipse.jdt.ls.tar.gz -C eclipse.jdt.ls && rm -rf eclipse.jdt.ls.tar.gz
