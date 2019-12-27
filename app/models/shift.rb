class Shift < ApplicationRecord
  mount_uploader :file, MyUploader

  validates :time, presence: true #проверка на непустое значение

end
