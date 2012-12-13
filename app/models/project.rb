class Project < ActiveRecord::Base

  has_many :threads, class_name: "MessageThread", dependent: :destroy
  has_many :messages, through: :threads
  belongs_to :creator, class_name: "User"

  attr_accessible :name

  validates_presence_of :name

  scope :latest, -> { order("updated_at desc") }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def last_message
    @last_message ||= messages.latest_first.first
  end

end
