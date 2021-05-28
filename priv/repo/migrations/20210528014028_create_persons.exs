defmodule Bible.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :name, :string
      add :description, :text

      timestamps()
    end

  end
end
