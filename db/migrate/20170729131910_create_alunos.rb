class CreateAlunos < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos do |t|
      t.integer :instituicao_id
      t.string :nome_aluno
      t.decimal :nota_aluno
      t.string :curso
      t.timestamps
    end
  end
end
