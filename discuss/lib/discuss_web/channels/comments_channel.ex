defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  def join(name, _params, socket) do
    IO.puts("++++++")
    IO.puts(name)
    {:ok, %{}, socket}
  end

  def handle_in() do

  end

end
