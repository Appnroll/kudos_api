defmodule KudosApi.Schema do
  use Absinthe.Schema
  import_types KudosApi.Schema.ContentTypes
  alias KudosApi.Resolvers

  query do

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &Resolvers.UserResolver.list_users/3
    end

    @desc "Get single user"
    field :user, :user do
      arg :id, :id
      resolve &Resolvers.UserResolver.find_user/3
    end

    @desc "Get all kudos"
    field :kudos, list_of(:kudo) do
      resolve &Resolvers.KudoResolver.list_kudos/3
    end
  end

  mutation do
    @desc "Create a user"
    field :create_user, type: :user do
      arg :name, non_null(:string)
      resolve &Resolvers.UserResolver.create_user/3
    end

    @desc "Create a kudo"
    field :create_kudo, type: :kudo do
      arg :description, :string
      arg :from, non_null(:id)
      arg :to, non_null(:id)
      resolve &Resolvers.KudoResolver.create_kudo/3
    end
  end
end
