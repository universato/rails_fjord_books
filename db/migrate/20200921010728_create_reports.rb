# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :user_id, null: false
      t.string :title, limit: 30, null: false
      t.date :reported_on
      t.text :body

      t.timestamps
    end
  end
end
