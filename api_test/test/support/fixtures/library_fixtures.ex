defmodule ApiTest.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiTest.Library` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        title: "some title"
      })
      |> ApiTest.Library.create_book()

    book
  end
end
