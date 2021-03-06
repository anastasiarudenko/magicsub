class Post < ApplicationRecord

  mount_uploader :image, MyUploader
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category

  validates :title, presence: true
  validates :preview, :body, presence: false  #проверка на непустое значение

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!

    end
  end
end
