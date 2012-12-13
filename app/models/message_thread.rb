class MessageThread < ActiveRecord::Base

  has_many :messages, foreign_key: 'thread_id', dependent: :destroy
  has_many :participants, class_name: "User"

  belongs_to :creator, class_name: "User"
  belongs_to :project, touch: true

  attr_accessible :name

  validates_presence_of :name
  validates_presence_of :project

  scope :latest_first, -> { order("updated_at desc") }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def last_message
    @last_message ||= messages.latest_first.first
  end

  def starred?
    messages.starred.size > 0
  end

end
