defmodule Discuss.Model.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:email]}

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :topics, Discuss.Model.Topic
    has_many :comments, Discuss.Model.Topic


    timestamps()
  end

  @doc false
  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
    |> unique_constraint(:email)
  end
end
