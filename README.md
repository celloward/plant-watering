# Tandem Plant Watering Schedule
This is a solution to the Tandem Software Apprenticeship Application. As stated in the challenge guidelines, "Your goal is to create an application that generates a watering schedule for the next 12 weeks for all of our plants." The following assumptions and acceptance criterion were provided:

* Project Assumptions
  * We do not water our plants on a weekend. Work-life balance is important, and we shouldn't be in the office on a weekend.
  * Our plants are reasonably tolerant and will still be happy if they are watered a day before or after the day they should be watered.
  * Watering an individual plant takes no time at all so you don't have to worry about how many plants can be watered in a particular day.
  * The scheduling should start from next Monday (12/16/2019) and last for 12 weeks.
  * All plants will be watered on the first day of the schedule (next Monday).
  * We recognize that when to water a plant is heavily dependent on other factors such as soil, weather, humidity, etc. You can assume that we know exactly when to water these specific plants.
  * You have been provided a JSON file which contains data for our plants.

* Acceptance Criterion
  * The user can view which plant(s) to water on which date(s).
  * The schedule covers the next 12 weeks starting next Monday.
  * No plants are watered on Saturdays or Sundays.
  * Each plant is watered on its desired schedule or as close as possible, taking into account weekends.

## Installation
  This app can be installed by cloning the repository from the command line as follows:
  ```
    $ git clone git@github.com:celloward/plant-watering
  ```
### Dependencies
  This app was developed with <a href="https://www.ruby-lang.org/en/documentation/installation/">Ruby 2.5.1</a> and <a href="https://guides.rubyonrails.org/v5.0/getting_started.html">Rails 5</a> and requires these to run. The other dependencies are packaged in the `./Gemfile` and can be installed using Bundler with the command:
  ```
    $ bundle install
  ```
## Setup
  Once the file system and dependencies are installed, the database can be reset with current data through:
  ```
  $ rake db:reset
  ```
## Run
  To run the app in a web browser, enter into the command line:
  ```
  $ rails server
  ```
  Open the web browser of choice and enter the url `http://localhost:3000/`
  The full calendar of the schedule as well as an agenda for the day's watering will appear.
  To terminate the rails server, press `Ctrl+C` in the command line window running the local server.

## Features
  The calendar has links to each day's watering needs.

  The schedule can be updated or modified in line 5 of the `db/seeds.rb` file in the following ways:

  * To use different plant data:
  1. Add a JSON file with that data to the `db/` folder (Ensuring that the hash that has been serialized is in the form `{ "name"=>"<string>" , "water_after"=>"<string_number days>" }` i.e. `{ "name"=>"Money Tree", "water_after"=>"3 days" }`).
  2. change the filename to point to the new file name in line 5 as follows:
  ```
    seed_data = Scheduler.new("db/<new_filename>"...
  ```

  * To change the start date of the schedule, change the second argument in line 5 to the desired date as a string in the form "Year-Month-Day"
  ```
    seed_data = Scheduler.new("db/<filename>", "<Year-Month_Day>"...
  ```

  * To change the duration of the schedule, change the third argument in line 5 to the number of weeks (as an integer) from the start date:
  ```
    seed_data = Scheduler.new("db/<filename>", "<Year-Month_Day>", <number_of_weeks>)
  ```

  **After every change, run `rake db:reset` to update the database.**

## Structure
  The database watering schedule is populated through the `db/seeds.rb` file. This file depends upon the Scheduler class defined in `lib/scheduler.rb` to parse the JSON file and generate the dates for watering. The interface is provided through the web browser rendering the embedded Ruby HTML in the `app/views/` folder. This folder along with `app/models/schedule.rb` and `test/models/schedule_test.rb` make use of the helper methods found in `app/helpers/schedules_helper.rb`.

# Testing
  All tests for the application, located in the `test/` folder, will be run with the command
  ```
  $ rake test
  ```

## Future Features
The following features are desired to improve the functionality of the app in future development:
* Eliminate the step of chaging the filename in `db/seeds.rb`. This can be done by changing the format of the Scheduler class to automatically read whatever .json file is in the `db/` folder.
* Checkboxes for the daily agenda so that the person watering can check off what plants have been watered.
* A running queue of which plants in previous days haven't been checked off so that they are displayed in red on subsequent daily agendas until they are checked off.
* Reduce the number of calls on the database from the home page by storing the calls for `@schedule.today` in a variable.
* A calendar on the homepage that shows one month at a time and can scroll from month to month with a button.