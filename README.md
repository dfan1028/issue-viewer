# E Z P Z Setup:

1. Install Docker. I recommend the desktop app: https://www.docker.com/products/docker-desktop
2. Make sure `docker-compose` is installed: https://docs.docker.com/compose/install/
3. Now start it up, it should automatically build on first run `docker-compose up`
4. Initialize the database: `docker-compose run web rake db:create db:migrate`
5. Visit `0.0.0.0:3000` in your browser and browse away!

# Future Considerations:

Set up webhooks to listen for changes in access to repos and issue updates so we don't need to waste network calls fetching so frequently while also conserving api rate limited calls (max of 5000 per hour)

Api profiles can be pulled out and separated from user. Just trying not to overengineer atm

Api tokens stored on user should be encrypted data


For the purposes of this application, 5000 rate limit per hour per authenticated user is more than enough to warrant




# Design Decisions:

Stored everything in postgres

I thought of just caching everything in redis but caches should not be assumed as permanent. As the application scales with more users and data, it becomes unfeasible to keep everything in cache.

Downside to this is that we have to "sync" data, repos and issues can be created/changed/deleted

After the first fetch on auth, data fetching is only upon request.

We still have data to display even if any github services goes down and don't need to rely on cache stores.

Thinking of future considerations to manage this on a bigger scale is to listen for github webhooks and update data in background jobs



auth

if user has no repos
  loop through repos, store and update
  client.repos.map(:id)
  user.repositories
end


1. finish issues fetching
2. specs/circle
3. readme documentation
4. finish UI misc (breadcrumbs/nav)
5. cache json responses
6. 404 page
7. error handling w/oauth and api calls
8. serialize data
9. paging
10. secret key base for kookies
11. metadata stuff and favicon
