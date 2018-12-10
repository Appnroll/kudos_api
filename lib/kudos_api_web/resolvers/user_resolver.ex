defmodule KudosApi.Resolvers.UserResolver do
  alias KudosApi.Users

  def list_users(_parent, _args, _resolution) do
    {:ok, Users.list_users() }
  end

  def find_user(_parent, %{id: id}, _resolution) do
    try do
      {:ok, Users.get_user!(id)}
    rescue
      _ ->
        {:error, "User with ID: #{ id } not found"}
    end
  end

  def create_user(_parent, %{name: name}, _resolution) do
    Users.create_user(%{name: name, rating: 0})
  end

end
