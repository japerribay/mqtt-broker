FROM eclipse-mosquitto:latest

# Copy configuration files
COPY /mosquitto /mosquitto

# Set username and password
RUN mosquitto_passwd -U /mosquitto/config/passwords.txt

# Start mosquitto MQTT broker with the condiguration set on file
ENTRYPOINT ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]