class Guest < ApplicationRecord

  belongs_to :user, dependent: :destroy, optional: true
  has_one :address, dependent: :destroy, as: :addressable
  has_many :reserves
  has_one_attached :image, dependent: :destroy

  after_create :assign_role

  validates_associated :user
  accepts_nested_attributes_for :user, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true

  geocoded_by :geo_address
  after_validation :geocode

  def assign_role
    self.user.remove_role :basic
    self.user.add_role :guest
  end
  

  def name
    self.user.name
  end

  def user_name
    self.user.name
  end

  def geo_address
    address&.geo_address
  end

  def send_notification(message, title)
    params = {"app_id" => "51433a64-19ce-4872-bc03-349ee84dc96b", 
          "contents" => {"en" => message.to_s},
          "included_segments" => ["All"],
          "filters" => [{"field": "tag", "key": "user_id", "relation": "=", "value": self.id}]
        
        }
      uri = URI.parse('https://onesignal.com/api/v1/notifications')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path,
                                    'Content-Type'  => 'application/json;charset=utf-8',
                                    'Authorization' => "Basic OTRlOWI0OTQtMjBkZS00MzViLWEyM2QtNTE1MTNkYjBiYzlm")
      request.body = params.as_json.to_json
      response = http.request(request) 
      puts response.body
  end  
end
