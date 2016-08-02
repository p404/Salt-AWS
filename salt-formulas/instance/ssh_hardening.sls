##############################################################################
# init.sls
#
# SSH Config User Deploy
# TODO
#
# Pablo Opazo <pablo@sequel.ninja>
##############################################################################


#Make dir ssh
/home/deploy/.ssh:
  file.directory:
    - user: deploy
    - makedirs: True
    - require_in:
      - cmd: ssh-keygen
      - file: ssh-auth_keys
      - file: ssh-confd

#Generate ssh-keygen
ssh-keygen:
  cmd.run:
    - user: deploy
    - name: ssh-keygen -N "" -f /home/deploy/.ssh/id_rsa
    - unless: test -f /home/deploy/.ssh/id_rsa.pub

#Auth-keys
ssh-auth_keys:
  file.managed:
    - user: deploy
    - source: salt://instance/files/authorized_keys
    - name: /home/deploy/.ssh/authorized_keys
    - force: True

ssh-confd:
  file.managed:
    - user: deploy
    - source: salt://instance/files/sshd_config
    - name: /etc/ssh/sshd_config
    - force: True
ssh:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
