FactoryGirl.define do
  factory :event do
    name "Event Name"
    event_date "2016-01-21"
    event_start "2000-01-01 18:00:00"
    event_end "2000-01-01 17:00:00"
    address "1510 Blake St"
    city "Denver"
    state "CO"
    zipcode "80202"
    short_description "This is short descrtiption"
    long_description "This is long descrtipion"
  end
end
