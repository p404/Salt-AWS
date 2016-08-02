include:
  - nginx

#Nginx conf
nginx_conf_instance:
  file.managed:
    - template: jinja
    - source: salt://instance/files/nginx-instance-conf
    - name: /etc/nginx/sites-enabled/api
    - mode: 644
    - require:
          - pkg: nginx-server

nginx_ssl_cert:
  file.managed:
    - source: salt://instance/files/ssl_certs/fullchain1.pem
    - name: /etc/ssl/fullchain1.pem
    - require:
          - pkg: nginx-server

nginx_ssl_key:
  file.managed:
    - source: salt://instance/files/ssl_certs/privkey1.pem
    - name: /etc/ssl/privkey1.pem
    - require:
          - pkg: nginx-server

nginx_chain_cert:
  file.managed:
    - source: salt://instance/files/ssl_certs/chain1.pem
    - name: /etc/ssl/chain1.pem
    - require:
          - pkg: nginx-server

nginx:
  service:
    - running
    - watch:
      - file: /etc/nginx/sites-enabled/*
