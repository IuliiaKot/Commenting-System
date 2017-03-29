class Story < ApplicationRecord
  validates :title, :content, presence: true

  has_many :comments, as: :commentable
end
