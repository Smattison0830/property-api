# Readme for property-api:
 
Ruby version:
* Ruby 3.3.8
* Rails 8.0.1

Generated with:
* rails new app_name --api --database=postgresql

Database created with:
* rails db:create db:migrate db:seed
* Added 3 seeds to easily check API endpoints
* First object ID is: 74084205-0e7f-4220-8ede-51a3544c8ec1

Import Properties from a csv using the service described below:
* To use the import property csv function, add the csv to db/test_data and name the file test_data.csv.

Run the below in console:
* rails import:properties

How to run the tests:
* rake

Opening a pull request:
Before opening a pull request make sure the below pass testing:  
  * Run 'rake' and make sure all the tests are green.
  * Run rubocop and make sure all the new files are following the rubocop lint.

Documentation used to build:

* guides.rubyonrails.org/ - Used as a reference for all things ActiveRecord(Migrations, Validations, Callbacks, others).
* api.rubyonrails.org/ - For information about RoR methods
* Google - For coding conventions and help with best practices in RoR
* Chatgpt - Same as above






