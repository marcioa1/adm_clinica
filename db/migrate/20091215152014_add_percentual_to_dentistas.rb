class AddPercentualToDentistas < ActiveRecord::Migration
  def self.up
    add_column :dentistas, :especialidade, :string, :limit => 30
    add_column :dentistas, :percentual, :decimal, :precision=>9, :scale=>2
  end

  def self.down
    remove_column :dentistas, :percentual
    remove_column :dentistas, :especialidade
  end
end
