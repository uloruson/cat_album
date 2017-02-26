class Image < ActiveRecord::Base
  mount_uploader :data, ImageUploader

  # validates :name, uniqueness: true #ユニークであれば検証成功

end
