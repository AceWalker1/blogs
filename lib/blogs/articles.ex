defmodule Blogs.Articles do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :title, :string
    field :content, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(articles, attrs) do
    articles
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
