defmodule KudosApi.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  alias KudosApi.Resolvers.KudoResolver

  object :user do
    field :id, :id
    field :name, :string
    field :rating, :integer
    field :given_kudos, list_of(:kudo) do
      resolve &KudoResolver.list_given_kudos/3
    end
    field :received_kudos, list_of(:kudo) do
      resolve &KudoResolver.list_taken_kudos/3
    end

  end

  object :kudo do
    field :id, :id
    field :description, :string
    field :from_user, :user
    field :to_user, :user
  end
end
