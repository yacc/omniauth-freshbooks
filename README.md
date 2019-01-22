# OmniAuth FreshBooks OAuth2

This is the OmniAuth OAuth2 strategy for authentication to [FreshBooks](https://www.freshbooks.com/api/authentication).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-freshbooks'
```

And then, you need to add the following to your `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :freshbooks, ENV['FRESHBOOKS_KEY'], ENV['FRESHBOOKS_SECRET']
end
```

## Credits
From an original implementaiton from `KP Software Solutions`.
