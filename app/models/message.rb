class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :thread, class_name: "MessageThread", touch: true
  has_one :project, through: :thread

  belongs_to :starrer, class_name: "User"

  validates_presence_of :thread, :thread_id
  validates_presence_of :body

  # For creating a message without a thread.
  attr_accessor :project_id, :thread_name_to_create

  attr_accessible :project_id, :thread_name_to_create, :body, :thread_id

  scope :latest_first, -> { order("created_at desc") }
  scope :starred, -> { where("starred_at is not null") }

  include Pushable

  before_validation :create_thread_if_none_present
  def create_thread_if_none_present
    if !thread && thread_name_to_create && project_id
      self.thread = Project.find(project_id).threads.create(name: thread_name_to_create)
    end
  end

  after_create :notify
  def notify
    push 'message_created', self.as_json
  end

  def as_json options = {}
    super({methods: [:thread_name, :user_name]}.merge(options))
  end

  def user_name
    user.name
  end

  def thread_name
    thread.name
  end

  def starred?
    starred_at.present?
  end

  def star_by!(user)
    self.starrer = user
    self.starred_at = Time.now
    self.save!
  end

  def unstar!
    self.starrer = nil
    self.starred_at = nil
    self.save!
  end

end
