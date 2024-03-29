defmodule ExampleCrm.ContactsController do
  use ExampleCrm.Web, :controller

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"firstname" => firstname, "lastname" => lastname}) do
    contact = %ExampleCrm.Contact{firstname: firstname, lastname: lastname}
    Repo.insert(contact)
    redirect conn, to: "/"
  end

  def show(conn, %{"id"=>id}) do
    contact = ExampleCrm.Repo.get(ExampleCrm.Contact, id)
    activities = ExampleCrm.Repo.all Ecto.Model.assoc(contact, :activities)
    render conn, "show.html", contact: contact, activities: activities
  end
end
