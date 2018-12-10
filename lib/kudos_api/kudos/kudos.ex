defmodule KudosApi.Kudos do
  @moduledoc """
  The Kudos context.
  """

  import Ecto.Query, warn: false
  alias KudosApi.Repo

  alias KudosApi.Kudos.Kudo

  @doc """
  Returns the list of kudos.

  ## Examples

      iex> list_kudos()
      [%Kudo{}, ...]

  """
  def list_kudos do
    kudos = Repo.all(Kudo)
    Repo.preload(kudos, [:from_user, :to_user])
  end

  def list_given_kudos(user_id) do
    kudos = Repo.get_by(Kudo, from_user_id: user_id)
    Repo.preload(kudos, :from_user)
  end

  def list_taken_kudos(user_id) do
    kudos = Repo.get_by(Kudo, to_user_id: user_id)
    Repo.preload(kudos, :to_user)
  end


  @doc """
  Gets a single kudo.

  Raises `Ecto.NoResultsError` if the Kudo does not exist.

  ## Examples

      iex> get_kudo!(123)
      %Kudo{}

      iex> get_kudo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_kudo!(id), do: Repo.get!(Kudo, id)

  @doc """
  Creates a kudo.

  ## Examples

      iex> create_kudo(%{field: value})
      {:ok, %Kudo{}}

      iex> create_kudo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_kudo(attrs \\ %{}) do
    %Kudo{}
    |> Kudo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a kudo.

  ## Examples

      iex> update_kudo(kudo, %{field: new_value})
      {:ok, %Kudo{}}

      iex> update_kudo(kudo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_kudo(%Kudo{} = kudo, attrs) do
    kudo
    |> Kudo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Kudo.

  ## Examples

      iex> delete_kudo(kudo)
      {:ok, %Kudo{}}

      iex> delete_kudo(kudo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_kudo(%Kudo{} = kudo) do
    Repo.delete(kudo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking kudo changes.

  ## Examples

      iex> change_kudo(kudo)
      %Ecto.Changeset{source: %Kudo{}}

  """
  def change_kudo(%Kudo{} = kudo) do
    Kudo.changeset(kudo, %{})
  end
end
