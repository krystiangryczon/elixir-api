defmodule Store.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get("/", do: send_resp(conn, 200, "OK"))
  get("/get_all", do: send_resp(conn, 200, Jason.encode!(Store.get_all())))

  match(_, do: send_resp(conn, 404, "Not Found"))
end
