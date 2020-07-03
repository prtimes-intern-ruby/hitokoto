class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :favorites
  attachment :image, destroy: false
  # titleの文字数は1~10文字まで
  validates :title,
    length: {minimum: 1, maximum: 10}
  # content空がダメ
  validates :content,
    presence: true
end
