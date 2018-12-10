defmodule KudosApi.Resolvers.KudoResolver do
  alias KudosApi.Kudos

  def list_kudos(_parent, _args, %{source: source}) when source == %{} do
    {:ok, Kudos.list_kudos() }
  end

  def list_given_kudos(_parent, _args, %{source: source}) do
    {:ok, Kudos.list_given_kudos(source.id) }
  end

  def list_taken_kudos(_parent, _args, %{source: source}) do
    {:ok, Kudos.list_taken_kudos(source.id) }
  end

  def create_kudo(_parent, %{description: description, from: from, to: to}, _resolution) do
    Kudos.create_kudo(%{description: description, from_user_id: from, to_user_id: to })
  end

end
