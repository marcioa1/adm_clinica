class AddObservacaoToTratamento < ActiveRecord::Migration
  def self.up
    add_column :tratamentos, :custo, :decimal, :precision=>9, :scale=>2, :default=>0.0
    add_column :tratamentos, :face, :string, :limit => 10
    add_column :tratamentos, :descricao, :string, :limit=>60
  end

  def self.down
    remove_column :tratamentos, :custo
    remove_column :tratamentos, :face
    remove_column :tratamentos, :descricao
  end
end
