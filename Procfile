setup:
  addons:
    - plan: 'heroku-postgresql:hobby-dev'
      as: DATABASE
  config:
    LANG: en_US.UTF-8
    RACK_ENV: development
    SECRET_KEY_BASE: >-
      9a20b1c75646c80ddca57bd3364c293f64aa637dbbacbf2014b829817b5d5e504ad858b9d1a0eaacc8aaed27df11f466c03e2cf55330d33ce9f5744e1d0efc12
build:
  languages:
    - ruby
run:
  rake: bundle exec rake
  web: bundle exec rackup config.ru -p $PORT
