defmodule Bible.Persons.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
