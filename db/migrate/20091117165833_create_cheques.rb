class CreateCheques < ActiveRecord::Migration
  def self.up
    create_table :cheques do |t|
      t.references :banco
      t.string :agencia, :limit => 10
      t.string :conta_corrente, :limit => 10
      t.string :numero, :limit => 12
      t.decimal :valor, :precision=>9, :scale=>2
      t.references :recebimento
      t.references :paciente
      t.date    :bom_para
      
      t.timestamps
    end
    add_index :cheques, :recebimento_id
  end

  def self.down
    drop_table :cheques
  end
end
