defmodule Habitus.Router do
  use Habitus.Web, :router

  pipeline :api do
    plug :accepts, ["json","json-api"]
  end

  scope "/api/v1", Habitus do
    pipe_through :api
    post "/register", RegistrationController, :create
    # Route stuff to our SessionController
    #resources "/token", SessionController, only: [:index]
    post "/token", SessionController, :create, as: :login
    
    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
    resources "/pages", PageController, except: [:new, :edit]
    resources "/comments", CommentController, except: [:new, :edit]
    resources "/tags", TagController, except: [:new, :edit]
  end
end
