# module ApplicationHelper
#   def image_url(user)
#     if user.image
#       gravatar_id = Digest::MD5::hexdigest(user.email).downcase
#       "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
#     end
#   end
# end

require 'net/http'

module ApplicationHelper
  def image(user)
    if user.email.present?
      gravatar_id = Digest::MD5.hexdigest(user.email).downcase
      gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=404&s=150"

      if gravatar_exists?(gravatar_url)
        gravatar_url
      elsif user.image.present?
        user.image.url
      else
        'blank.jpg'
      end
    else
      'blank.jpg'
    end
  end

  private

  def gravatar_exists?(gravatar_url)
    response = Net::HTTP.get_response(URI.parse(gravatar_url))
    response.code == "200"
  rescue StandardError => e
    Rails.logger.error "Gravatar check failed: #{e.message}"
    false
  end
end