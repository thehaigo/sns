defmodule SnsWeb.Api.V1.UserView do
  use SnsWeb, :view

  def render("show.json", %{user: user}) do
    %{data: %{ id: user.id, email:  user.email }}
  end

  def render("jwt.json", %{ token: token }) do
    %{ token: token }
  end
end
