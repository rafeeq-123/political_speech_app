class Speech < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  after_save :store_content!
  mount_uploader :content, ContentUploader
  validates :name, presence: true
  belongs_to :user, optional: true
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments
  # Speech.__elasticsearch__.create_index! force: true
end
