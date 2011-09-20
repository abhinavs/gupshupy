require 'test_helper'

class ActsAsGupshupyTest < ActiveSupport::TestCase
  test "default_mobile_field_should_be_mobile_number" do
    assert_equal "mobile_number", User.mobile_number_field
  end

  test "mobile_field_should_be_phone_number" do
    assert_equal "phone_number", Company.mobile_number_field
  end

  test "should_require_userid" do
    assert_raises RuntimeError do
      Company.send(:acts_as_gupshupy, :password => 'jjjf')
    end
  end

  test "should_require_password" do
    assert_raises RuntimeError do
      Company.send(:acts_as_gupshupy, :userid => '123')
    end
  end

  test "should_not_send_sms" do
    assert_raises Exception do
      u = User.new(:mobile_number => "9900990099")
      u.send_sms("It's my life")
    end
  end

end
