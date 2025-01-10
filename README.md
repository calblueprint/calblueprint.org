The Blueprint Website
====
[![Code Climate](https://codeclimate.com/github/calblueprint/calblueprint.org/badges/gpa.svg)](https://codeclimate.com/github/calblueprint/calblueprint.org)
[![Test Coverage](https://codeclimate.com/github/calblueprint/calblueprint.org/badges/coverage.svg)](https://codeclimate.com/github/calblueprint/calblueprint.org)
[![Codeship Status for calblueprint/calblueprint.org](https://codeship.com/projects/c7435d20-76a7-0132-d36d-6a08ddb55576/status?branch=main)](https://codeship.com/projects/55283)

## Contributing

### Development Dependencies

- Docker

### Application Dependencies

- Ruby `v2.6.5`
- Rails `v5.2.0`

## Install Dependencies

1. Install [Docker](https://www.docker.com/get-started/) (Docker will run ruby and postgres, but there is no need to install these on your own machine).

### Run Server

Run setup script

```bash
cd calblueprint.org # Go to workspace directory
docker compose up # Run docker
```

Visit [localhost:3000](localhost:3000) to view the website.
Note: It can take around 30s after the bpsite docker service starts running for the website to be viewable because the database takes a while to setup.

## Cal Blueprint
![screenshot 2015-12-24 16 43 33](https://user-images.githubusercontent.com/5278006/32311415-bcdef6f6-bf55-11e7-9e8c-e43e786685cf.png)


**[Cal Blueprint](http://www.calblueprint.org/)** is a student-run UC Berkeley organization devoted to matching the skills of its members to our desire to see social good enacted in our community. Each semester, teams of 4-5 students work closely with a non-profit to bring technological solutions to the problems they face every day.

## License

![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
This work is licensed under a [Creative Commons Attribution 3.0 Unported
License](http://creativecommons.org/licenses/by/3.0/deed.en_US)
