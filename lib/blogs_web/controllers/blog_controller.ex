defmodule BlogsWeb.BlogController do
  use BlogsWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end

  def create(conn, %{"blogs" => blog_params}) do
    changeset = Blogs.Articles.changeset(%Blogs.Articles{}, blog_params)

    case Blogs.Repo.insert(changeset) do
      {:ok, _blog} ->
        IO.puts "Success"
        conn
        |>put_flash(:info, "Created successfully")
        |>redirect(to: ~p"/blogs")

      {:error, _changeset} ->
        conn
        |>put_flash(:error, "Invalid input. Please try again!")

    end

  end

  def show(conn, _params) do
    render(conn, :create, layout: false)
  end
end
