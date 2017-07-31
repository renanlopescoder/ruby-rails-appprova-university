class WelcomeController < ApplicationController
  def index
    @resultados = Resultado.all.order('media_alunos DESC')
    @alunos = Aluno.all
  end
end
