class CreateBucks < ActiveRecord::Migration[6.0]
  def change
    create_table :bucks do |t|
      t.string :to
      t.string :from
      t.string :for_message
      t.string :buck_type
      t.timestamps
    end
  end
end
