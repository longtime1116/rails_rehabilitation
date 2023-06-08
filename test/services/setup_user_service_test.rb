require 'test_helper'

class SetupUserServiceTest < ActiveSupport::TestCase
  def setup
    @params = { name: 'hoge', email: 'hoge@example.com', password: 'hoge', password_confirmation: 'hoge' }
  end
  test 'userとcustomerが同時に作られる' do
    user = SetupUserService.call(@params)
    assert(user.persisted?)
    assert(!!Customer.find_by(user_id: user.id))
  end
end
