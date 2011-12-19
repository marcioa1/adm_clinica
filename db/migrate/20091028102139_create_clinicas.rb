class CreateClinicas < ActiveRecord::Migration
  def self.up
    create_table :clinicas do |t|
      t.string :nome,  :limit=>20
      t.string :sigla, :limit=>8

      t.timestamps
    end
  end

  def self.down
    # removcolumn :users, :clinica_id
    drop_table :clinicas
  end
end
