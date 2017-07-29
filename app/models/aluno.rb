class Aluno < ApplicationRecord
  belongs_to :resultado, required: false
end
