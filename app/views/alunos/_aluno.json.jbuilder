json.extract! aluno, :id, :nome_aluno, :instituicao, :nota_aluno, :curso, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
