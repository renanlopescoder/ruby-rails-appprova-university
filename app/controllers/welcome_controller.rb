class WelcomeController < ApplicationController
  def index
    @resultados = Resultado.all.order('nota_geral DESC')
  end
end
