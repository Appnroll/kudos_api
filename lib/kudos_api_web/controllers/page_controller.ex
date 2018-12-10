defmodule KudosApiWeb.PageController do
  use KudosApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
