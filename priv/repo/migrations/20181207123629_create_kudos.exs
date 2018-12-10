defmodule KudosApi.Repo.Migrations.CreateKudos do
  use Ecto.Migration

  def change do
    create table(:kudos) do
      add :description, :string
      add :from_user_id, references(:users, on_delete: :nothing)
      add :to_user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:kudos, [:from_user_id])
    create index(:kudos, [:to_user_id])
  end
end
