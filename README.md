# Uber Activity

This simple Sinatra application makes use of the [Uber API](https://developer.uber.com) to show your recent rides information and stats.

:eyes: [Look at the demo](https://uber-activity.herokuapp.com) :car:

## Development

If you want to run this in your development machine, you need to clone this
project, run `bundle install` and create a `.env` file with the following:

```shell
UBER_CLIENT_ID=some-oauth-application-id
UBER_CLIENT_SECRET=some-oauth-secret-key
```

You can get the `client` and `secret` keys after creating an application from the Uber developer page. When creating the App, make sure you check the `history` scope.

When you have your `.env` file ready, you just need to run `rackup` on the root
of the project and go to http://localhost:9292/
