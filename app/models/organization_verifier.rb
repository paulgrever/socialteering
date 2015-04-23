class OrganizationVerifier
  attr_reader :verified, :data

  def initialize(ein)
    @ein = ein
    fetch_data
  end


private

  def fetch_data
    response = Faraday.get("https://projects.propublica.org/nonprofits/api/v1/organizations/#{@ein}.json")
    if response.status == 200
      @data = parse_response(response)
      @verified = true
    else 
      @verified = false
    end
  end

  def parse_response(response)
    parsed = JSON.parse(response.body)
    { verified: true,
      name: parsed["organization"]["name"] ,
      address: parsed["organization"]["address"],
      city: parsed["organization"]["city"],
      state: parsed["organization"]["state"],
      zipcode: parsed["organization"]["zipcode"],
      careofname: parsed["organization"]["careofname"],
      organization_type: parsed["organization"]["organization_code"],
      stein: parsed["organization"]["id"].to_s
       }

  end




end