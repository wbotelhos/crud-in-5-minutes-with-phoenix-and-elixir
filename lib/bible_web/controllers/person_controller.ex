defmodule BibleWeb.PersonController do
  use BibleWeb, :controller

  alias Bible.Persons
  alias Bible.Persons.Person

  def index(conn, _params) do
    persons = Persons.list_persons()
    render(conn, "index.html", persons: persons)
  end

  def new(conn, _params) do
    changeset = Persons.change_person(%Person{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"person" => person_params}) do
    case Persons.create_person(person_params) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "Person created successfully.")
        |> redirect(to: Routes.person_path(conn, :show, person))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Persons.get_person!(id)
    render(conn, "show.html", person: person)
  end

  def edit(conn, %{"id" => id}) do
    person = Persons.get_person!(id)
    changeset = Persons.change_person(person)
    render(conn, "edit.html", person: person, changeset: changeset)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Persons.get_person!(id)

    case Persons.update_person(person, person_params) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "Person updated successfully.")
        |> redirect(to: Routes.person_path(conn, :show, person))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", person: person, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Persons.get_person!(id)
    {:ok, _person} = Persons.delete_person(person)

    conn
    |> put_flash(:info, "Person deleted successfully.")
    |> redirect(to: Routes.person_path(conn, :index))
  end
end
