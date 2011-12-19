class AddClinicaIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :clinica_id, :integer
  end

  def self.down
    remove_column :users, :clinica_id
  end
end