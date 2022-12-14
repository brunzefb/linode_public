#!/bin/bash
echo "Enter WP password:"
read -s password

helm upgrade \
  wordpress \
  ./ \
  --set wordpressUsername="brunzefb" \
  --set wordpressPassword="$password" \
  --set wordpressEmail="brunzefb@gmail.com" \
  --set wordpressLastName="Brunzema" \
  --set wordpressFirstName="Friedrich" \
  --set wordpressBlogName="Friedrich's Blog" \
  --set mariadb.auth.rootPassword="$passworddb" \
  --set mariadb.auth.password="$passworddb" \
  --set ingress.enabled=true \
  --set ingress.hostname="blog.brunzema.com" \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"="letsencrypt-prod" \
  --set ingress.tls=true \
  --set ingress.ingressClassName="nginx" \
  --install \
  --namespace apps \
