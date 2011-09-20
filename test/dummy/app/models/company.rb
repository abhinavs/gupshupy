class Company < ActiveRecord::Base
  acts_as_gupshupy :mobile_number_field => 'phone_number', :userid => '12', :password => 'jdjdjd'
end
