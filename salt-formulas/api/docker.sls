##############################################################################
# API
#
# Install Djano API Restframework server docker
#
#
# Pablo Opazo <pablo@sequel.ninja>
##############################################################################

include:
  - docker

api-image:
   docker.pulled:
     - name: p404/api-lovely-production
     - tag: latest
     - require_in: api-container
     - force: True

api-container:
   docker.installed:
     - name: api
     - image: p404/api-lovely-production:latest
     - mem_limit: !!null
     - environment:
       - "DATABASE_HOST": {{ salt['pillar.get']('pg:lookup:host') }}
       - "DATABASE_NAME": {{ salt['pillar.get']('pg:lookup:name') }}
       - "DATABASE_USER": {{ salt['pillar.get']('pg:lookup:user') }}
       - "DATABASE_PASSWORD": {{ salt['pillar.get']('pg:lookup:password') }}
       - "DATABASE_PORT": {{ salt['pillar.get']('pg:lookup:port') }}

statics_dir:
  file.directory:
    - name: /srv/static/
    - mode: 755
    - makedirs: True

api:
  docker.running:
    - container: api
    - image: p404/api-lovely-production
    - volumes:
      - /srv/static: /static
    - ports:
        "8000/tcp":
            HostIp: ""
            HostPort: "8000"
