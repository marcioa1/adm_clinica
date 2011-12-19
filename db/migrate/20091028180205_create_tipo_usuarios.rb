class CreateTipoUsuarios < ActiveRecord::Migration
  def self.up
    create_table :tipo_usuarios do |t|
      t.string  :nome,      :limit => 12 
      t.string  :descricao, :limit => 40
      t.integer :nivel,     :default => 2

      t.timestamps
    end
    add_index :tipo_usuarios, :id
    TipoUsuario.create(:nome =>"master", :descricao=> "Tem total acesso as rotias rotinas do sistema", :nivel=> 0)
    TipoUsuario.create(:nome =>"secretária", :descricao =>"Tem total a uma determinada clinica", :nivel=> 2)
    TipoUsuario.create(:nome =>"dentista", :descricao =>"Tem total aos clientes que ele trata", :nivel=> 2)
  end

  def self.down
    drop_table :tipo_usuarios
  end
end
