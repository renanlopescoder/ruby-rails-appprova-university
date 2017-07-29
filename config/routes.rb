Rails.application.routes.draw do
  resources :alunos
  get "/alunos" => "alunos#index", as: :alunos_list
  # ========================
  resources :resultados, only: [:new, :create, :destroy]
  get "/resultados/busca" => "resultados#busca", as: :busca_resultado
  get "/resultados" => "resultados#index", as: :busca_view
  root "welcome#index"
  
end
