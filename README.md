
Running client on raspi or similar

Docker needs access to the serial port when running the server

```
docker run -d -p 5001:5001 -e SERIAL_DEVICE=/dev/ttyUSB0 --device=/dev/ttyUSB0 sr1168c-prometheus
```


### OR

run as service on a Raspi v1:

```
sh install.sh
```
