defmodule Habitus.Router do
  use Habitus.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Habitus do
    pipe_through :api
  end
end
