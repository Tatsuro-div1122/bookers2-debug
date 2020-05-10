class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  #空のコメントバリデーション
  validates :comment, presence: true
end
