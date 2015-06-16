# Getting Started
### Database
1. Create a MySQL database named: ```dashemon``` (or whatever you like)
2. Create a ```database.yml``` file in **config/** with the following
    ```ruby
    development:
      adapter: mysql2
      database: dashemon
      username: root
      password: 
      socket: /tmp/mysql.sock
    
    # Warning: The database defined as 'test' will be erased and
    # re-generated from your development database when you run 'rake'.
    # Do not set this db to the same as development or production.
    test: &TEST
      adapter: mysql2
      database: dashemon_test
      username: root
      password: 
      socket: /tmp/mysql.sock
    
    cucumber:
      <<: *TEST
    
    re_test:
      <<: *TEST
    ```
    (replace the credentials to match your credentials)

3. run the configure.sh script. 
    ```bash
    ./configure.sh
    ```
    It will run bundle install, setup devise, and run the migrations.
    
### Credentials
1. admin: admin@dashemon.com
2. user:  user@dashemon.com

the password for both accounts is ```password```

# some totally fun things to do for the next person:
0. Finish Readme
1. figure out how to update the dashboard#show view in realtime (or, probably more practical, an AJAX request every minute or something)
2. make it not look like a four year old duct taped css together at the last minute
3. style the airbrake and new relic logs.
4. port the html to haml 

