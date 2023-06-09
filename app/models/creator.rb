class Creator < ApplicationRecord
  belongs_to :user

  validates :pen_name, length: { maximum: 10 }
end
