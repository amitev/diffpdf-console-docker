FROM ubuntu:xenial

Add entrypoint.sh /

RUN apt-get update && \
	apt-get build-dep diffpdf -y && \
	apt-get install curl xvfb -y && \
	curl -L https://github.com/taurus-forever/diffpdf-console/archive/master.tar.gz | tar -zx && \
	cd diffpdf-console-master && \
	lrelease diffpdf.pro && \
	qmake && \
	make && \
	cp diffpdf /opt && \
	cd /opt && \
	rm -rf /diffpdf-console-master && \
	chmod +x /entrypoint.sh && \
	apt-get autoremove -y --purge curl && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/entrypoint.sh"]
