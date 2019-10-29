defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  alias Discuss.Model.{Topic, Comment, User}
  alias Discuss.Repo

  def join("comments:" <> topicId, _params, socket) do
    topic_id = String.to_integer(topicId);
    topic = Topic
      |> Repo.get(topic_id)
      |> Repo.preload(comments: [:user])

    {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
  end

  def handle_in(name, message, socket) do
    %{"content" => content} = message
    topic = socket.assigns.topic
    user = Repo.get(User, socket.assigns.user_id)

    changeset = topic
      |> Ecto.build_assoc(:comments)
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:user, user)
      |> Comment.changeset(%{content: content})

    IO.inspect(changeset)

    case Repo.insert(changeset) do
      {:ok, comment} ->
        broadcast!(socket, "comments:#{socket.assigns.topic.id}:new",
          %{comment: comment}
        )

        {:reply, :ok, socket}
      {:error, _reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end

  end

end
