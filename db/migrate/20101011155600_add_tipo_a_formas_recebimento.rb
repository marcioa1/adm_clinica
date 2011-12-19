class AddTipoAFormasRecebimento < ActiveRecord::Migration
  def self.up
    add_column :forma_recebimentos, :tipo, :string, :limit=>1
  end

  def self.down
    remove_column :forma_recebimentos, :tipo
  end
end