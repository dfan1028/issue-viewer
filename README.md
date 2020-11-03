# Github Issue Viewer 

[![CircleCI](https://circleci.com/gh/dfan1028/issue-viewer.svg?style=svg)](https://circleci.com/gh/dfan1028/issue-viewer)

Hi there, you're probably wondering how you got here. Well no worries, I can for sure tell you that you don't even need Github anymore to view your issues, cause this application is all you need!

## Setup

Steps to get up and running:
1. Docker. I recommend the desktop app: https://www.docker.com/products/docker-desktop
2. Docker compose: https://docs.docker.com/compose/install/ (This should come with the Docker desktop app on MacOS)
3. Make sure you're in the application directory and run `docker-compose up`
4. After everything starts up, you may visit `0.0.0.0:3000` but it should now say database is missing. Let's remedy that. Please run `docker-compose run web rake db:create db:migrate`, it may take a hot minute to complete.
5. Refresh `0.0.0.0:3000` in your browser and now you're good to go!

## Run Specs

1. Go inside the application container `docker exec -t issue-viewer_web_1 sh`
2. `RAILS_ENV=test rspec`

## Future Technical Considerations

- Webhooks can be set up for creating and updating repositories and issues for a github user, to supplement fetching
- Data fetching should be done in background jobs so it doesn't hold up web requests
- Instead of storing `auth_token` on `User`, that could be
- `Devise` can be handle more methods of authenticating, as well as permissions, if further types of users need to be added
- `auth_token` stored on `User` should be encrypted. We should not be storing super sensitive data as-is, even in the database
- Add mechanism for refreshing expired tokens
- Add mechanism for rate limiting (Github allows 5000 calls per hour for authenticated requests)

## Desired Additions

- Favicon, other metadata
- Translations
- Breadcrumbs and proper navigation bar
