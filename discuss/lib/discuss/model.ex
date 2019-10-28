defmodule Discuss.Model do
  @moduledoc """
  The Fota context.
  """

  import Ecto.Query, warn: false
  alias Discuss.Repo

  alias Discuss.Model.Topic

  def list_topic do
    Repo.all(Topic)
  end

  def insert_topic(topic) do
    Repo.insert(topic)
  end

end
