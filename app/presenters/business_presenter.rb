module BusinessPresenter

  def display_phone
    self.raw_data['display_phone'] || self.raw_data['display_phone'] = "No Number Provided"
  end

  def image_url
    self.raw_data['image_url'] || self.raw_data['image_url'] = "socialteering_placeholder.png"
  end

end