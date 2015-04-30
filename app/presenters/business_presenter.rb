class BusinessPresenter
  extend Forwardable

  attr_reader :business

  def initialize(business)
    @business = business
  end

  def phone_view
    if @business.respond_to?(:display_phone)
      display_phone
    elsif @business.respond_to?(:phone)
      phone
    else
      "Phone number is not provided"
    end
  end
end