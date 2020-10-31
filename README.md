# Setup:

1. Install Docker. I recommend the desktop app: https://www.docker.com/products/docker-desktop
2. Make sure `docker-compose` is installed: https://docs.docker.com/compose/install/
3. Now start it up, it should automatically build on first run `docker-compose up`
4. Initialize the database: `docker-compose run web rake db:create && rake db:migrate`
