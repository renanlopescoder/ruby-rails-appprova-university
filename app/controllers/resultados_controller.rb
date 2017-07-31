class ResultadosController < ApplicationController

  def index
    @resultadosQ = Resultado.where "nome_instituicao like ? and CAST(nota_geral as text) like ? and nome_curso like ? and CAST(nota_curso as text) like ? and CAST(media_alunos as text) like ?", "%#{@nome_instituicao}%", "%#{@nota_geral}%", "%#{@nome_curso}%", "%#{@nota_curso}%", "%#{@media_alunos}%"
    @resultados = @resultadosQ.order('nota_geral DESC')
    @alunos = Aluno.all
  end

  def create
    valores = params.require("resultado").permit :nome_instituicao, :nota_geral, :nome_curso, :media_alunos, :instituicao_id
    resultado = Resultado.create valores
    redirect_to root_url
  end

  def destroy
    id = params[:id]
    Resultado.destroy id
    redirect_to root_url
  end

  def busca
    @alunos = Aluno.all
    @nome_instituicao = params[:nome_instituicao]
    @nota_geral = params[:nota_geral]
    @nome_curso = params[:nome_curso]
    @media_alunos = params[:media_alunos]
    @resultadosQ = Resultado.where "nome_instituicao like ? and CAST(nota_geral as text) like ? and nome_curso like ? and CAST(media_alunos as text) like ?", "%#{@nome_instituicao}%", "%#{@nota_geral}%", "%#{@nome_curso}%", "%#{@media_alunos}%"
    @resultados = @resultadosQ.order('nota_geral DESC')
  end

end
