class AddStarsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :starred_at, :datetime
    add_column :messages, :starrer_id, :integer
  end
end
