##############################################################################
# Init.sls Docker
#
# Installs docker on ubuntu and dependencies for salt-stack
#
#
# Pablo Opazo <pablo@sequel.ninja>
##############################################################################

docker:
  cmd.run:
    - name: wget -qO- https://get.docker.com/ | sh

docker-service:
  service.running:
    - name: docker
    - enable: True

pip-docker-py:
  pip.installed:
    - name: docker-py
    - reload_modules: True
    - require:
      - pkg: python-pip

python-pip:
  pkg.installed
