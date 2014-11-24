class AddColumnStartTimeToTimings < ActiveRecord::Migration
  def change
    add_column :timings, :start_time, :time
  end
end
