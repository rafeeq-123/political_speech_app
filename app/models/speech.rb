class Speech < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  after_save :store_content!
  mount_uploader :content, ContentUploader
  validates :name, presence: true
  belongs_to :user, optional: true
  has_many :comments, :inverse_of => :speech
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments, :reject_if => lambda { |a| a[:comment].blank? }, :allow_destroy => true

  # Speech.__elasticsearch__.create_index! force: true

  def self.highest_indexed

  end

end
