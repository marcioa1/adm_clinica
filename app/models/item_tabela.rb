class ItemTabela < ActiveRecord::Base
  acts_as_audited
  belongs_to    :tabela
  has_many      :precos
  has_many      :tratamentos
  belongs_to    :descricao_conduta
  belongs_to    :tabela
  
  validates_presence_of :tabela_id, :descricao, :dias_de_retorno, :preco
  validates_numericality_of :preco, :on => :create, :message => "is not a number"
  # validates_numericality_of :dias_de_retorno, :greater_than_or_equal_to => 0
  
  named_scope :ativos, :conditions=>["ativo = ?", true]
  
end
