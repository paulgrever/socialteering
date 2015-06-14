### Socialteering

Volunteer organizations are missing out with millenial volunteers. Many volunteer organizations are difficult to join and require long term time commitements. 

Socialteering makes it easy for Nonprofits to curate one time social volunteering opportunities. Volunteers can sign up for events which are paired with a social activity. *Example: Graffiti removal at Lowell School followed by coffee at Zoma*

#### A win, win, win: 

* Users 
  * Volunteer without long term committment.
  * Get a chance to meet like minded volunteers and socialize with them. 

* Nonprofits 
  * Collect information on volunteers interested in their cause for future recruitement/donations.
  * Complete work for the immediate community. 

* Business
  * Support the local community. 
  * Gain business during off peak hours. 
  * Obtain tax information regarding the work you have supports. 

[Visit Us Online](https://socialteering.herokuapp.com/)


### Project Dependencies

* Yelp -- required for business geolocating -- needs `yelp_consumer_key`, `yelp_consumer_secret`, `yelp_token`, and `yelp_token_secret` ENV vars
* Facebook -- used oauth authentication -- needs `facebook_key` and `facebook_secret` ENV vars
* Bing Maps -- used geolocating volunteering events -- needs `bing_map_key` ENV vars
* Google Maps Iframe -- used for displaying walking directions from volunteering event to business --needs -- `google_map_key`


### Heroku

This application is already deployed to [heroku](https://socialteering.herokuapp.com/)


### Testing

This project uses RSpec for its test suite. Run the tests with `rake`, `rake spec`, or `rspec`.


