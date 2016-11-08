class Speech < ApplicationRecord
  after_save :store_content!
  mount_uploader :content, ContentUploader
  validates :name, presence: true
  belongs_to :user
end
