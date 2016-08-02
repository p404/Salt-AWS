Ensure elb exists:
  boto_elb.present:
    - keyid: {{ salt['pillar.get']('salt_cloud:id', None) }}
    - key: {{ salt['pillar.get']('salt_cloud:key', None) }}
    - name: api-elb
    - region: us-west-2
    - availability_zones:
        - us-west-2c
    - listeners:
        - elb_port: 443
          instance_port: 443
          elb_protocol: HTTPS
    - health_check:
        target: 'TCP:443'
        healthy_threshold: 2
        unhealthy_threshold: 2
    - cnames:
      - name: api.tierrasmiticas.cl.
        zone: tierrasmiticas.cl.