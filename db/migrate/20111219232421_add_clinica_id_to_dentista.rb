class AddClinicaIdToDentista < ActiveRecord::Migration
  def self.up
    add_column :denstistas, :clinica_id, :integer
  end

  def self.down
    remove_column :denstistas, :clinica_id
  end
end