FactoryGirl.define do
  factory :userlog do
    user_id 1
    action "MyString"
    loggable_type "MyString"
    loggable_id 1
    logdate "2016-12-07 20:20:18"
  end
end
