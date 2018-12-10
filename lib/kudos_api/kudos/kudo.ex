defmodule KudosApi.Kudos.Kudo do
  use Ecto.Schema
  import Ecto.Changeset


  schema "kudos" do
    field :description, :string
    belongs_to :from_user, KudosApi.Users.User, foreign_key: :from_user_id
    belongs_to :to_user, KudosApi.Users.User, foreign_key: :to_user_id

    timestamps()
  end

  @doc false
  def changeset(kudo, attrs) do
    kudo
    |> cast(attrs, [:description, :from_user_id, :to_user_id])
    |> validate_required([:from_user_id, :to_user_id])
  end
end
