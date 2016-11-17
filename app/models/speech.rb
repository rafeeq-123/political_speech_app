class Speech < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  after_save :store_content!
  mount_uploader :content, ContentUploader
  validates :name, presence: true
  belongs_to :user
  Speech.__elasticsearch__.create_index! force: true
end
