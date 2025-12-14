defmodule OpenApiMeilisearch.Network do
  @moduledoc """
  Provides API endpoints related to network
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Get network topology

  Get a list of all Meilisearch instances currently known to this instance.
  """
  @spec get_network(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.Network.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_network(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Network, :get_network},
      url: "/network",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.Network, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Configure Network

  Add or remove nodes from network.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec patch_network(body :: OpenApiMeilisearch.Network.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.Network.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def patch_network(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenApiMeilisearch.Network, :patch_network},
      url: "/network",
      body: body,
      method: :patch,
      request: [{"application/json", {OpenApiMeilisearch.Network, :t}}],
      response: [
        {200, {OpenApiMeilisearch.Network, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{remotes: map | nil, self: String.t() | nil}

  defstruct [:remotes, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [remotes: {:union, [:map, :null]}, self: {:union, [:string, :null]}]
  end
end
