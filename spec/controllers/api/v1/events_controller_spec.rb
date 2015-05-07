require "rails_helper"

RSpec.describe Api::V1::EventsController, type: :controller do

  it "index" do
    VCR.use_cassette("events") do 
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
                 organization_id: 2, 
                 image_url: "http://www.thebookstoreinthegrove.com/wp-content/uploads/2015/03/BooksDonationBox_C_t670.jpg",
                 business_id: 1 )
      get :index, format: :json
      expect(response.status).to eq(200)
      events = JSON.parse(response.body)
      event = events.first
      expect(event['name']).to eq("Book Drive for kids and Book Club for adults!")
    end
  end
end
