class Project < ActiveRecord::Base

  has_many :threads, class_name: "MessageThread"
  has_many :messages, through: :threads

  attr_accessible :name

  validates_presence_of :name

  scope :latest, -> { order("updated_at desc") }

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
