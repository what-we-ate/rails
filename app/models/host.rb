class Host < ActiveRecord::Base
  include Wisper::Publisher

  belongs_to :user
  has_many :events, dependent: :restrict_with_error

  validates :name, presence: true

  scope :alphabetical, -> { order(name: :asc) }

  after_create :publish_creation_successful

  def publish_creation_successful
    broadcast(:new_host)
  end
end
