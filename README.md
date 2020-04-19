## How do I run it?

<<<<<<< Updated upstream
1. Download the source
2. Run `docker-compose up`
3. Wait for "PostgreSQL init process complete; ready for start up."
4. OSX & Ubuntu: Run `chmod +x ./lib/bin/setup_docker_db.sh`
5. OSX & Ubuntu: Run `sh /lib/bin/setup_docker_db.sh`
6. Windows: Run `./lib/bin/setup_docker_win.bat`
7. Visit `localhost:3000`

## Using the Rails Console

1. Run `docker exec -it magic-league_web_1 bash` to connect to the Docker container
2. Run `rails c`
=======
##Initial Set up for Windows
1. Download the source, and npm i 
2. From the control panel > programs(apps) and features > Turn Window Features On and Off, set Use Windows Subsystem for Linux on
3. Install the Ubuntu subsystem available
4. Install Ruby follow the instructions here ( https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04 ) steps 1- 3 to install Nodejs, Ruby 
   -Skip the prereq step about server setup
5. Install Postgress follow the instructions here ( https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04 ) steps 1 - 5 
 
6. Run 'bundle install' 
   -If you have issues with the pg gem see this article ( https://www.digitalocean.com/community/questions/gem-install-pg-not-working )

7. Run 'sudo service postgresql start" 
8. Run 'rails db:create && rails db:migrate && rails db:seed'

## Using the Rails Console

1. Run `rails c`

## Start Local Mac

1. npm run start-mac

## Start Local Ubuntu

1. npm run start-ubuntu

>>>>>>> Stashed changes

## How do I make myself an Admin from the console?
1. Run `rails c`
2. `user = User.find_by_email('email_address')`
3. `user.admin = true`
4. `user.save`

## Troubleshooting

* If any of steps 4-5 fail under "How do I run it?", try: `docker exec -it magic-league_web_1 //bin/sh -c "rake db:create && rake db:migrate"`
* The name of the web container docker brings up should be called `magic-league_web_1`. If docker cannot locate this container in the above command, try `docker ps` and looking for the name of the container using port 3000.

## Adding/Modifying Omniauth Providers
* Google - https://console.cloud.google.com/apis/dashboard?project=ogre-mtg
