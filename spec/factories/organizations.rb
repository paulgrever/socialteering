FactoryGirl.define do
  factory :organization do
    ein 142007220
    name "PRO PUBLICA INC"
    stein "142007220"
    careofname "Paul"
    address "ONE EXCHANGE PLZ 55 BROADWAY 23 FL"
    city "NEW YORK"
    state "NY"
    zipcode "10006-0000"
    organization_type "A20"
    user
  end

  factory :incomplete_organization, class: Organization do
    ein 142007220
    name "PRO PUBLICA INC"
    stein "142007220"
    careofname "Paul"
    address "ONE EXCHANGE PLZ 55 BROADWAY 23 FL"
    city "NEW YORK"
    state "NY"
    zipcode "10006-0000"
    organization_type "A20"
    user
  end
end
