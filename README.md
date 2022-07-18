# mqtt-broker
Development of a containerized MQTT message broker. The MQTT protocol provides a lightweight method of carrying out messaging using a publish/subscribe model. This makes it suitable for Internet of Things messaging such as with low power sensors or mobile devices such as phones, embedded computers or microcontrollers.

## Development environment
The custom docker image has been developed using the official [Eclipse Mosquitto](https://hub.docker.com/_/eclipse-mosquitto) image as a starting point. [Eclipse Mosquitto](https://mosquitto.org/) is an open source (EPL/EDL licensed) message broker that implements the MQTT protocol versions 5.0, 3.1.1 and 3.1.

## Configuration
All the configuration of the Eclipse Mosquitto broker is inside `mosquitto/config`. There are three files inside the folder:
- `mosquitto.conf`: Main configuration. For more info read [official documentation](https://mosquitto.org/man/mosquitto-conf-5.html).
- `mosquitto.acl`: Different users permissions configuration. For more info read [official documentation](https://mosquitto.org/man/mosquitto-conf-5.html).
- `passwords.txt`: Usernames and passwords.
A volume is created in order to modify this configuration after creating the container.

## Creating and executing the image locally
To create and execute the image, docker must be installed and it has to be also started. To **build the image**, just execute the following command from the root path of this project:

``` console
docker build -t mqtt-broker .

```

To **run the container**, just execute the following command after having created the corresponding image as explained before:

``` console
docker run -d --name mqtt-broker -p 1883:1883 -p 9001:9001 -v mqtt-broker-config:/mosquitto/config -v mqtt-broker-data:/mosquitto/data mqtt-broker

```
