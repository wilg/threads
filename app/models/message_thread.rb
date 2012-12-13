class MessageThread < ActiveRecord::Base

  has_many :messages, foreign_key: 'thread_id'
  has_many :participants, class_name: "User"

  belongs_to :creator, class_name: "User"
  belongs_to :project

  attr_accessible :name

end
