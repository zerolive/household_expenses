# Household expenses
Is a web application for manage your shared household expenses with your mates.

#Installation
You need install Ruby 2.4.0
After you have to install bundle gem with:

```
gem install bundle
```

At the end run the next command:

```
bundle install
```

# Run app
For run the application you have to run the next command:

In local machine:

```
bundle exec rake up
```

With docker:

```
docker-compose up --build
```

You can access to the application openning in your browser:

```
http://localhost:6001
```

# Run test
For run the tests you have start the application and after that you have to run the next commands:

In local machine:

```
bundle exec rake
```

With docker:

```
docker-compose exec hoex bundle exec rake
```

# CI and autodeploy in demo-environment

When you push a commit, Travis CI run the tests, when it pass all the test, Heroku auto deploy the new commit to demo environment.