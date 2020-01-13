# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'John Doe', email: 'user@mail.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end
end
