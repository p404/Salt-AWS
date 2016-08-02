deploy:
  user.present:
    - shell: /bin/bash
    - fullname: Instance User
    - empty_password: true
    - gid_from_name: true
    - groups:
      - sudo

/etc/sudoers:
  file.append:
    - text: "deploy ALL=(ALL) NOPASSWD: ALL"