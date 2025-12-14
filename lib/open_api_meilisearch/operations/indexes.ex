defmodule OpenApiMeilisearch.Indexes do
  @moduledoc """
  Provides API endpoints related to indexes
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Create index

  Create an index.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_index(body :: OpenApiMeilisearch.IndexCreateRequest.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def create_index(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenApiMeilisearch.Indexes, :create_index},
      url: "/indexes",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.IndexCreateRequest, :t}}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete index

  Delete an index.
  """
  @spec delete_index(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def delete_index(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Indexes, :delete_index},
      url: "/indexes/#{indexUid}",
      method: :delete,
      response: [
        {202, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get index

  Get information about an index.
  """
  @spec get_index(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.IndexView.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_index(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Indexes, :get_index},
      url: "/indexes/#{indexUid}",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.IndexView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List indexes

  List all indexes.

  ## Options

    * `offset`: The number of indexes to skip before starting to retrieve anything
    * `limit`: The number of indexes to retrieve

  """
  @spec list_indexes(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.PaginationViewIndexView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def list_indexes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Indexes, :list_indexes},
      url: "/indexes",
      method: :get,
      query: query,
      response: [
        {200, {OpenApiMeilisearch.PaginationViewIndexView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

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
      call: {OpenApiMeilisearch.Indexes, :search_with_post},
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
      call: {OpenApiMeilisearch.Indexes, :search_with_url_query},
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

  @doc """
  Swap indexes

  Swap the documents, settings, and task history of two or more indexes. You can only swap indexes in pairs. However, a single request can swap as many index pairs as you wish.
  Swapping indexes is an atomic transaction: either all indexes are successfully swapped, or none are.
  Swapping indexA and indexB will also replace every mention of indexA by indexB and vice-versa in the task history. enqueued tasks are left unmodified.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec swap_indexes(body :: [OpenApiMeilisearch.SwapIndexesPayload.t()], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def swap_indexes(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenApiMeilisearch.Indexes, :swap_indexes},
      url: "/swap-indexes",
      body: body,
      method: :post,
      request: [{"application/json", [{OpenApiMeilisearch.SwapIndexesPayload, :t}]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update index

  Update the `primaryKey` of an index.
  Return an error if the index doesn't exists yet or if it contains documents.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_index(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.UpdateIndexRequest.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def update_index(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Indexes, :update_index},
      url: "/indexes/#{indexUid}",
      body: body,
      method: :patch,
      request: [{"application/json", {OpenApiMeilisearch.UpdateIndexRequest, :t}}],
      response: [
        {202, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
