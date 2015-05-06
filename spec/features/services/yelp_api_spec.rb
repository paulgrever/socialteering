require "rails_helper"

RSpec.describe YelpService do
  it "can find businesses within a radius" do
    VCR.use_cassette("yelp_searc") do \
      @yelp = YelpService.new
        search_results = @yelp.city_search("Denver")
        expect(search_results.businesses.count).to eq(20)
    end 
  end

  it "returns results within it's search radius" do 
    VCR.use_cassette("yelp_search_via_radus") do 
      @yelp = YelpService.new
      search_results = @yelp.radius_search([39.749568939208984, -104.99996185302734],
                                            "food",
                                            2000,
                                            2)
      expect(search_results.businesses.count).to eq(20)
      expect(search_results.businesses.first.distance).to be < 2000
      expect(search_results.businesses.last.distance).to be < 2000
      results = search_results.businesses.any? {|biz| biz.distance > 2000}
      expect(results).to eq(false)
    end
  end

  it "returns values that meet the search critera" do 
    VCR.use_cassette("yelp_search_via_radus") do 
      @yelp = YelpService.new
      search_results = @yelp.radius_search([39.749568939208984, -104.99996185302734],
                                            "food",
                                            2000,
                                            2)
      results = search_results.businesses.first.categories.join
      expect(results.include?("food")).to eq(true)
    end
  end
end