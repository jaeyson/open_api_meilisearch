defmodule OpenApiMeilisearch.MultiSearch do
  @moduledoc """
  Provides API endpoint related to multi search
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Perform a multi-search

  Bundle multiple search queries in a single API request. Use this endpoint to search through multiple indexes at once.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec multi_search_with_post(body :: OpenApiMeilisearch.FederatedSearch.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.FederatedSearchResult.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def multi_search_with_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenApiMeilisearch.MultiSearch, :multi_search_with_post},
      url: "/multi-search",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.FederatedSearch, :t}}],
      response: [
        {200, {OpenApiMeilisearch.FederatedSearchResult, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
