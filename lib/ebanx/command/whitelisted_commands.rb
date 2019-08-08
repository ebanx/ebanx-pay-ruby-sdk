require_relative 'cancel'
require_relative 'capture'
require_relative 'direct'
require_relative 'print'
require_relative 'query'
require_relative 'refund'
require_relative 'request'
require_relative 'token'
require_relative 'zipcode'

module Ebanx
  module Command
    WHITELISTED_COMMANDS = [
        Ebanx::Command::Cancel,
        Ebanx::Command::Capture,
        Ebanx::Command::Direct,
        Ebanx::Command::Print,
        Ebanx::Command::Query,
        Ebanx::Command::Refund,
        Ebanx::Command::Request,
        Ebanx::Command::Token,
        Ebanx::Command::Zipcode,
        Ebanx::Command,
    ]
  end
end
