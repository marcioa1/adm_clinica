class CreateItemTabelas < ActiveRecord::Migration
  def self.up
    create_table :item_tabelas do |t|
      t.integer :tabela_id
      t.string  :codigo,     :limit => 12
      t.string  :descricao,  :limit => 120
      t.boolean :ativo,      :default=>true

      t.timestamps
    end
    add_index :item_tabelas, :descricao
    add_index :item_tabelas, :tabela_id
  end

  def self.down
    drop_table :item_tabelas
  end
end
