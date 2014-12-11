clean:
	rm -rf *.deb
	rm -rf wkhtmltox-0.12.1.tar.bz2
	rm -rf wkhtmltox-0.12.1/

build: clean
	wget http://sourceforge.net/projects/wkhtmltopdf/files/0.12.1/wkhtmltox-0.12.1.tar.bz2
	tar xvf wkhtmltox-0.12.1.tar.bz2
	wkhtmltox-0.12.1/scripts/build.py posix-local
	fpm -s dir -t deb -n wkhtmltopdf -v 0.12.1 \
	./wkhtmltox-0.12.1/static-build/posix-local/wkhtmltox-0.12.1/bin/wkhtmltopdf=/usr/bin/wkhtmltopdf

install:
	sudo dpkg -i wkhtmltopdf_0.12.1_amd64.deb
