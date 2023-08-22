class User < ApplicationRecord

  after_create :create_default_links
  after_update :create_default_links

  extend FriendlyId
  friendly_id :username, use: %i[slugged]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, length: {minimum:3, maximum: 50}
  validates :full_name, :username, :body, presence: true
  validates :username, uniqueness: true
  validate :valid_username
  has_one_attached :avatar
  has_many :links, dependent: :destroy

  def valid_username
    restricted_username_list = ["admin", "root", "dashboard", "appearence"]
    errors.add(:username, 'is_restricted') if restricted_username_list.include?(username)
  end

  def should_generate_new_friendly_id?
    username_changed? || slug.blank?
  end

  def create_default_links
    Link.create(user: self, title: "" , url: "") while links.count < 5
  end


end
