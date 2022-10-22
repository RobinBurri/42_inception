FROM	alpine:3.14

RUN		apk update

RUN		apk add --no-cache --update nginx
RUN		apk add --no-cache --update openssl

RUN		mkdir /etc/nginx/ssl

# Generation des certificats et cles au nom du student
RUN 	openssl req -x509 -nodes \
	# public key
	-out /etc/nginx/ssl/rburri.42.fr.crt \	
	# private key
	-keyout /etc/nginx/ssl/rburri.42.fr.key \
	-subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=rburri.42.fr"

# Creation du dossier qui va contenir les fichiers de configurations de nginx pour le serveur
RUN 	mkdir /var/run/nginx
# !!!!!! ARE YOU SURE???

# Copie sur le container du fichier de configuration pour servir la page qu'on souhaite
COPY	config/nginx.conf /etc/nginx/http.d/default.conf

# Exposition du seul port autorise par le sujet
EXPOSE	443

# Lancement de nginx en premier plan et non en background (les logs seront dans /var/log/nginx) 
# pour que le container ne se stop pas
CMD	[ "nginx", "-g", "daemon off;" ]