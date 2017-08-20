defmodule OlmecaWeb.AuthorizationController do
  use OlmecaWeb, :controller

  alias Olmeca.Repo

  def index(conn, _params, current_user, _claims) do
    render conn, "index.html", current_user: current_user, authorizations: authorizations(current_user)
  end

  defp authorizations(user) do
    Ecto.assoc(user, :authorizations) |> Repo.all
  end
end
