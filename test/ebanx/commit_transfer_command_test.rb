require_relative '../test_helper'

describe Ebanx::Command::TransferCommit do
  it "can't run without arguments" do
    lambda { ebanx.do_transfer_commit }.must_raise ArgumentError
  end
end
