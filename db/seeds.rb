class Seed

  def call
    generate_users
    generate_organizations
  end

  def generate_users
    User.create(first_name: "Paul",
                last_name: "Grever",
                email: "pg5374a@american.edu",
                phone_number: "6082392471",
                provider: "facebook",
                uid: "10100954511707755" ,
                token: "CAAI5IzLpg9sBAP3bX40Ys45FvdhThJyPMU53l9qnoNNQWssXb5m0DsBDoulYB0rmCDNMZBWjna4HMmmmb005YxpYZAt2jFjDB5JZAImvaTLUhOpVuSVfS5tbbadQ3nkbZAR7nJJjtxZAiV57y1uZAgRrhrGQSZA9GlbvA1vSHA6Pv9QX8uFL5cEvNzqxZACqcwBSqS8BUZApnIpSkQzZCbDTG7",
                image: "http://graph.facebook.com/10100954511707755/picture" ,
                full_name: "Paul Grever",
                location: "Denver")
    30.times do 
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      User.create(first_name: first_name,
                last_name: last_name,
                email: Faker::Internet.email,
                phone_number: Faker::PhoneNumber.cell_phone,
                provider: "facebook",
                uid: Faker::Number.number(17),
                token: Faker::Bitcoin.address,
                image: Faker::Avatar.image("my-own-slug", "25x25"),
                full_name: "#{first_name} #{last_name}",
                location: Faker::Address.city)
    end
  end

  def generate_organizations
    paul = User.find_by(email: "pg5374a@american.edu")
    Organization.create(ein: 43839260,
                        website: "http://www.scleadershipacademy.org/",
                        user_id: paul.id,
                        facebook_url: "https://www.facebook.com/SCLeadershipAcademy",
                        twitter_url: "https://twitter.com/sportchallenge",
                        description: "We believe sports are an optimal venue for teaching leadership lessons. 
                                      Nothing compares to the teachable leadership moments that exist every practice and game. 
                                      Sports are often the first opportunity young students have to develop leadership skills. 
                                      We strongly believe that with highly specialized leadership training, these athletes can 
                                      develop into more complete and effective leaders",
                        email: "admin@scleadershipacademy.org",
                        phone_number: "410.924.8691",
                        google_plus_url: "https://www.youtube.com/user/SportsChallenge1")
    
    Organization.create(ein: 10663760,
                        website: "http://www.rmsplash.org/",
                        user_id: paul.id,
                        facebook_url: "https://www.facebook.com/RMSplash",
                        twitter_url: "https://flowh.com/#!/rmsplash",
                        description: "We are a nationally competitive Synchronized Swim team based in Denver, Colorado.
                                      We are currently the highest ranked team in Colorado with 40 swimmers ranging in
                                      age from 6 to 18, and a staff of 10 coaches",
                        email: "rmsplash@gmail.com",
                        phone_number: "410.924.8691",
                        google_plus_url: "https://www.youtube.com/user/SportsChallenge1")
    Organization.create(ein: 203533527,
                        name: "Grow Haus",
                        website: "http://www.thegrowhaus.org/",
                        user_id: paul.id,
                        facebook_url: "http://www.facebook.com/thegrowhaus",
                        twitter_url: "https://twitter.com/TheGrowHaus",
                        description: "The GrowHaus is a nonprofit indoor farm in Denver's Elyria-Swansea neighborhood.
                        Our vision is to catalyze a neighborhood-based food system in our community that is healthy, equitable,
                        and resident-driven",
                        email: "REACHOUT@THEGROWHAUS.ORG",
                        phone_number: "720-515-4751",
                        google_plus_url: "http://instagram.com/thegrowhaus")
  end

  def self.call
    new.call
  end
end

Seed.call
