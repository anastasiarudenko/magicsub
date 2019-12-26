class Category < ApplicationRecord
  has_many :posts
  validates :name, presence: true #проверка на непустое значение

  has_ancestry
end
