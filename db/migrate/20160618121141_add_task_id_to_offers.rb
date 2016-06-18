class AddTaskIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :task_id, :integer
  end
end
