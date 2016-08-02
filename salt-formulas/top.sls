##############################################################################
# top.sls
#
# Definition state.highstate for Lovely - API
#
#
# Pablo Opazo <pablo@sequel.ninja>
##############################################################################

base:
    'api-*':
      - instance.swap
      - instance.date
      - instance.system_upgrade
      - instance.utils
      - instance.hostname
      - instance.user
      - instance.ssh_hardening
      - instance.firewall
      - instance.http-server
      - api.docker
      - api.load_balancer

