class Reward < ActiveRecord::Base
  has_many :user_rewards
  has_many :users, through: :user_rewards
  validates :name, presence: true, uniqueness: true
  validates :point_value, presence: true

  has_attached_file :image, styles: {thumb: '150 x 150'}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
