Rails.application.routes.draw do

  resources :alunos, only: [:new, :create, :destroy]
  get "/alunos/busca" => "alunos#busca", as: :busca_aluno

  # ========================
  
  resources :resultados, only: [:new, :create, :destroy]
  get "/resultados/busca" => "resultados#busca", as: :busca_resultado

  root "welcome#index"
  
end
