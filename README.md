# EBANX Ruby gem [![Build Status](https://travis-ci.org/ebanx-integration/ebanx-ruby.svg?branch=master)](https://travis-ci.org/ebanx-integration/ebanx-ruby) [![Code Climate](https://codeclimate.com/github/ebanx-integration/ebanx-ruby/badges/gpa.svg)](https://codeclimate.com/github/ebanx-integration/ebanx-ruby) [![Test Coverage](https://codeclimate.com/github/ebanx-integration/ebanx-ruby/badges/coverage.svg)](https://codeclimate.com/github/ebanx-integration/ebanx-ruby/coverage)

Gem to communicate with EBANX Pay.

Documentation: https://developers.ebanxpagamentos.com/

## Installation

Add this line to your application's Gemfile, and bundle it:

```
gem 'ebanx'
$ bundle
```

Or install it yourself as:

    $ gem install ebanx

## Usage

#### Auth
```ruby
Ebanx.tap do |e|
  e.integration_key = '<<< Your integration key >>>'
  e.test_mode       = true
end
```

#### Create a new Boleto using Direct API
```ruby
response = Ebanx.do_direct(
  operation: 'request',
  mode: 'full',
  payment: {
    name: 'João da Silva',
    email: 'joao@mailinator.com',
    currency_code: 'BRL',
    amount_total: 100.50,
    merchant_payment_code: Random.rand(10000000000),
    payment_type_code: 'boleto',
    person_type: 'personal',
    document: '13326724691',
    birth_date: '01/01/1980',
    zipcode: '70000-000',
    address: 'Rua Brasil',
    street_number: '1',
    city: 'Brasília',
    state: 'DF',
    country: 'br',
    phone_number: '6130001111',
    due_date: (Time.now + 86400).strftime('%d/%m/%Y')
  }
)

```

#### Create a new Boleto with split rules using Direct API
```ruby
response = Ebanx.do_direct(
  operation: 'request',
  mode: 'full',
  payment: {
    name: 'João da Silva',
    email: 'joao@mailinator.com',
    currency_code: 'BRL',
    amount_total: 100.50,
    merchant_payment_code: Random.rand(10000000000),
    payment_type_code: 'boleto',
    person_type: 'personal',
    document: '13326724691',
    birth_date: '01/01/1980',
    zipcode: '70000-000',
    address: 'Rua Brasil',
    street_number: '1',
    city: 'Brasília',
    state: 'DF',
    country: 'br',
    phone_number: '6130001111',
    due_date: (Time.now + 86400).strftime('%d/%m/%Y'),
    split: [
      {
        recipient_code: "me",
        percentage: 50,
        liable: true,
        charge_fee: true
      },
      {
         recipient_code: "other-one-recipient",
         percentage: 50,
         liable: false,
         charge_fee: false
       }
    ]
  }
)

```

## Automated Tests
We use minitest for testing this Gem.

```
rake test
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
