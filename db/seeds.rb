class Seed

  def call
    generate_users
    generate_organizations
    generate_businesses
    generate_events
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
    Organization.create(ein: 30463305,
                        name: "BOOKS FOR AMERICA INC",
                        stein: "30463305",
                        careofname: "% STEPHEN HERSEY",
                        address: "1417 22ND ST NW",
                        city: "WASHINGTON",
                        state: "DC",
                        zipcode: "20037-1002",
                        organization_type: "B70",
                        phone_number: "202.835.2665",
                        email: "info@booksforamerica.org",
                        verified: true,
                        user_id: paul.id,
                        facebook_url: "https://www.facebook.com/BooksforAmerica",
                        twitter_url: "https://twitter.com/booksforamerica",
                        google_plus_url: "https://twitter.com/booksforamerica",
                        description: "Building and improving libraries in schools,
                        shelters, prisons and more.\r\nSupporting reading and education programs.
                        \r\nProviding children with their first take-home books.",
                        website: "http://www.booksforamerica.org/")
  Organization.create(ein: 20716722,
                      name: "TOASTMASTERS INTERNATIONAL",
                      stein: "20716722",
                      careofname: "% KATHLEEN L WOLFORD",
                      address: "6842 RAVENCREST DR",
                      city: "COLORADO SPRINGS",
                      state: "CO",
                      zipcode: "80919-1957",
                      organization_type: nil,
                      phone_number: "+1 949-835-1305",
                      email: "dolson@toastmasters.org",
                      verified: true,
                      user_id: paul.id,
                      facebook_url: "http://www.facebook.com/pages/Toastmasters-International/112586172111758",
                      twitter_url: "https://twitter.com/Toastmasters",
                      google_plus_url: "http://www.youtube.com/user/Toastmasters",
                      description: "Do you want to become a confident public speaker and strong leader?
                       If so, Toastmasters is the place FOR you. You’ll find a supportive learn-by-doing environment that allows you to achieve your goals at your own pace.
                       Learn how Toastmasters has changed the lives of members.",
                      website: "https://www.toastmasters.org/")
    Organization.create(ein: 455318402,
                        name: "KIDS AGAINST HUNGER - DENVER",
                        stein: "455318402",
                        careofname: "% KENWARD BRADLEY",
                        address: "PO BOX 101535",
                        city: "DENVER",
                        state: "CO",
                        zipcode: "80250-1535",
                        organization_type: "K30",
                        phone_number: "303.478.9888",
                        email: "info@cofeedingkids.org",
                        verified: true,
                        user_id: paul.id,
                        facebook_url: "https://www.facebook.com/kidsagainsthunger",
                        twitter_url: "https://twitter.com/kahfeeds",
                        google_plus_url: "http://www.kahdenver.com/2014-08-22-16-17-50",
                        description: "We purchase rice, soy, dehydrated vegetables,
                         macaroni and vitamins in bulk.\r\nWe solicit donations to pay for 
                         the food.\r\nWe solicit volunteers to repackage the food into 6-meal
                          bags.\r\nWe give the food away to those in need, especially children.",
                        website: "http://www.kahdenver.com/")
  end

  def generate_businesses
    Business.create(name: "The GrowHaus",
                    distance: 4.79142170460158, 
                    url: "http://www.yelp.com/biz/the-growhaus-denver",
                    address: "The GrowHaus",
                    latitude: 39.7826999, 
                    longitude: -104.9598726, 
                    phone: "7205154751", 
                    display_phone: "+1-720-515-4751", 
                    image_url: "http://s3-media2.fl.yelpcdn.com/bphoto/9BGnaaYA7Uz-WHXE0h_UiQ/ms.jpg")
    Business.create(name: "Kramerbooks & Afterwords Cafe & Grill",
                    distance: 481.728938102455,
                    url: "http://www.yelp.com/biz/kramerbooks-and-afterwords-cafe-and-grill-washington-2" ,
                    address: "Kramerbooks & Afterwords Cafe & Grill",
                    latitude: 38.91082,
                    longitude: -77.043747,
                    phone: "2023873825",
                    display_phone: "+1-202-387-3825",
                    image_url: "http://s3-media3.fl.yelpcdn.com/bphoto/zo33fD6Xdb9ZsqhDWH2B6A/ms.jpg")
    Business.create(name: "Cleats Bar & Grill",
                    distance: 841.934812433699,
                    url: "http://www.yelp.com/biz/cleats-bar-and-grill-colorado-springs" ,
                    address: "Cleats Bar & Grill",
                    latitude: 38.9274673,
                    longitude: -104.8302917,
                    phone: "7195488267",
                    display_phone: "+1-719-548-8267",
                    image_url: "http://s3-media4.fl.yelpcdn.com/bphoto/ZzkHWrbn9SIlm-uNTwLOTg/ms.jpg")
    Business.create(name: "Cowbobas",
                    distance: 1672.00952701598,
                    url: "http://www.yelp.com/biz/cowbobas-denver",
                    address: "Cowbobas",
                    latitude: 39.6787643,
                    longitude: -105.0245209,
                    phone: "3039343301",
                    display_phone: "+1-303-934-3301",
                    image_url: "http://s3-media2.fl.yelpcdn.com/bphoto/MTThJm_66pwNq04064lJIg/ms.jpg")
    Business.create(name: "Modell's Sporting Goods",
                    distance: 503.167807497727,
                    url: "http://www.yelp.com/biz/modells-sporting-goods-washington-3",
                    address: "Modell's Sporting Goods",
                    latitude: 38.929501,
                    longitude: -77.033577,
                    phone: "2022991003",
                    display_phone: "+1-202-299-1003",
                    image_url: "http://s3-media3.fl.yelpcdn.com/bphoto/p6-XO9CZ1srrK2H5RgBb8g/ms.jpg")
  end

  def generate_events
    org = Organization.find_by(ein: 203533527)
    org2 = Organization.find_by(ein: 30463305)
    org3 = Organization.find_by(ein: 20716722)
    org4 = Organization.find_by(ein: 455318402)
    org5 = Organization.find_by(ein: 43839260 )
    biz = Business.find_by(name: "The GrowHaus")
    biz2 = Business.find_by(name: "Kramerbooks & Afterwords Cafe & Grill")
    biz3 = Business.find_by(name: "Cleats Bar & Grill")
    biz4 = Business.find_by(name: "Cowbobas")
    biz5 = Business.find_by(name: "Modell's Sporting Goods" )

    Event.create(name: "Community Harvest & Fresh Produce Tasting",
                 short_description: "Help us harvest the community garden. Then taste the freshest produce ever!",
                 long_description: "Help us harvest the community garden. Then taste the freshest produce ever!",
                 event_date: "2015-05-15",
                 event_start: "2000-01-01 02:30:00",
                 event_end: "2000-01-01 05:00:00",
                 address: "4751 York S",
                 city: "Denver",
                 state: "CO",
                 zipcode: "80216",
                 latitude: 39.6929588317871,
                 longitude: -104.960578918457,
                 organization_id: org.id, 
                 image_url: "http://www.growingraw.com/images/vegetable-garden-for-kids-picking-peas.jpg",
                 business_id: biz.id )
    Event.create(name: "Book Drive for kids and Book Club for adults!",
                 short_description: "Help us harvest the community garden. Then taste the freshest produce ever!",
                 long_description: "Help us harvest the community garden. Then taste the freshest produce ever!",
                 event_date: "2015-08-08",
                 event_start: "2000-01-01 03:00:00",
                 event_end: "2000-01-01 06:00:00",
                 address: "1417 22nd St NW",
                 city: "Washington",
                 state: "DC",
                 zipcode: "20037",
                 latitude: 38.9088267087936,
                 longitude: -77.0487425476313,
                 organization_id: org2.id, 
                 image_url: "http://www.thebookstoreinthegrove.com/wp-content/uploads/2015/03/BooksDonationBox_C_t670.jpg",
                 business_id: biz2.id )
    Event.create(name: "Public Speaking class followed by beer Toasts.",
                 event_date: "2015-06-12", 
                 event_start: "2000-01-01 07:00:00", 
                 event_end: "2000-01-01 10:00:00", 
                 address: "6842 RAVENCREST DR", 
                 city: "Colorado Springs", 
                 state: "CO", 
                 zipcode: "80919-1957", 
                 latitude: 38.9295768737793, 
                 longitude: -104.82096862793, 
                 organization_id: org3.id,
                 short_description: "Toastmasters helps promote public speaking skills. Learn what our organization is about, then practice what you preach(literally) by making a toast to your new friends.",
                 long_description: "Toastmasters helps promote public speaking skills. Learn what our organization is about, then practice what you preach(literally) by making a toast to your new friends.",
                 image_url: "https://xotheknot.files.wordpress.com/2012/11/best-man-making-a-speech.jpg?w=650",
                 business_id: biz3.id)
    Event.create(name: "Food packing for hungry kids and packing in some food!",
                 event_date: "2015-05-28",
                 event_start: "2000-01-01 01:00:00",
                 event_end: "2000-01-01 04:00:00",
                 address: " 2830 S Zuni st",
                 city: "Englewood",
                 state: "CO",
                 zipcode: "80250",
                 latitude: 39.6654664725065,
                 longitude: -105.015679299831,
                 organization_id: org4.id,
                 short_description: "There are 1,000,000,000 people hungry around the world (per WHO) and 815,000 hungry in Colorado (2011).",
                 long_description: "14,400 children die each day from hunger or related disease (per WFP).\r\nThere are 1,000,000,000 people hungry around the world (per WHO) and 815,000 hungry in Colorado (2011).\r\n1 in 7 or 14% of Coloradans worry about food.\r\n23% of Colorado households report food hardships.\r\nYou can change lives with this food.\r\n\r\nHelp Us Pack food then enjoy a community style dinner!",
                 image_url: "http://traverse.npolar.no/expedition-diary/archive/2008/11/images/nov-2-mcmurdo/image_preview.jpg",
                 business_id: biz4.id)
    Event.create(name: "Park clean up and field games",
                 event_date: "2015-07-13",
                 event_start: "2000-01-01 01:00:00",
                 event_end: "2000-01-01 04:00:00",
                 address: "1480 Girard St NW",
                 city: "Washington",
                 state: "DC",
                 zipcode: "20009",
                 latitude: 38.9252128601074,
                 longitude: -77.0348281860352,
                 organization_id: org5.id,
                 short_description: "Our annual champion of kids tournament fast approaching and we need Powell Recreation set up for the tournament.",
                 long_description: "Our annual champion of kids tournament fast approaching and we need Powell Recreation set up for the tournament.
                  \r\n\r\nHelp us clean up the park then reach your inner child by participating in field day.",
                 image_url: "http://images.morris.com/images/cjonline/mdControlled/cms/2007/10/21/210552512.jpg",
                 business_id: biz5.id)
    Event.create(name: "Community Harvest & Fresh Produce Tasting",
                 short_description: "Help us harvest the community garden. Then taste the freshest produce ever!",
                 long_description: "Help us harvest the community garden. Then taste the freshest produce ever!",
                 event_date: "2016-02-24",
                 event_start: "2000-01-01 02:30:00",
                 event_end: "2000-01-01 05:00:00",
                 address: "4751 York S",
                 city: "Denver",
                 state: "CO",
                 zipcode: "80216",
                 latitude: 39.6929588317871,
                 longitude: -104.960578918457,
                 organization_id: org.id, 
                 image_url: "http://www.growingraw.com/images/vegetable-garden-for-kids-picking-peas.jpg",
                 business_id: biz.id )
  end 

  def self.call
    new.call
  end
end

Seed.call
