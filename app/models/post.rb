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

  def set_date
    created_at.strftime("%m月%d日%H時%M分")
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
