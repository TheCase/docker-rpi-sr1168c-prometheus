apt-get -y install python-pip
pip install -r requirements.txt
mkdir -p /opt/sr1168c
cp exporter /opt/sr1168c
cp sr1168c.service /etc/systemd/system/.
systemctl enable sr1168c.service
systemctl start sr1168c.service
