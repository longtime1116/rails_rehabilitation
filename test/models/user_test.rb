require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com', password: 'foobar',
                     password_confirmation: 'foobar')
  end
  test 'password_digest に値が入って、password にアクセスできなくなる' do
    assert_equal('foobar', @user.password)
    @user.save
    assert_nil(User.find(@user.id).password)
  end
end
