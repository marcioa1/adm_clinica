# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111219232211) do

  create_table "abonos", :force => true do |t|
    t.date     "data"
    t.integer  "user_id"
    t.integer  "paciente_id"
    t.decimal  "valor",                     :precision => 8, :scale => 2
    t.string   "observacao",  :limit => 64
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clinica_id"
  end

  add_index "abonos", ["paciente_id"], :name => "index_abonos_on_paciente_id"

  create_table "acompanhamento_cheques", :force => true do |t|
    t.integer  "cheque_id"
    t.string   "origem",     :limit => 1, :default => "C"
    t.string   "descricao"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acompanhamento_cheques", ["cheque_id"], :name => "index_acompanhamento_cheques_on_cheque_id"

  create_table "altas", :force => true do |t|
    t.integer  "paciente_id"
    t.date     "data_inicio"
    t.string   "observacao",      :limit => 50
    t.integer  "user_id"
    t.date     "data_termino"
    t.integer  "user_termino_id"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "altas", ["user_id"], :name => "index_altas_on_user_id"

  create_table "alteracoes", :force => true do |t|
    t.string   "tabela"
    t.integer  "id_liberado"
    t.date     "data_correcao"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "changes"
    t.integer  "version",        :default => 0
    t.string   "comment"
    t.datetime "created_at"
    t.integer  "clinica_id"
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "bancos", :force => true do |t|
    t.integer  "numero"
    t.string   "nome",       :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ceps", :force => true do |t|
    t.string "logradouro"
    t.string "cep"
    t.string "bairro"
    t.string "cidade"
  end

  add_index "ceps", ["logradouro"], :name => "index_ceps_on_logradouro"

  create_table "cheques", :force => true do |t|
    t.integer  "banco_id"
    t.string   "agencia",                            :limit => 10
    t.string   "conta_corrente",                     :limit => 10
    t.string   "numero",                             :limit => 12
    t.decimal  "valor",                                            :precision => 9, :scale => 2
    t.integer  "recebimento_id"
    t.integer  "paciente_id"
    t.date     "bom_para"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_primeira_devolucao"
    t.string   "motivo_primeira_devolucao",          :limit => 30
    t.date     "data_lancamento_primeira_devolucao"
    t.date     "data_reapresentacao"
    t.date     "data_segunda_devolucao"
    t.string   "motivo_segunda_devolucao",           :limit => 30
    t.date     "data_solucao"
    t.string   "descricao_solucao",                  :limit => 30
    t.boolean  "reapresentacao"
    t.date     "data_spc"
    t.date     "data_arquivo_morto"
    t.integer  "pagamento_id"
    t.integer  "destinacao_id"
    t.date     "data_destinacao"
    t.date     "data_caso_perdido"
    t.date     "data_envio_a_clinica"
    t.date     "data_recebido_da_administracao"
  end

  add_index "cheques", ["banco_id"], :name => "index_cheques_on_banco_id"
  add_index "cheques", ["destinacao_id"], :name => "index_cheques_on_destinacao_id"
  add_index "cheques", ["pagamento_id"], :name => "index_cheques_on_pagamento_id"
  add_index "cheques", ["recebimento_id"], :name => "index_cheques_on_recebimento_id"

  create_table "clinicas", :force => true do |t|
    t.string   "nome",       :limit => 20
    t.string   "sigla",      :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clinicas_users", :id => false, :force => true do |t|
    t.integer "clinica_id"
    t.integer "user_id"
  end

  create_table "conta_bancarias", :force => true do |t|
    t.string   "nome",       :limit => 30
    t.integer  "clinica_id"
    t.integer  "sequencial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conta_bancarias", ["clinica_id"], :name => "index_conta_bancarias_on_clinica_id"

  create_table "debitos", :force => true do |t|
    t.integer  "paciente_id"
    t.integer  "tratamento_id"
    t.decimal  "valor",                          :precision => 9, :scale => 2
    t.string   "descricao",        :limit => 50
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_de_exclusao"
    t.integer  "clinica_id"
    t.boolean  "cancelado",                                                    :default => false
  end

  add_index "debitos", ["paciente_id"], :name => "index_debitos_on_paciente_id"

  create_table "dentistas", :force => true do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "celular"
    t.boolean  "ativo",                                                     :default => true
    t.string   "cro"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "especialidade", :limit => 30
    t.decimal  "percentual",                  :precision => 9, :scale => 2
    t.boolean  "ortodontista",                                              :default => false
  end

  create_table "destinacaos", :force => true do |t|
    t.string   "nome",       :limit => 30
    t.integer  "sequencial"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "destinacaos", ["clinica_id"], :name => "index_destinacaos_on_clinica_id"
  add_index "destinacaos", ["id"], :name => "index_destinacaos_on_id"

  create_table "entradas", :force => true do |t|
    t.date     "data"
    t.decimal  "valor",                                     :precision => 8, :scale => 2
    t.string   "observacao",                  :limit => 50
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "data_confirmacao_da_entrada"
    t.boolean  "resolucao_de_cheque",                                                     :default => false
    t.integer  "clinica_destino"
  end

  add_index "entradas", ["clinica_destino"], :name => "index_entradas_on_clinica_destino"
  add_index "entradas", ["clinica_id"], :name => "index_entradas_on_clinica_id"
  add_index "entradas", ["data"], :name => "index_entradas_on_data"

  create_table "fluxo_de_caixas", :force => true do |t|
    t.integer  "clinica_id"
    t.date     "data"
    t.decimal  "saldo_em_dinheiro", :precision => 9, :scale => 2
    t.decimal  "saldo_em_cheque",   :precision => 9, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forma_recebimentos", :force => true do |t|
    t.string   "nome",       :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ativo",                    :default => true
    t.string   "tipo",       :limit => 1
  end

  create_table "indicacaos", :force => true do |t|
    t.string   "descricao",  :limit => 50
    t.boolean  "ativo",                    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_tabelas", :force => true do |t|
    t.integer  "tabela_id"
    t.string   "codigo",                 :limit => 12
    t.string   "descricao",              :limit => 120
    t.boolean  "ativo",                                                               :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "preco",                                 :precision => 9, :scale => 2
    t.integer  "dias_de_retorno",                                                     :default => 0
    t.boolean  "tem_custo_de_protetico",                                              :default => false
  end

  add_index "item_tabelas", ["descricao"], :name => "index_item_tabelas_on_descricao"
  add_index "item_tabelas", ["tabela_id"], :name => "index_item_tabelas_on_tabela_id"

  create_table "mensalidade_ortodontias", :id => false, :force => true do |t|
    t.date     "data"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orcamentos", :force => true do |t|
    t.integer  "paciente_id"
    t.integer  "numero"
    t.date     "data"
    t.integer  "dentista_id"
    t.decimal  "desconto",                    :precision => 9, :scale => 2
    t.decimal  "valor",                       :precision => 9, :scale => 2
    t.decimal  "valor_com_desconto",          :precision => 9, :scale => 2
    t.string   "forma_de_pagamento"
    t.integer  "numero_de_parcelas"
    t.date     "vencimento_primeira_parcela"
    t.decimal  "valor_da_parcela",            :precision => 9, :scale => 2
    t.date     "data_de_inicio"
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequencial"
  end

  add_index "orcamentos", ["dentista_id"], :name => "index_orcamentos_on_dentista_id"
  add_index "orcamentos", ["numero", "paciente_id", "clinica_id"], :name => "index_orcamentos_on_numero_and_paciente_id_and_clinica_id"
  add_index "orcamentos", ["paciente_id"], :name => "index_orcamentos_on_paciente_id"

  create_table "pacientes", :force => true do |t|
    t.string   "nome"
    t.string   "logradouro"
    t.string   "numero",                                :limit => 10
    t.string   "complemento",                           :limit => 10
    t.string   "telefone",                              :limit => 50
    t.string   "celular",                               :limit => 50
    t.string   "email",                                 :limit => 120
    t.integer  "tabela_id"
    t.date     "inicio_tratamento"
    t.date     "nascimento"
    t.string   "bairro",                                :limit => 30
    t.string   "cidade",                                :limit => 30
    t.string   "uf",                                    :limit => 2
    t.string   "cep",                                   :limit => 9
    t.string   "cpf",                                   :limit => 14
    t.string   "sexo",                                  :limit => 1
    t.string   "codigo",                                :limit => 20
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "indicacao_id"
    t.integer  "sequencial"
    t.boolean  "ortodontia"
    t.integer  "ortodontista_id"
    t.decimal  "mensalidade_de_ortodontia",                            :precision => 9, :scale => 2
    t.boolean  "sair_da_lista_de_debitos"
    t.string   "motivo_sair_da_lista_de_debitos",       :limit => 30
    t.date     "data_da_saida_da_lista_de_debitos"
    t.date     "data_da_suspensao_da_cobranca_de_orto"
    t.string   "motivo_suspensao_cobranca_orto",        :limit => 30
    t.string   "profissao",                             :limit => 50
    t.string   "indicado_por",                          :limit => 50
    t.string   "codigo_anterior"
    t.boolean  "arquivo_morto"
    t.string   "descricao_arquivo_morto"
  end

  add_index "pacientes", ["clinica_id"], :name => "index_pacientes_on_clinica_id"
  add_index "pacientes", ["id"], :name => "index_pacientes_on_id"
  add_index "pacientes", ["indicacao_id"], :name => "index_pacientes_on_indicacao_id"
  add_index "pacientes", ["nome"], :name => "index_pacientes_on_nome"
  add_index "pacientes", ["ortodontista_id"], :name => "index_pacientes_on_ortodontista_id"
  add_index "pacientes", ["sequencial"], :name => "index_pacientes_on_sequencial"
  add_index "pacientes", ["tabela_id"], :name => "index_pacientes_on_tabela_id"

  create_table "pagamentos", :force => true do |t|
    t.integer  "clinica_id"
    t.integer  "tipo_pagamento_id"
    t.date     "data_de_vencimento"
    t.date     "data_de_pagamento"
    t.decimal  "valor",                                   :precision => 9, :scale => 2, :default => 0.0
    t.decimal  "valor_pago",                              :precision => 9, :scale => 2, :default => 0.0
    t.string   "observacao",                :limit => 50
    t.boolean  "nao_lancar_no_livro_caixa",                                             :default => false
    t.datetime "data_de_exclusao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequencial"
    t.decimal  "valor_terceiros",                         :precision => 9, :scale => 2, :default => 0.0
    t.decimal  "valor_cheque",                            :precision => 9, :scale => 2, :default => 0.0
    t.decimal  "valor_restante",                          :precision => 9, :scale => 2, :default => 0.0
    t.integer  "opcao_restante"
    t.integer  "conta_bancaria_id"
    t.string   "numero_do_cheque",          :limit => 20
    t.integer  "protetico_id"
    t.integer  "dentista_id"
    t.integer  "pagamento_id"
    t.string   "observacao_exclusao",       :limit => 60
    t.integer  "usuario_exclusao"
    t.string   "forma_de_pagamento"
  end

  add_index "pagamentos", ["clinica_id"], :name => "index_pagamentos_on_clinica_id"
  add_index "pagamentos", ["conta_bancaria_id"], :name => "index_pagamentos_on_conta_bancaria_id"
  add_index "pagamentos", ["dentista_id"], :name => "index_pagamentos_on_dentista_id"
  add_index "pagamentos", ["pagamento_id"], :name => "index_pagamentos_on_pagamento_id"
  add_index "pagamentos", ["protetico_id"], :name => "index_pagamentos_on_protetico_id"
  add_index "pagamentos", ["sequencial", "clinica_id"], :name => "index_pagamentos_on_sequencial_and_clinica_id"
  add_index "pagamentos", ["sequencial"], :name => "index_pagamentos_on_sequencial"
  add_index "pagamentos", ["tipo_pagamento_id"], :name => "index_pagamentos_on_tipo_pagamento_id"

  create_table "proteticos", :force => true do |t|
    t.string   "nome",        :limit => 60
    t.string   "logradouro",  :limit => 60
    t.string   "numero",      :limit => 10
    t.string   "complemento", :limit => 10
    t.string   "telefone",    :limit => 20
    t.string   "celular",     :limit => 20
    t.string   "email",       :limit => 70
    t.string   "bairro",      :limit => 50
    t.string   "observacao",  :limit => 70
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequencial"
    t.string   "cidade",      :limit => 50
    t.string   "estado",      :limit => 2
    t.string   "cep",         :limit => 9
    t.string   "cpf",         :limit => 18
    t.date     "nascimento"
    t.integer  "clinica_id"
    t.boolean  "ativo",                     :default => true
  end

  add_index "proteticos", ["clinica_id"], :name => "index_proteticos_on_clinica_id"
  add_index "proteticos", ["nome"], :name => "index_proteticos_on_nome"

  create_table "recebimentos", :force => true do |t|
    t.integer  "paciente_id"
    t.integer  "clinica_id"
    t.date     "data"
    t.integer  "formas_recebimento_id"
    t.decimal  "valor",                               :precision => 9, :scale => 2
    t.string   "observacao",            :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_de_exclusao"
    t.string   "observacao_exclusao",   :limit => 50
    t.integer  "cheque_id"
    t.integer  "usuario_exclusao"
    t.integer  "percentual_dentista"
    t.integer  "sequencial_cheque"
  end

  add_index "recebimentos", ["cheque_id"], :name => "index_recebimentos_on_cheque_id"
  add_index "recebimentos", ["clinica_id"], :name => "index_recebimentos_on_clinica_id"
  add_index "recebimentos", ["formas_recebimento_id"], :name => "index_recebimentos_on_formas_recebimento_id"
  add_index "recebimentos", ["paciente_id"], :name => "index_recebimentos_on_paciente_id"
  add_index "recebimentos", ["sequencial_cheque", "clinica_id"], :name => "index_recebimentos_on_sequencial_cheque_and_clinica_id"

  create_table "senhas", :force => true do |t|
    t.integer  "clinica_id"
    t.string   "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "action"
  end

  create_table "tabela_proteticos", :force => true do |t|
    t.integer  "protetico_id"
    t.string   "codigo",       :limit => 20
    t.string   "descricao",    :limit => 70
    t.decimal  "valor",                      :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequencial"
  end

  add_index "tabela_proteticos", ["protetico_id"], :name => "index_tabela_proteticos_on_protetico_id"

  create_table "tabelas", :force => true do |t|
    t.string   "nome",       :limit => 30
    t.boolean  "ativa",                    :default => true
    t.integer  "clinica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tabelas", ["clinica_id"], :name => "index_tabelas_on_clinica_id"
  add_index "tabelas", ["id"], :name => "index_tabelas_on_id"

  create_table "tipo_pagamentos", :force => true do |t|
    t.integer  "clinica_id"
    t.string   "nome"
    t.integer  "ativo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seq"
  end

  add_index "tipo_pagamentos", ["clinica_id"], :name => "index_tipo_pagamentos_on_clinica_id"
  add_index "tipo_pagamentos", ["id"], :name => "index_tipo_pagamentos_on_id"

  create_table "tipo_usuarios", :force => true do |t|
    t.string   "nome",       :limit => 12
    t.string   "descricao",  :limit => 40
    t.integer  "nivel",                    :default => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tipo_usuarios", ["id"], :name => "index_tipo_usuarios_on_id"

  create_table "trabalho_proteticos", :force => true do |t|
    t.integer  "dentista_id"
    t.integer  "protetico_id"
    t.integer  "paciente_id"
    t.integer  "clinica_id"
    t.string   "dente",                                   :limit => 12
    t.date     "data_de_envio"
    t.date     "data_prevista_de_devolucao"
    t.date     "data_de_devolucao"
    t.integer  "tabela_protetico_id"
    t.decimal  "valor",                                                 :precision => 7, :scale => 2
    t.string   "cor",                                     :limit => 12
    t.text     "observacoes"
    t.date     "data_de_repeticao"
    t.string   "motivo_da_repeticao",                     :limit => 30
    t.date     "data_prevista_da_devolucao_da_repeticao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pagamento_id"
    t.date     "data_de_devolucao_da_repeticao"
    t.integer  "tratamento_id"
    t.datetime "data_liberacao_para_pagamento"
  end

  add_index "trabalho_proteticos", ["clinica_id"], :name => "index_trabalho_proteticos_on_clinica_id"
  add_index "trabalho_proteticos", ["dentista_id"], :name => "index_trabalho_proteticos_on_dentista_id"
  add_index "trabalho_proteticos", ["paciente_id"], :name => "index_trabalho_proteticos_on_paciente_id"
  add_index "trabalho_proteticos", ["protetico_id"], :name => "index_trabalho_proteticos_on_protetico_id"
  add_index "trabalho_proteticos", ["tabela_protetico_id"], :name => "index_trabalho_proteticos_on_tabela_protetico_id"

  create_table "tratamentos", :force => true do |t|
    t.integer  "paciente_id"
    t.integer  "item_tabela_id"
    t.integer  "dentista_id"
    t.integer  "clinica_id"
    t.decimal  "valor",                        :precision => 9, :scale => 2
    t.date     "data"
    t.string   "dente",          :limit => 6
    t.integer  "orcamento_id"
    t.boolean  "excluido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "custo",                        :precision => 9, :scale => 2, :default => 0.0
    t.string   "face",           :limit => 10
    t.string   "descricao",      :limit => 60
    t.boolean  "mesial"
    t.boolean  "oclusal"
    t.boolean  "distal"
    t.boolean  "palatina"
    t.boolean  "vestibular"
    t.boolean  "lingual"
    t.string   "estado",         :limit => 30
    t.integer  "pagamento_id"
  end

  add_index "tratamentos", ["dentista_id"], :name => "index_tratamentos_on_dentista_id"
  add_index "tratamentos", ["item_tabela_id"], :name => "index_tratamentos_on_item_tabela_id"
  add_index "tratamentos", ["orcamento_id"], :name => "index_tratamentos_on_orcamento_id"
  add_index "tratamentos", ["paciente_id"], :name => "index_tratamentos_on_paciente_id"

  create_table "users", :force => true do |t|
    t.string   "login",                                                               :null => false
    t.string   "email",                                                               :null => false
    t.string   "crypted_password",                                                    :null => false
    t.string   "password_salt",                                                       :null => false
    t.string   "persistence_token",                                                   :null => false
    t.integer  "login_count",                      :default => 0,                     :null => false
    t.integer  "failed_login_count",               :default => 0,                     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "tipo_usuario_id"
    t.string   "nome",               :limit => 60
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ativo",                            :default => true
    t.datetime "hora_de_inicio_0",                 :default => '2011-12-19 10:00:00'
    t.datetime "hora_de_termino_0",                :default => '2011-12-19 20:00:00'
    t.datetime "hora_de_inicio_1",                 :default => '2011-12-19 10:00:00'
    t.datetime "hora_de_termino_1",                :default => '2011-12-19 20:00:00'
    t.datetime "hora_de_inicio_2",                 :default => '2011-12-19 10:00:00'
    t.datetime "hora_de_termino_2",                :default => '2011-12-19 20:00:00'
    t.datetime "hora_de_inicio_3",                 :default => '2011-12-19 10:00:00'
    t.datetime "hora_de_termino_3",                :default => '2011-12-19 20:00:00'
    t.datetime "hora_de_inicio_4",                 :default => '2011-12-19 10:00:00'
    t.datetime "hora_de_termino_4",                :default => '2011-12-19 20:00:00'
    t.datetime "hora_de_inicio_5",                 :default => '2011-12-19 10:00:00'
    t.datetime "hora_de_termino_5",                :default => '2011-12-19 20:00:00'
    t.datetime "hora_de_inicio_6",                 :default => '2011-12-19 10:00:00'
    t.datetime "hora_de_termino_6",                :default => '2011-12-19 20:00:00'
    t.datetime "hora_de_inicio_7",                 :default => '2011-12-19 10:00:00'
    t.datetime "hora_de_termino_7",                :default => '2011-12-19 20:00:00'
    t.boolean  "dia_da_semana_0",                  :default => false
    t.boolean  "dia_da_semana_1",                  :default => true
    t.boolean  "dia_da_semana_2",                  :default => true
    t.boolean  "dia_da_semana_3",                  :default => true
    t.boolean  "dia_da_semana_4",                  :default => true
    t.boolean  "dia_da_semana_5",                  :default => true
    t.boolean  "dia_da_semana_6",                  :default => true
    t.integer  "clinica_id"
  end

  add_index "users", ["tipo_usuario_id"], :name => "index_users_on_tipo_usuario_id"

end
