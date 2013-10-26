require 'test_helper'

class GoogleauthTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Googleauth.new.valid?
  end
end
