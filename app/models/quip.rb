class Quip < ApplicationRecord
    belongs_to :user
    validates :body, presence: true, length: { in: 4..140 }
end
