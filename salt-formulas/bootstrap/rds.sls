rds_instance_api:
  boto_rds.present:
    - name: myrds
    - allocated_storage: 5
    - db_instance_class: db.t2.micro
    - engine: postgres
    - master_username: myuser
    - master_user_password: mypass
    - region: us-west-2
    - keyid: 'AKIAJCJIOSMNOTHERE'
    - key: 'eplZSOMETHING7NT3GBNVJ3sBh8smQaTq1U6'