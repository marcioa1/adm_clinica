class AddAtivoToFormasRecebimento < ActiveRecord::Migration
  def self.up
    add_column :forma_recebimentos, :ativo, :boolean, :default => true
  end

  def self.down
    remove_column :forma_recebimentos, :ativo
  end
end
