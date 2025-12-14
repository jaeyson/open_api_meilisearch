defmodule OpenApiMeilisearch.Batches do
  @moduledoc """
  Provides API endpoints related to batches
  """

  @default_client OpenApiMeilisearch.Client

  @doc """
  Get one batch

  Get a single batch.
  """
  @spec get_batch(batchUid :: String.t(), opts :: keyword) ::
          {:ok, OpenApiMeilisearch.BatchView.t()} | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_batch(batchUid, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [batchUid: batchUid],
      call: {OpenApiMeilisearch.Batches, :get_batch},
      url: "/batches/#{batchUid}",
      method: :get,
      response: [
        {200, {OpenApiMeilisearch.BatchView, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get batches

  List all batches, regardless of index. The batch objects are contained in the results array.
  Batches are always returned in descending order of uid. This means that by default, the most recently created batch objects appear first.
  Batch results are paginated and can be filtered with query parameters.

  ## Options

    * `limit`: Maximum number of results to return.
    * `from`: Fetch the next set of results from the given uid.
    * `reverse`: The order you want to retrieve the objects.
    * `batchUids`: Permits to filter tasks by their batch uid. By default, when the `batchUids` query parameter is not set, all task uids are returned. It's possible to specify several batch uids by separating them with the `,` character.
    * `uids`: Permits to filter tasks by their uid. By default, when the uids query parameter is not set, all task uids are returned. It's possible to specify several uids by separating them with the `,` character.
    * `canceledBy`: Permits to filter tasks using the uid of the task that canceled them. It's possible to specify several task uids by separating them with the `,` character.
    * `types`: Permits to filter tasks by their related type. By default, when `types` query parameter is not set, all task types are returned. It's possible to specify several types by separating them with the `,` character.
    * `statuses`: Permits to filter tasks by their status. By default, when `statuses` query parameter is not set, all task statuses are returned. It's possible to specify several statuses by separating them with the `,` character.
    * `indexUids`: Permits to filter tasks by their related index. By default, when `indexUids` query parameter is not set, the tasks of all the indexes are returned. It is possible to specify several indexes by separating them with the `,` character.
    * `afterEnqueuedAt`: Permits to filter tasks based on their enqueuedAt time. Matches tasks enqueued after the given date. Supports RFC 3339 date format.
    * `beforeEnqueuedAt`: Permits to filter tasks based on their enqueuedAt time. Matches tasks enqueued before the given date. Supports RFC 3339 date format.
    * `afterStartedAt`: Permits to filter tasks based on their startedAt time. Matches tasks started after the given date. Supports RFC 3339 date format.
    * `beforeStartedAt`: Permits to filter tasks based on their startedAt time. Matches tasks started before the given date. Supports RFC 3339 date format.
    * `afterFinishedAt`: Permits to filter tasks based on their finishedAt time. Matches tasks finished after the given date. Supports RFC 3339 date format.
    * `beforeFinishedAt`: Permits to filter tasks based on their finishedAt time. Matches tasks finished before the given date. Supports RFC 3339 date format.

  """
  @spec get_batches(opts :: keyword) ::
          {:ok, OpenApiMeilisearch.AllBatches.t()}
          | {:error, OpenApiMeilisearch.ResponseError.t()}
  def get_batches(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :afterEnqueuedAt,
        :afterFinishedAt,
        :afterStartedAt,
        :batchUids,
        :beforeEnqueuedAt,
        :beforeFinishedAt,
        :beforeStartedAt,
        :canceledBy,
        :from,
        :indexUids,
        :limit,
        :reverse,
        :statuses,
        :types,
        :uids
      ])

    client.request(%{
      args: [],
      call: {OpenApiMeilisearch.Batches, :get_batches},
      url: "/batches",
      method: :get,
      query: query,
      response: [
        {200, {OpenApiMeilisearch.AllBatches, :t}},
        {401, {OpenApiMeilisearch.ResponseError, :t}}
      ],
      opts: opts
    })
  end
end
