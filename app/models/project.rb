class Project < ActiveRecord::Base

  has_many :threads, class_name: "MessageThread"
  has_many :messages, through: :threads

  attr_accessible :name

  scope :latest, -> { order("updated_at desc") }

end
