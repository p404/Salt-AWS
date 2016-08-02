{%- from 'instance/settings.sls' import settings with context %}

delete_hostname:
  cmd.run:
    - name: sed '1d' /etc/hostname > tmpfile; mv tmpfile /etc/hostname


{{ settings.hostname }}:
  host.present:
    - ip: {{ settings.hostname_ip }}
    - require_in:
        - cmd: hostname-cmd


/etc/hostname:
  file.append:
    - text:
      - {{ settings.hostname }}

hostname-cmd:
  cmd.run:
    - name: "hostname -b -F /etc/hostname"
    - require:
      - file: /etc/hostname

