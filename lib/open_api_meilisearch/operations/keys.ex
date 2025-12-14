defmodule OpenApiMeilisearch.Keys do
  @moduledoc """
  Provides API endpoints related to keys
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Create an API Key

  Create an API Key.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_api_key(body :: OpenApiMeilisearch.CreateApiKey.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.KeyView.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def create_api_key(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenApiMeilisearch.Keys, :create_api_key},
      url: "/keys",
      body: body,
      method: :post,
      request: [{"application/json", {OpenApiMeilisearch.CreateApiKey, :t}}],
      response: [
        {202, {OpenApiMeilisearch.KeyView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a key

  Delete the specified API key.
  """
  @spec delete_api_key(uidOrKey :: String.t(), opts :: keyword) ::
          :ok | {:error, OpenApiMeilisearch.ResponseError.t()}
  def delete_api_key(uidOrKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [uidOrKey: uidOrKey],
      call: {OpenApiMeilisearch.Keys, :delete_api_key},
      url: "/keys/#{uidOrKey}",
      method: :delete,
      response: [{204, :null}, {401, {OpenApiMeilisearch.ResponseError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get an API Key

  Get an API key from its `uid` or its `key` field.
  """
  @spec get_api_key(uidOrKey :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.KeyView.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_api_key(uidOrKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [uidOrKey: uidOrKey],
      call: {OpenApiMeilisearch.Keys, :get_api_key},
      url: "/keys/#{uidOrKey}",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.KeyView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get API Keys

  List all API Keys

  ## Options

    * `offset`
    * `limit`

  """
  @spec list_api_keys(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.PaginationViewKeyView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def list_api_keys(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Keys, :list_api_keys},
      url: "/keys",
      method: :get,
      query: query,
      response: [
        {202, {OpenApiMeilisearch.PaginationViewKeyView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a Key

  Update the name and description of an API key.
  Updates to keys are partial. This means you should provide only the fields you intend to update, as any fields not present in the payload will remain unchanged.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec patch_api_key(
          uidOrKey :: String.t(),
          body :: OpenApiMeilisearch.PatchApiKey.t(),
          opts :: keyword
        ) ::
          {:ok, OpenApiMeilisearch.KeyView.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def patch_api_key(uidOrKey, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [uidOrKey: uidOrKey, body: body],
      call: {OpenApiMeilisearch.Keys, :patch_api_key},
      url: "/keys/#{uidOrKey}",
      body: body,
      method: :patch,
      request: [{"application/json", {OpenApiMeilisearch.PatchApiKey, :t}}],
      response: [
        {200, {OpenApiMeilisearch.KeyView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
