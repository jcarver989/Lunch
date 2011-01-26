class CreateTrainingExamples < ActiveRecord::Migration
  def self.up
    create_table :training_examples do |t|
      t.integer :cookie_id
      t.string :restaurant_name
      t.string :restaurant_type
      t.integer :yelp_rating
      t.float :distance
      t.boolean :ate_lunch

      t.timestamps
    end
  end

  def self.down
    drop_table :training_examples
  end
end
