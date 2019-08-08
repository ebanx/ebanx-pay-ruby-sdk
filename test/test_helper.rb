if ENV['CODECLIMATE_REPO_TOKEN']
  require 'simplecov'
  SimpleCov.start
end

require 'ebanx'
require 'ebanx/command/whitelisted_commands'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

class MiniTest::Spec
  def ebanx
    skip unless is_a_whitelisted_command?

    Ebanx.tap do |e|
      e.integration_key = ENV.fetch('INTEGRATION_KEY')
      e.test_mode = true
    end
  end

  def is_a_whitelisted_command?
    Ebanx::Command::WHITELISTED_COMMANDS.map(&:name).include? self.class.name
  end
end
