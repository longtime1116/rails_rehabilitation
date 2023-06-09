require 'test_helper'

class CreatorTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @params = { user_id: @user.id }
  end
  test 'ペンネームが10文字より多いと落ちる' do
    @params[:pen_name] = 'a' * 11
    assert_not(Creator.new(@params).save)
  end

  test 'ペンネームが10文字以下ならOK' do
    @params[:pen_name] = 'a' * 10
    assert(Creator.new(@params).save)
  end

  test 'ペンネームは空でもOK' do
    @params[:pen_name] = ''
    assert(Creator.new(@params).save)
  end
end
