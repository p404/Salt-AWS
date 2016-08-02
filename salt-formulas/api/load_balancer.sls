boto:
  pip.installed

api-balancer:
  boto_elb.register_instances:
    - keyid: {{ salt['pillar.get']('aws:id') }}
    - key: {{ salt['pillar.get']('aws:key') }}
    - region: us-west-2
    - instances:
      - {{ grains['ec2']['instance_id'] }}