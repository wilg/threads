class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.string :name
      t.integer :project_id
      t.integer :creator_id
      t.timestamps
    end
  end
end
