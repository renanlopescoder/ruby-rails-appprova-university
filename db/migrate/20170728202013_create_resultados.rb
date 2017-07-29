class CreateResultados < ActiveRecord::Migration[5.1]
  def change
    create_table :resultados do |t|
      t.string :nome_instituicao
      t.decimal :nota_geral
      t.string :nome_curso
      t.decimal :nota_curso
      t.decimal :media_alunos
      t.timestamps
    end
  end
end
