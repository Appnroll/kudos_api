defmodule KudosApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :rating, :integer

      timestamps()
    end

  end
end
