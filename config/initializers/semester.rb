# Create semester based on current date on initialize
today = Date.today
year = today.year
season = today.month < 6 ? :spring : :fall
Semester.create year: year, season: season
