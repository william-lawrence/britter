class AddUserIdToQuips < ActiveRecord::Migration[6.0]
  def change
    add_column :quips, :user_id, :integer
  end
end
