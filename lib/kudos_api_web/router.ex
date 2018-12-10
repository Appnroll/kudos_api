defmodule KudosApiWeb.Router do
  use KudosApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    forward "/",  Absinthe.Plug, schema: KudosApi.Schema
  end

  scope "/", KudosApiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: KudosApi.Schema,
    interface: :advanced


  # Other scopes may use custom stacks.
  # scope "/api", KudosApiWeb do
  #   pipe_through :api
  # end
end
