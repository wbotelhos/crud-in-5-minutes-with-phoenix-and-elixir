defmodule Bible.PersonsTest do
  use Bible.DataCase

  alias Bible.Persons

  describe "persons" do
    alias Bible.Persons.Person

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Persons.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Persons.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Persons.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Persons.create_person(@valid_attrs)
      assert person.description == "some description"
      assert person.name == "some name"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Persons.update_person(person, @update_attrs)
      assert person.description == "some updated description"
      assert person.name == "some updated name"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_person(person, @invalid_attrs)
      assert person == Persons.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Persons.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Persons.change_person(person)
    end
  end
end
