class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      # define your columns here
      t.timestamps
    end
  end
end
