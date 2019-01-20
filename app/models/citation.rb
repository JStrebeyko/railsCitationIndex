class Citation < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :text, presence: true,
                   length: { minimum: 5 }
end
