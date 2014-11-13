class CreateTimings < ActiveRecord::Migration
  def change
    create_table :timings do |t|
      t.time :end_time

      t.timestamps
    end
  end
end
