The Blueprint Website
====
[![Code Climate](https://codeclimate.com/github/calblueprint/calblueprint.org/badges/gpa.svg)](https://codeclimate.com/github/calblueprint/calblueprint.org)
[![Test Coverage](https://codeclimate.com/github/calblueprint/calblueprint.org/badges/coverage.svg)](https://codeclimate.com/github/calblueprint/calblueprint.org)
[![Codeship Status for calblueprint/calblueprint.org](https://codeship.com/projects/c7435d20-76a7-0132-d36d-6a08ddb55576/status?branch=main)](https://codeship.com/projects/55283)

## Contributing

### Dependencies

- Ruby `v2.6.5`
- Rails `v5.2.0`

## Installation
*If you run into any errors, see the [Troubleshooting](#troubleshooting) guide below.*

0. (Strongly recommended for macOS users) Install [Homebrew](https://brew.sh/) if you don't have it already.
1. Clone this repository and enter the directory:
   ```sh
   git clone https://github.com/calblueprint/calblueprint.org.git && cd calblueprint.org
   ```
2. Install RVM (see [instructions for macOS](https://usabilityetc.com/articles/ruby-on-mac-os-x-with-rvm/)).
3. Switch to ruby 2.6.5 (note: you'll have to do this every time you open this directory in the terminal):
   ```sh
   rvm use 2.6.5
   ```

    If you get an error, install ruby-2.6.5 by running `rvm install "ruby-2.6.5"`

    Check your ruby version by running `ruby -v`. It should be 2.6.5.
4. Install rails 5.2.0:
   ```sh
   gem install rails -v 5.2.0
   ```
5. Install Postgresql locally:
   - On macOS, run `brew install postgresql` 

6. Check installation:
   ```sh
   $ ruby -v
   ruby 2.6.5...

   $ rails -v
   Rails 5.2.0
   
   $ psql -V
   psql (PostgreSQL) 14.6 (Homebrew)
   ```
7. Install gems:
   ```sh
   bundle install
   ```
8. Run the setup script:
   ```sh
   ./bin/setup
   ```
9. Start the server:
   ```sh
   rails s
   ```

Once the server boots up, you should be able to see the website on [localhost:3000](http://localhost:3000/)! Note that it may take a couple minutes to start up.

### Troubleshooting
1. If `bundle install` fails with a messy error log like:
    ```sh
    /Users/anniewang/.rvm/rubies/ruby-2.6.5/include/ruby-2.6.0/ruby/ruby.h:413:29: note: expanded from macro 'ID2SYM'
    #define ID2SYM(x) RB_ID2SYM(x)
                                ^
    /Users/anniewang/.rvm/rubies/ruby-2.6.5/include/ruby-2.6.0/ruby/ruby.h:408:33: note: expanded from macro 'RB_ID2SYM'
    #define RB_ID2SYM(x) (rb_id2sym(x))

    ...
    
    An error occurred while installing pg (0.18.4), and Bundler cannot continue.
    Make sure that `gem install pg -v '0.18.4' --source 'https://rubygems.org/'` succeeds before bundling.
    ```

    Try running the following command, which adds a flag to the `pg` gem installation:

    ```sh
    bundle config build.pg --with-cflags=-Wno-error=implicit-function-declaration
    ```
2. If your postgresql installation fails, try [this article on completely reinstalling](https://medium.com/@bitadj/completely-uninstall-and-reinstall-psql-on-osx-551390904b86).

## Cal Blueprint
![screenshot 2015-12-24 16 43 33](https://user-images.githubusercontent.com/5278006/32311415-bcdef6f6-bf55-11e7-9e8c-e43e786685cf.png)


**[Cal Blueprint](http://www.calblueprint.org/)** is a student-run UC Berkeley organization devoted to matching the skills of its members to our desire to see social good enacted in our community. Each semester, teams of 6-8 students work closely with a non-profit to bring technological solutions to the problems they face every day.

## License

![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
This work is licensed under a [Creative Commons Attribution 3.0 Unported
License](http://creativecommons.org/licenses/by/3.0/deed.en_US)
