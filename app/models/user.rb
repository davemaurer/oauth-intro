class User < ActiveRecord::Base
  def self.find_or_create_from_auth(data)
    #we check from the provider AND the uid so users authing from multiple services don't collide
    #i.e. user id 1 from twitter and user id 1 from github
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.email = data.info.email
    user.nickname = data.info.nickname
    user.image_url = data.info.image_url
    user.token = data.credentials.token
    user.save

    user
  end
end
