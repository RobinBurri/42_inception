FROM	alpine:3.14

RUN		apk update --quiet

RUN		apk add --quiet --no-cache --update nginx
RUN		apk add --quiet --no-cache --update openssl

RUN		mkdir /etc/nginx/ssl

RUN 	openssl req -x509 -nodes \
	# public key
	-out /etc/nginx/ssl/rburri.42.fr.crt \	
	# private key
	-keyout /etc/nginx/ssl/rburri.42.fr.key \
	-subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=rburri.42.fr"

COPY	config/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE	443

# deamon off to prevent the container from halting
CMD	[ "nginx", "-g", "daemon off;" ]