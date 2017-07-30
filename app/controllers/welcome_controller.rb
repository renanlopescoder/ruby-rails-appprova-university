class WelcomeController < ApplicationController
  def index
    @resultados = Resultado.all.order('nota_geral DESC')
    @alunos = Aluno.all
  end
end
