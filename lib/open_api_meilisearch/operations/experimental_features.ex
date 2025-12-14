defmodule OpenApiMeilisearch.ExperimentalFeatures do
  @moduledoc """
  Provides API endpoints related to experimental features
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Get all experimental features

  Get a list of all experimental features that can be activated via the /experimental-features route and whether or not they are currently activated.
  """
  @spec get_features(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.RuntimeTogglableFeatures.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_features(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.ExperimentalFeatures, :get_features},
      url: "/experimental-features",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.RuntimeTogglableFeatures, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Configure experimental features

  Activate or deactivate experimental features.
  """
  @spec patch_features(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.RuntimeTogglableFeatures.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def patch_features(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.ExperimentalFeatures, :patch_features},
      url: "/experimental-features",
      method: :patch,
      response: [
        {200, {OpenApiMeilisearch.RuntimeTogglableFeatures, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
