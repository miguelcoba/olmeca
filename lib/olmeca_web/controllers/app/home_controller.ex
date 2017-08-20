defmodule OlmecaWeb.App.HomeController do
  use OlmecaWeb, :app_controller

  plug EnsureAuthenticated, handler: __MODULE__, typ: "access"

  def index(conn, _params, current_user, _claims) do
    render conn, "index.html", current_user: current_user
  end

  # The unauthenticated function is called because this controller has been
  # specified as the handler.
  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "Authentication required")
    |> redirect(to: auth_path(conn, :login, :identity))
  end
end
