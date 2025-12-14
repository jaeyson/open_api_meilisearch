defmodule OpenApiMeilisearch.FacetSearch do
  @moduledoc """
  Provides API endpoint related to facet search
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Perform a facet search

  Search for a facet value within a given facet.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec search(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.FacetSearchQuery.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SearchResult.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def search(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.FacetSearch, :search},
      url: "/indexes/#{indexUid}/facet-search",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.FacetSearchQuery, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SearchResult, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
