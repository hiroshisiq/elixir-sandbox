defmodule Discuss.Model.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.Model.User
    has_many :comments, Discuss.Model.Comment

    # timestamps()
  end

  @doc false
  def changeset(topic, attrs \\ %{}) do
    topic
    |> cast(attrs, [:title, :user_id])
    |> validate_required([:title, :user_id])
    |> unique_constraint(:title)
  end
end
