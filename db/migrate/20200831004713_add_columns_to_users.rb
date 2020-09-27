# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :postcode, :string
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
