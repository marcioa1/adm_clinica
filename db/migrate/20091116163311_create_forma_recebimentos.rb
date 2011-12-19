class CreateFormaRecebimentos < ActiveRecord::Migration
  def self.up
    create_table :forma_recebimentos do |t|
      t.string   :nome,  :limit => 40
      
      t.timestamps
    end
  end

  def self.down
    drop_table :forma_recebimentos
  end
end
