class AddFieldsToEmployer < ActiveRecord::Migration[7.0]
  def change
    add_column :employers, :fields, :jsonb
  end
end
