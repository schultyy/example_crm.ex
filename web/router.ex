defmodule ExampleCrm.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExampleCrm do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/contacts", ContactsController, only: [:new, :create, :show]
    resources "/activities", ActivitiesController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExampleCrm do
  #   pipe_through :api
  # end
end
