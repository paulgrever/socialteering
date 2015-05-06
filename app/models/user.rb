class User < ActiveRecord::Base
  validates :email, :provider, :uid, :token, presence: true
  validates_format_of :email, with: /@/
  has_many :organizations
  has_many :user_events
  has_many :events, through: :user_events

    
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.provider = auth.provider
    user.uid = auth.uid
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.token = auth.credentials.token
    user.email = auth.info.email
    user.location = auth.info.location
    user.image = auth.info.image
    user.login = auth.info.verified

    user.full_name = auth.info.name
    user.gender = auth.extra.raw_info.gender
    user.facebook_page = auth[:info][:urls][:Facebook]
    user.save
    user
  end
end
