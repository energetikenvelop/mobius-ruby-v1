# Mobius Ruby API Client

The Mobius Ruby Client provides simple access to the Mobius API for applications written on Ruby

## Installation

Install it yourself as:
```
$ gem install mobiusrb
```

Or add this line to your application's Gemfile:
```
gem 'mobiusrb'
```

## Usage

For importing library use:
```ruby
require 'mobiusrb'
```

The library need to be configured with your API secret key which you can create in [Mobius DApp Store](https://mobius.network/store/developer)
```ruby
mobius = Mobius.new(api_key: 'your_api_key')
```

### Examples

Every method returns a chainable promise which can be used like this:

```ruby
data = mobius.app_store.balance(app_uid: 'f9e5e943', email: 'mail@example.com')

if data['num_credits'] > 0
  mobius.app_store.use(app_uid: 'f9e5e943', email: 'mail@example.com', num_credits: 1)
end
```

## Methods

- ##### `mobius.app_store.balance(app_uid:, email:)`
  Get balance of credits for email.

- ##### `mobius.app_store.use(app_uid:, email:, num_credits:)`
  Use numCredits from user with email.

- ##### `mobius.tokens.register(token_type:, name:, symbol:, address:)`
  Register a token.

- ##### `mobius.tokens.balance(token_uid:, address:)`
  Query the number of tokens specified by the token.

- ##### `mobius.tokens.create_address(token_uid:, managed:)`
  Create an address for the token.

- ##### `mobius.tokens.register_address(token_uid:, address:)`
  Register an address for the token.

- ##### `mobius.tokens.transfer_managed(token_address_uid:, address_to:, num_tokens:)`
  Transfer tokens from a Mobius managed address to a specified address.

- ##### `mobius.tokens.transfer_info(token_address_transfer_uid:)`
  Get the status and transaction hash of a Mobius managed token transfer.


## More information

See the [REST API docs](https://mobius.network/docs/)
