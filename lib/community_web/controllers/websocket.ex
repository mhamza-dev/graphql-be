defmodule CommunityWeb.Websocket do
  use CommunityWeb, :controller
  import Plug.Conn

  def websocket(conn, params) do
    dbg(params)
    dbg(conn)

    conn
    |> send_resp(200, "OK")
  end
end
