defmodule OlmecaWeb.App.LayoutView do
  use OlmecaWeb, :view

  def socket_url, do: System.get_env("WEBSOCKET_URL") || "ws://localhost:4000/socket/websocket"
end