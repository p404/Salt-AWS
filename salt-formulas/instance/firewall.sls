/etc/iptables.firewall.rules:
  file.managed:
    - mode: 755
    - source: salt://instance/files/iptables.firewall.rules
  cmd.wait:
    - name: iptables-restore < /etc/iptables.firewall.rules
    - watch:
      - file: /etc/iptables.firewall.rules


/etc/network/if-pre-up.d/firewall:
  file.managed:
    - source: salt://instance/files/iptables_restore
    - mode: 755
    - require:
      - file: /etc/iptables.firewall.rules
