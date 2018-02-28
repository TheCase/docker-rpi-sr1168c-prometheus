## sr1668c -> prometheus exporter

expose metrics from sr1168c solar water heater

http://www.ultisolar.com/SR1168.pdf

You'll need a USB serial to rs485 converter

http://amzn.to/2FFoedu


### Install docker on raspi (I had dumb trouble with apt on my v1)
\*I started with raspbian

```
sudo curl -sSL https://get.docker.com | sh
sudo sh -c "apt-get update && apt-get -y install git"
```

Set hostname:
```
sudo hostname sr1168c 
sudo echo sr1168c > /etc/hostname
```

### Clone, build, run
```
git clone https://github.com/TheCase/docker-rpi-sr1168c-prometheus
cd docker-rpi-sr1168c-prometheus
sudo docker build -t sr1168c-prometheus .
sudo docker run -d -p 5001:5001 -e "SERIAL_DEVICE=/dev/ttyUSB0" -e "SERVICE_5001_CHECK_HTTP=/health" --device=/dev/ttyUSB0 --name=sr1168c-prometheus sr1168c-prometheus
```

I like to run consul and registrator for the service checks
```
sudo docker run -d --net=host -e 'CONSUL_LOCAL_CONFIG={"leave_on_terminate": true}' hypriot/rpi-consul agent -node=sr1168c -bind=$(ifconfig wlan0 | grep 'inet addr' | cut -f2 -d: | awk {'print $1'}) -join=consul.service.consul -data-dir=/data
```

registrator:
```
sudo docker run -d --net=host -v /var/run/docker.sock:/tmp/docker.sock:ro hypriot/rpi-registrator consul://localhost:8500
```

