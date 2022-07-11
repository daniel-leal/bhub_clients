defmodule BhubClients.Repo.Pagination do
  import Ecto.Query
  defstruct [:entries, :total_entries, :page_number, :per_page, :pages, :query]

  @per_page 10

  def new(query, params, opts \\ []) do
    page_number = params |> Map.get("page", 1) |> to_int()
    per_page = params |> Map.get("per_page", @per_page) |> to_int()
    total = total_entries(query, params)

    %BhubClients.Repo.Pagination{
      entries: entries(query, page_number, per_page, opts),
      total_entries: total,
      page_number: page_number,
      per_page: per_page,
      pages: total_pages(total, per_page),
      query: query
    }
  end

  defp entries(query, page_number, per_page, opts) do
    offset = per_page * (page_number - 1)

    from(query, offset: ^offset, limit: ^per_page)
    |> BhubClients.Repo.all(opts)
  end

  defp total_entries(query, %{"total" => nil}), do: total_entries(query, %{})
  defp total_entries(_query, %{"total" => total}), do: total

  defp total_entries(query, _params) do
    query
    |> BhubClients.Repo.aggregate(:count, :id)
  end

  defp total_pages(total, per_page) do
    Float.ceil(total / per_page) |> Kernel.trunc()
  end

  defp to_int(i) when is_integer(i), do: i

  defp to_int(s) when is_binary(s) do
    case Integer.parse(s) do
      {i, _} -> i
      :error -> :error
    end
  end
end
