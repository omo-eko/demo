class AddDurationToListings < ActiveRecord::Migration
  def change
    add_column :listings, :duration, :string
  end
end
