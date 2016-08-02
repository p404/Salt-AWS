##############################################################################
# init.sls
#
# Nginx
# Nginx install
#
# Pablo Opazo <pablo@sequel.ninja>
##############################################################################

nginx-server:
  pkg.installed:
    - name: nginx
    - require:
      - file: nginx_sites_dir
      - file: nginx_delete_conf
  service.running:
    - name: nginx

nginx-utils:
  pkg.installed:
    - name: apache2-utils

nginx_sites_dir:
  file.directory:
    - name: /etc/nginx/sites-enabled
    - makedirs: True

nginx_delete_conf:
  file.absent:
    - name: '/etc/nginx/sites-enabled/default'

nginx-extras:
  pkg.installed:
    - name: nginx-extras