defmodule OpenApiMeilisearch.Documents do
  @moduledoc """
  Provides API endpoints related to documents
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Delete all documents

  Delete all documents in the specified index.
  """
  @spec clear_all_documents(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def clear_all_documents(indexUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Documents, :clear_all_documents},
      url: "/indexes/#{indexUid}/documents",
      method: :delete,
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a document

  Delete a single document by id.
  """
  @spec delete_document(indexUid :: String.t(), documentId :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def delete_document(indexUid, documentId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, documentId: documentId],
      call: {OpenApiMeilisearch.Documents, :delete_document},
      url: "/indexes/#{indexUid}/documents/#{documentId}",
      method: :delete,
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete documents by batch

  Delete a set of documents based on an array of document ids.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec delete_documents_batch(indexUid :: String.t(), body :: [map], opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def delete_documents_batch(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Documents, :delete_documents_batch},
      url: "/indexes/#{indexUid}/delete-batch",
      body: body,
      method: :post,
      request: [{"application/json", [:map]}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete documents by filter

  Delete a set of documents based on a filter.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec delete_documents_by_filter(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.DocumentDeletionByFilter.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def delete_documents_by_filter(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Documents, :delete_documents_by_filter},
      url: "/indexes/#{indexUid}/documents/delete",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.DocumentDeletionByFilter, :t}}],
      response: [
        {202, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get documents with POST

  Get a set of documents.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec documents_by_query_post(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.BrowseQuery.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.PaginationViewValue.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def documents_by_query_post(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Documents, :documents_by_query_post},
      url: "/indexes/#{indexUid}/documents/fetch",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.BrowseQuery, :t}}],
      response: [
        {200, {OpenApiMeilisearch.PaginationViewValue, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Edit documents by function.

  Use a [RHAI function](https://rhai.rs/book/engine/hello-world.html) to edit one or more documents directly in Meilisearch.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec edit_documents_by_function(
          indexUid :: String.t(),
          body :: OpenApiMeilisearch.DocumentEditionByFunction.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def edit_documents_by_function(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Documents, :edit_documents_by_function},
      url: "/indexes/#{indexUid}/documents/edit",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.DocumentEditionByFunction, :t}}],
      response: [
        {202, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get one document

  Get one document from its primary key.

  ## Options

    * `fields`
    * `retrieveVectors`

  """
  @spec get_document(indexUid :: String.t(), documentId :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_document(indexUid, documentId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:fields, :retrieveVectors])

    client.request(%{
      args: [indexUid: indexUid, documentId: documentId],
      call: {OpenApiMeilisearch.Documents, :get_document},
      url: "/indexes/#{indexUid}/documents/#{documentId}",
      method: :get,
      query: query,
      response: [
        {200, :map},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get documents

  Get documents by batches.

  ## Options

    * `offset`
    * `limit`
    * `fields`
    * `retrieveVectors`
    * `ids`
    * `filter`

  """
  @spec get_documents(indexUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.PaginationViewValue.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_documents(indexUid, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:fields, :filter, :ids, :limit, :offset, :retrieveVectors])

    client.request(%{
      args: [indexUid: indexUid],
      call: {OpenApiMeilisearch.Documents, :get_documents},
      url: "/indexes/#{indexUid}/documents",
      method: :get,
      query: query,
      response: [
        {200, {OpenApiMeilisearch.PaginationViewValue, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}},
        {404, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Add or replace documents

  Add a list of documents or replace them if they already exist.

  If you send an already existing document (same id) the whole existing document will be overwritten by the new document. Fields previously in the document not present in the new document are removed.

  For a partial update of the document see Add or update documents route.
  > info
  > If the provided index does not exist, it will be created.
  > info
  > Use the reserved `_geo` object to add geo coordinates to a document. `_geo` is an object made of `lat` and `lng` field.
  >
  > When the vectorStore feature is enabled you can use the reserved `_vectors` field in your documents.
  > It can accept an array of floats, multiple arrays of floats in an outer array or an object.
  > This object accepts keys corresponding to the different embedders defined your index settings.

  ## Options

    * `primaryKey`: The primary key of the documents. primaryKey is optional. If you want to set the primary key of your index through this route,
      it only has to be done the first time you add documents to the index. After which it will be ignored if given.
    * `csvDelimiter`: Customize the csv delimiter when importing CSV documents.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec replace_documents(indexUid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def replace_documents(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:csvDelimiter, :primaryKey])

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Documents, :replace_documents},
      url: "/indexes/#{indexUid}/documents",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Add or update documents

  Add a list of documents or update them if they already exist.
  If you send an already existing document (same id) the old document will be only partially updated according to the fields of the new document. Thus, any fields not present in the new document are kept and remained unchanged.
  To completely overwrite a document, see Add or replace documents route.
  > info
  > If the provided index does not exist, it will be created.
  > info
  > Use the reserved `_geo` object to add geo coordinates to a document. `_geo` is an object made of `lat` and `lng` field.
  >
  > When the vectorStore feature is enabled you can use the reserved `_vectors` field in your documents.
  > It can accept an array of floats, multiple arrays of floats in an outer array or an object.
  > This object accepts keys corresponding to the different embedders defined your index settings.

  ## Options

    * `primaryKey`: The primary key of the documents. primaryKey is optional. If you want to set the primary key of your index through this route,
      it only has to be done the first time you add documents to the index. After which it will be ignored if given.
    * `csvDelimiter`: Customize the csv delimiter when importing CSV documents.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_documents(indexUid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def update_documents(indexUid, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:csvDelimiter, :primaryKey])

    client.request(%{
      args: [indexUid: indexUid, body: body],
      call: {OpenApiMeilisearch.Documents, :update_documents},
      url: "/indexes/#{indexUid}/documents",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
