class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :title, presence: {message: "タイトルを入力してください"}
  validates :content, length: { in: 1..140, message: "内容を１文字以上１４０文字以内で入力してください"}
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
