class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :thread, class_name: "MessageThread", touch: true
  has_one :project, through: :thread

  # For creating a message without a thread.
  attr_accessor :project_id, :thread_name

  attr_accessible :project_id, :thread_name, :body, :thread_id

  before_validation :create_thread_if_none_present
  def create_thread_if_none_present
    if !thread
      self.thread = Project.find(project_id).threads.create(name: thread_name)
    end
  end


end
