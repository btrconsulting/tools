all: clean pip3 docker gobuster webmap joomscan wpscan lazagne ctfr nlocate

gobuster:
	apt install -y gobuster

webmap:
	docker pull rev3rse/webmap:latest
	mkdir -p -v /tmp/webmap

docker:
	apt install -y docker.io
	service docker start
wpscan:
	apt install -y wpscan

joomscan:
	apt install joomscan

lazagne:
	git clone https://github.com/AlessandroZ/LaZagne
	cd LaZagne/
	wget https://github.com/AlessandroZ/LaZagne/releases/download/2.4/laZagne.exe
	cd ..

theharvester:
	apt install -y theharvester

sublist3r:
	apt install -y sublist3r

ctfr:
	git clone https://github.com/UnaPibaGeek/ctfr
	pip3 install -r ctfr/requirements.txt
	chmod +x ctfr/ctfr.py

pip3:
	apt install -y  python3-pip

nlocate:
	cp -f  nlocate /usr/sbin/
	strfile frasesSOC
	cp -f frasesSOC /usr/share/games/fortunes/
	cp -f frasesSOC.dat /usr/share/games/fortunes/

ohmyreport:
	git clone https://github.com/lucasgaleano/ohmyreport
	sudo rm -rf /bin/ohmyreport-v1.0/
	sudo mv -u ohmyreport/ /bin/ohmyreport-v1.0
	sudo echo "/bin/ohmyreport-v*/ohmyreport $@" > /bin/ohmyreport
	sudo chmod +x /bin/ohmyreport

clean:
	rm -rf LaZagne/
	rm -rf ctfr/
	rm -rf /usr/sbin/nlocate

.PHONY: nlocate ohmyreport
