class Clinica < ActiveRecord::Base
  acts_as_audited
  has_many :users
  has_many :pagamentos
  has_many :dentistas
  has_many :recebimentos
  has_many :cheques
  has_many :tratamentos
  has_many :destinacaos
  has_many :proteticos
  has_many :trabalho_proteticos
  has_many :conta_bancarias
  has_many :pacientes
  has_many :tabelas
  
  named_scope :por_nome, :order=>:nome

  def ortodontistas
    result = []
    self.dentistas.each do |dentista|  
      result << dentista if dentista.ortodontista && dentista.ativo?
    end
    result.sort! {|a,b| a.nome <=> b.nome}
  end  
  
  def self.busca_clinica(id)
    @clinica = Rails.cache.read("clinica_#{id}")
    if !@clinica
      @clinica = Clinica.find(id)
      Rails.cache.write("clinica_#{id}", @clinica, :expires_in => 12.hours) 
    end
    @clinica
  end
  

end
