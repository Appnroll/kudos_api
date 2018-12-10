defmodule KudosApi.KudosTest do
  use KudosApi.DataCase

  alias KudosApi.Kudos

  describe "kudos" do
    alias KudosApi.Kudos.Kudo

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def kudo_fixture(attrs \\ %{}) do
      {:ok, kudo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Kudos.create_kudo()

      kudo
    end

    test "list_kudos/0 returns all kudos" do
      kudo = kudo_fixture()
      assert Kudos.list_kudos() == [kudo]
    end

    test "get_kudo!/1 returns the kudo with given id" do
      kudo = kudo_fixture()
      assert Kudos.get_kudo!(kudo.id) == kudo
    end

    test "create_kudo/1 with valid data creates a kudo" do
      assert {:ok, %Kudo{} = kudo} = Kudos.create_kudo(@valid_attrs)
      assert kudo.description == "some description"
    end

    test "create_kudo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kudos.create_kudo(@invalid_attrs)
    end

    test "update_kudo/2 with valid data updates the kudo" do
      kudo = kudo_fixture()
      assert {:ok, kudo} = Kudos.update_kudo(kudo, @update_attrs)
      assert %Kudo{} = kudo
      assert kudo.description == "some updated description"
    end

    test "update_kudo/2 with invalid data returns error changeset" do
      kudo = kudo_fixture()
      assert {:error, %Ecto.Changeset{}} = Kudos.update_kudo(kudo, @invalid_attrs)
      assert kudo == Kudos.get_kudo!(kudo.id)
    end

    test "delete_kudo/1 deletes the kudo" do
      kudo = kudo_fixture()
      assert {:ok, %Kudo{}} = Kudos.delete_kudo(kudo)
      assert_raise Ecto.NoResultsError, fn -> Kudos.get_kudo!(kudo.id) end
    end

    test "change_kudo/1 returns a kudo changeset" do
      kudo = kudo_fixture()
      assert %Ecto.Changeset{} = Kudos.change_kudo(kudo)
    end
  end
end
