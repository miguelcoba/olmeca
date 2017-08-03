defmodule Olmeca.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Olmeca.Web, :controller
      use Olmeca.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def admin_controller do
    quote do
      use Phoenix.Controller, namespace: Olmeca.Admin
      use Guardian.Phoenix.Controller, key: :admin

      alias Olmeca.Repo
      alias Guardian.Plug.EnsureAuthenticated
      alias Guardian.Plug.EnsurePermissions

      import Ecto
      import Ecto.Query

      import Olmeca.Router.Helpers
      import Olmeca.Controller.Helpers
    end
  end

    def app_controller do
    quote do
      use Phoenix.Controller, namespace: Olmeca.App
      use Guardian.Phoenix.Controller, key: :app

      alias Olmeca.Repo
      alias Guardian.Plug.EnsureAuthenticated
      alias Guardian.Plug.EnsurePermissions

      import Ecto
      import Ecto.Query

      import Olmeca.Router.Helpers
      import Olmeca.Controller.Helpers
    end
  end

  def controller do
    quote do
      use Phoenix.Controller
      use Guardian.Phoenix.Controller

      alias Olmeca.Repo
      alias Guardian.Plug.EnsureAuthenticated
      alias Guardian.Plug.EnsurePermissions

      import Ecto
      import Ecto.Query

      import Olmeca.Router.Helpers
      import Olmeca.Controller.Helpers
      import Olmeca.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Olmeca.Router.Helpers
      import Olmeca.ViewHelpers
      import Olmeca.ErrorHelpers
      import Olmeca.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias Olmeca.Repo
      import Ecto
      import Ecto.Query
      import Olmeca.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
