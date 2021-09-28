class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション

  def self.search(search)
    if search != ""         # 空ではないかの判定
      Tweet.where('text LIKE(?)', "%#{search}%")  # whereとLIKE句でTweetsテーブルに検索をかけている
    else
      Tweet.all
    end
  end
end
