defmodule OpenApiMeilisearch.Search do
  @moduledoc """
  Provides API endpoints related to search
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Search with POST

  Search for documents matching a specific query in the given index.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec search_with_post(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.SearchQuery.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SearchResult.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def search_with_post(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Search, :search_with_post},
      url: "/indexes/#{indexUid}/search",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.SearchQuery, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SearchResult, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Search an index with GET

  Search for documents matching a specific query in the given index.

  ## Options

    * `q`
    * `vector`
    * `offset`
    * `limit`
    * `page`
    * `hitsPerPage`
    * `attributesToRetrieve`
    * `retrieveVectors`
    * `attributesToCrop`
    * `cropLength`
    * `attributesToHighlight`
    * `filter`
    * `sort`
    * `distinct`
    * `showMatchesPosition`
    * `showRankingScore`
    * `showRankingScoreDetails`
    * `facets`
    * `highlightPreTag`
    * `highlightPostTag`
    * `cropMarker`
    * `matchingStrategy`
    * `attributesToSearchOn`
    * `hybridEmbedder`
    * `hybridSemanticRatio`
    * `rankingScoreThreshold`
    * `locales`

  """
  @spec search_with_url_query(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SearchResult.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def search_with_url_query(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :attributesToCrop,
        :attributesToHighlight,
        :attributesToRetrieve,
        :attributesToSearchOn,
        :cropLength,
        :cropMarker,
        :distinct,
        :facets,
        :filter,
        :highlightPostTag,
        :highlightPreTag,
        :hitsPerPage,
        :hybridEmbedder,
        :hybridSemanticRatio,
        :limit,
        :locales,
        :matchingStrategy,
        :offset,
        :page,
        :q,
        :rankingScoreThreshold,
        :retrieveVectors,
        :showMatchesPosition,
        :showRankingScore,
        :showRankingScoreDetails,
        :sort,
        :vector
      ])

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Search, :search_with_url_query},
      url: "/indexes/#{indexUid}/search",
      method: :get,
      query: query,
      response: [
        {200, {OpenApiMeilisearch.SearchResult, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
