# Utilise l'image officielle Apache NiFi
FROM apache/nifi:latest

# Clever Cloud attend que l'application écoute sur le port 8080 par défaut
ENV NIFI_WEB_HTTP_PORT=8080
ENV NIFI_WEB_HTTP_HOST=0.0.0.0

# On désactive la sécurité HTTPS native de NiFi pour ce conteneur
# Car c'est Clever Cloud qui va gérer le HTTPS (SSL termination) via son load balancer
# Cela évite les conflits de certificats complexes à gérer dans un conteneur
ENV NIFI_WEB_HTTPS_PORT=""
ENV NIFI_WEB_HTTPS_HOST=""
ENV NIFI_SECURITY_KEYSTORE=""
ENV NIFI_SECURITY_TRUSTSTORE=""

# Expose le port 8080
EXPOSE 8080