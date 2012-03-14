class CreateCallsTable < ActiveRecord::Migration
  def up
    create_table :calls do |t|
      t.string :number
      t.datetime :time

      t.timestamps
    end
  end

  def down
    drop_table :calls
  end
end
