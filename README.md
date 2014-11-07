Rails Base App
====

A starter app for development using Ruby on Rails. It comes with gems that a
widely used across most apps and many handy development gems.

Ruby version: 2.1.4 <br>
Rails version: 4.1.7

Core gems:

- thin server
- pg for database
- figaro for env config on development/Heroku
- devise for authentication
- simple_form for forms
- gon for javascript variables
- kaminari for pagination
- SASS, Coffeescript, Slim, and autoprefixer for frontend


## Requirements

- git
- Ruby version 2.1.4 (best installed with [RVM](https://rvm.io/))
- [direnv](https://github.com/zimbatm/direnv) if you want to avoid typing
```bin``` all the time for [spring](https://github.com/rails/spring/blob/master/README.md)

## Getting Started
1. Clone the repo:

        git clone https://github.com/calblueprint/rails-base-app/ <your project name>

2. Change the .ruby-gemset file if needed so that RVM selects the right gemset
for your project. The default gemset is called ```base-app```

3. ```cd``` into your project directory and run ```bundle install```.

4. Copy over ```config/database.yml.sample``` into ```config/database.yml``` and
change the settings for the database names and your postgres credentials.

5. Copy over ```config/application.yml.sample``` into ```config/application.yml```
and add any environment variables as necessary (figaro loads them for you).

6. Run ```rake db:create``` and ```rake db:migrate```.

7. Fire up the server with ```rails s``` and see the app working!
