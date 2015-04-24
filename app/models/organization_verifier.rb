class OrganizationVerifier
  attr_reader :verified, :response

  def initialize(ein)
    @ein = ein
    fetch_data
  end

  def validate_response?
    response.status == 200
  end

  def fetch_data
    @response = Faraday.get("https://projects.propublica.org/nonprofits/api/v1/organizations/#{@ein}.json")
  end

  def parse_response
    parsed = JSON.parse(@response.body)
    { verified: true,
      name: parsed["organization"]["name"],
      address: parsed["organization"]["address"],
      city: parsed["organization"]["city"],
      state: parsed["organization"]["state"],
      zipcode: parsed["organization"]["zipcode"],
      careofname: parsed["organization"]["careofname"],
      organization_type: parsed["organization"]["ntee_code"][0..2],
      stein: parsed["organization"]["id"].to_s
       }
  end
end