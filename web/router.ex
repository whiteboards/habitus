defmodule Habitus.Router do
  use Habitus.Web, :router

  pipeline :api do
    plug :accepts, ["json","json-api"]
  end
  
  pipeline :auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/api/v1", Habitus do
    pipe_through :api
    post "/register", RegistrationController, :create
    post "/token", SessionController, :create, as: :login
    
    #pipe_through :auth
    resources "/users", UserController, except: [:new, :edit]
    #get "/posts/:alias", Habitus.PostController, :show_alias
    resources "/posts", PostController, except: [:new, :edit]
    resources "/pages", PageController, except: [:new, :edit]
    resources "/comments", CommentController, except: [:new, :edit]
    resources "/tags", TagController, except: [:new, :edit]
  end
end
