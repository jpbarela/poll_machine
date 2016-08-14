# Poll Machine

## Summary 
Poll machine is an app for generating simple polls. It supports user logon and anonymous polls.

## Dependencies 
Poll Machine relies on Postgres and Redis. Make sure both are running on your local machine before starting Poll 
Machine. 

## Installation
To install Poll Machine:
1. Clone the Repo
2. Run ``bundle install``
3. Run ``rake db:setup``

## Deployment
Poll Machine is deployed to Heroku at pollmachine.herokuapp.com. 