The Blueprint Website
====
[![Code Climate](https://codeclimate.com/github/calblueprint/calblueprint.org/badges/gpa.svg)](https://codeclimate.com/github/calblueprint/calblueprint.org)
[![Test Coverage](https://codeclimate.com/github/calblueprint/calblueprint.org/badges/coverage.svg)](https://codeclimate.com/github/calblueprint/calblueprint.org)
[![Codeship Status for calblueprint/calblueprint.org](https://codeship.com/projects/c7435d20-76a7-0132-d36d-6a08ddb55576/status?branch=master)](https://codeship.com/projects/55283)

## Contributing

Dependencies:
- `rvm` (https://rvm.io/)
- Ruby `v2.6.5` (run `rvm install 2.6.5` to install)

Setup:
(currently very mac-centric)

1. Clone repo
2. Install RVM [Instructions for mac](https://usabilityetc.com/articles/ruby-on-mac-os-x-with-rvm/) and [Homebrew](https://brew.sh/) (if on mac)
3. Go to codebase folder, switch to ruby 2.6.5: `rvm use 2.6.5`  (You'll have to do this everytime you open terminal in this folder)
4. Install Postgresql locally, on mac `brew install postgresql`. (If errors, try [this article on completely reinstalling](https://medium.com/@bitadj/completely-uninstall-and-reinstall-psql-on-osx-551390904b86))
5. Create a new file called `config/database.yml` and copy over contents of `config/database.yml.sample`. leave defaults in place, remove username and password lines. 
6. Create a new file called `config/application.yml` and get contents from E-Team
7. Run `bundle install`
8. Run `rails db:setup`
9. Run `rails server`!

## Cal Blueprint
![screenshot 2015-12-24 16 43 33](https://user-images.githubusercontent.com/5278006/32311415-bcdef6f6-bf55-11e7-9e8c-e43e786685cf.png)


**[Cal Blueprint](http://www.calblueprint.org/)** is a student-run UC Berkeley organization devoted to matching the skills of its members to our desire to see social good enacted in our community. Each semester, teams of 4-5 students work closely with a non-profit to bring technological solutions to the problems they face every day.

## License

![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
This work is licensed under a [Creative Commons Attribution 3.0 Unported
License](http://creativecommons.org/licenses/by/3.0/deed.en_US)
