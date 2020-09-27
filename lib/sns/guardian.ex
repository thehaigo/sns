defmodule Sns.Guardian do
  use Guardian, otp_app: :sns

  # Guardian.encode_and_sign（sign_up/sign_in）で実行
  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  # headerのBearerのJWTを検証時(sign_up/sign_in以外のAPI)に実行
  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Sns.Users.get_user!(id)
    {:ok, resource}
  end
end
