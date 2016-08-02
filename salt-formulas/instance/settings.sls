#Global Settings for Salt Cloud

{% set hostname_name = grains.id %}
{% set hostname = hostname_name %}
{% set hostname_ip = salt['network.ip_addrs']('eth0')[0] %}


{%- set settings = {} %}
{%- do settings.update( {  'hostname': hostname,
                           'hostname_ip': hostname_ip,
                        }) %}
