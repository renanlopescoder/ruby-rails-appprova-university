class AlunosController < ApplicationController
  

  def index
    @alunos = Aluno.all
    @resultados = Resultado.all
  end

  def busca
    @resultados = Resultado.all
    @nome_aluno = params[:nome_aluno]
    @nota_aluno = params[:nota_aluno]
    @curso = params[:curso]
    @alunos = Aluno.where "nome_aluno like ? and CAST(nota_aluno as text) like ? and CAST(curso as text) like ? ", "%#{@nome_aluno}%", "%#{@nota_aluno}%", "%#{@curso}%"
  end

  def new
    @aluno = Aluno.new
    @resultados = Resultado.all
  end

  def create
    @aluno = Aluno.new
    

    @aluno.nome_aluno = params[:nome_aluno]
    @aluno.nota_aluno = params[:nota_aluno]
    
    @instituicao_curso = params[:instituicao_id]

    @aluno.instituicao_id = @instituicao_curso
    # Guardando instituicao para calculo de resultados e pegar nome do curso
    @resultado_curso = Resultado.find(@instituicao_curso)
    @aluno.nome_unidade = @resultado_curso.nome_instituicao

    @aluno.curso = @resultado_curso.nome_curso
    @aluno.save
    # Calculando media alunos curso


    
    @notas_dos_alunos = Aluno.where "instituicao_id = ?", @instituicao_curso

    # Nome da instituição para calculo de nota geral
    @nome_da_instituicao = @resultado_curso.nome_instituicao

    @resultado_curso.media_alunos = @notas_dos_alunos.sum('nota_aluno') / @notas_dos_alunos.size
    @resultado_curso.save


    # Calculando nota Geral da Instituição
    # @instituicoes = Resultado.where "nome_instituicao like ?", @nome_da_instituicao
    # @instituicoes.nota_geral = @instituicoes.sum('media_alunos') / @instituicoes.size
    # @instituicoes.save
    
    redirect_to alunos_list_url
  end

  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Aluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    id = params[:id]
    Aluno.destroy id
    redirect_to root_url
  end

end
