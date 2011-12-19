class AdicionaChequeidAoRecebimento < ActiveRecord::Migration
  def self.up
    add_column :recebimentos, :cheque_id, :integer
  end

  def self.down
    remove_column :recebimentos, :cheque_id
  end
end
