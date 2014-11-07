Rails Base App
====

A starter app for development using Ruby on Rails. It comes with gems that a
widely used across most apps and many handy development and test gems.

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

6. In ```config/application.rb```, change the line

        module RailsBaseApp

    to

        module <your app name>

    In ```/config/initializers/session_store.rb```, change the key name to your
    app name.

7. Run ```rake db:create``` and ```rake db:migrate```.

## Developing
Have one terminal tab open for each of:

- ```rails s```
- ```guard```
- ```bash```

Happy developing!

## Deploying
Deploying to Heroku is the same as any other application. However, since we have
figaro, to set your environment variables on Heroku you can just run

    figaro heroku:set -e production

## Contributing

Feel free to open issues or send pull requests with improvements. Thanks in
advance for your help!

## Cal Blueprint
![bp](http://bptech.berkeley.edu/assets/logo-full-large-d6419503b443e360bc6c404a16417583.png "BP Banner")
**[Cal Blueprint](http://www.calblueprint.org/)** is a student-run UC Berkeley organization devoted to matching the skills of its members to our desire to see social good enacted in our community. Each semester, teams of 4-5 students work closely with a non-profit to bring technological solutions to the problems they face every day.

## License

![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
This work is licensed under a [Creative Commons Attribution 3.0 Unported
License](http://creativecommons.org/licenses/by/3.0/deed.en_US)
