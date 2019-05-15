class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
  :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  rolify

  before_validation :assign_uid

  after_create :assign_role
  after_create :assign_generated_password

  has_one :guest
  has_many :my_reserves, through: :guest, source: :reserves

  belongs_to :userable, polymorphic: true, optional: true

  validates :email, presence: true, uniqueness: true
  has_one_attached :image, dependent: :destroy

  def address
    self.userable.address
  end

  def services
    if self.userable
      self.userable.services
    else
      Service.all
    end
  end

  def reserves
    if self.userable
      self.userable.reserves
    else
      Reserve.all
    end
  end

  def accommodations
    if self.userable
      self.userable.accommodations
    else
      Accommodation.all
    end
  end

  def unavailabilities
    if self.userable
      self.userable.unavailabilities
    else
      Unavailability.all
    end
  end

  def properties
    if self.userable
      self.userable.properties
    else
      Property.all
    end
  end

  def fees
    if self.userable
      self.userable.fees
    else
      Fee.all
    end
  end

  def assign_role
    self.add_role(:basic) if self.roles.blank?
  end

  def assign_uid
    self.uid = self.email if self.uid.blank?
  end

  def assign_generated_password
    if self.encrypted_password.blank?
      self.generated_password = SecureRandom.hex
      self.password = self.generated_password
    end
  end

  def image_urls
    self.image.map do |i|
      Rails.application.routes.url_helpers.rails_blob_path(i, only_path: true)
    end
  end

  


end 
