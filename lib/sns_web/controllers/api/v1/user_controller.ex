defmodule SnsWeb.Api.V1.UserController do
  use SnsWeb, :controller

  alias Sns.Users
  alias Sns.Users.User
  alias Sns.Guardian

  action_fallback SnsWeb.FallbackController

  def show(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "show.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.register_user(user_params) do
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn |> render("jwt.json", token: token)
    end
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
    with {:ok, token, _claims} <- Users.token_sign_in(email, password) do
      conn |> render("jwt.json", token: token)
    end
  end
end
