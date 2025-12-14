defmodule OpenApiMeilisearch.SimilarDocuments do
  @moduledoc """
  Provides API endpoints related to similar documents
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Get similar documents with GET

  Retrieve documents similar to a specific search result.

  ## Options

    * `id`
    * `offset`
    * `limit`
    * `attributes_to_retrieve`
    * `retrieve_vectors`
    * `filter`
    * `show_ranking_score`
    * `show_ranking_score_details`
    * `ranking_score_threshold`
    * `embedder`

  """
  @spec similar_get(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SimilarResult.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def similar_get(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :attributes_to_retrieve,
        :embedder,
        :filter,
        :id,
        :limit,
        :offset,
        :ranking_score_threshold,
        :retrieve_vectors,
        :show_ranking_score,
        :show_ranking_score_details
      ])

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.SimilarDocuments, :similar_get},
      url: "/indexes/#{indexUid}/similar",
      method: :get,
      query: query,
      response: [
        {200, {OpenApiMeilisearch.SimilarResult, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get similar documents with POST

  Retrieve documents similar to a specific search result.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec similar_post(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.SimilarQuery.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SimilarResult.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def similar_post(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.SimilarDocuments, :similar_post},
      url: "/indexes/#{indexUid}/similar",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.SimilarQuery, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SimilarResult, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
