# ruby-api.pathwar.net
[![Code Climate](https://codeclimate.com/github/pouleta/ruby-api.pathwar.net/badges/gpa.svg)](https://codeclimate.com/github/pouleta/ruby-api.pathwar.net)

## Features
- You can validate a coupon via ```send_coupon(coupon)```

## Examples
```ruby
api = ApiPathwarNet.new('login', 'password', 'organisation-id')
api.send_coupon('yololo')
```
