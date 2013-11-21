class Facebooker < ActiveRecord::Base

	has_many :team_leaders
	has_many :workers

	def self.from_omniauth(auth)
	  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |facebooker|
	    facebooker.provider = auth.provider
	    facebooker.uid = auth.uid
	    facebooker.name = auth.info.name
	    facebooker.oauth_token = auth.credentials.token
	    facebooker.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    facebooker.role_type = "Client"
	    facebooker.location = auth.info.location
	    facebooker.gender = auth.extra.raw_info.gender
	    facebooker.image = auth.info.image
	    facebooker.save!
  		end
	end
end