class Tabela < ActiveRecord::Base
  acts_as_audited
  has_many   :item_tabelas
  has_many   :pacientes
  belongs_to :clinica
  
  named_scope :ativas, :conditions=>["ativa = ?", true]
  named_scope :da_clinica, lambda { |clinica_id| {:conditions => ['clinica_id = ? ', clinica_id]}}
  named_scope :inativas, :conditions => ['ativa = ? ', false]
  named_scope :por_nome, :order=>:nome
  
  validates_presence_of :nome, :message => "O nome da tabela é obrigatório."
  
  def itens_ativos
    ItemTabela.all(:order=>"descricao", 
                   :conditions=>["tabela_id = ? and ativo = ?", self.id, true])
  end
  
  def pode_excluir?
    self.pacientes.blank?
  end
end
