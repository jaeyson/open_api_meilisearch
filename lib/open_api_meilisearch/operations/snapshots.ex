defmodule OpenApiMeilisearch.Snapshots do
  @moduledoc """
  Provides API endpoint related to snapshots
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Create a snapshot

  Triggers a snapshot creation process. Once the process is complete, a snapshot is created in the snapshot directory. If the snapshot directory does not exist yet, it will be created.
  """
  @spec create_snapshot(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.SummarizedTaskView.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def create_snapshot(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Snapshots, :create_snapshot},
      url: "/snapshots",
      method: :post,
      response: [
        {202, {OpenApiMeilisearch.SummarizedTaskView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
