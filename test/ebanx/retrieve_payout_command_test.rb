require_relative '../test_helper'

describe Ebanx::Command::PayoutRetrieve do
  it "can't run without arguments" do
    lambda { ebanx.do_payout_retrieve }.must_raise ArgumentError
  end
end
