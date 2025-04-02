defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id={"post-#{@post.id}"} class="post flex flex-col rounded-xl p-[1rem] gap-2 border">
      <div class="flex flex-row gap-4">
        <div class="post-avatar h-[5rem] w-[5rem] bg-neutral-100 rounded-lg"></div>
        <div class="flex flex-col post-body">
          <b>{@post.username}</b>
          <br />{@post.body}
        </div>
      </div>
      <div class="flex flex-row justify-between mt-2">
        <div class="column">
          <i class="far fa-heart"></i> {@post.likes_count}
        </div>
        <div class="column">
          <i class="far fa-retweet"></i> {@post.reposts_count}
        </div>
        <div class="flex flex-row gap-4">
          <div class="column">
            <i class="far fa-edit"></i>
            <.link patch={~p"/posts/#{@post.id}/edit"}>Edit</.link>
          </div>

          <div class="column">
            <i class="far fa-trash-alt"></i>
            <.link phx-click="delete" phx-value-id={@post.id} href="#" data-confirm="Are you sure?">
              Delete
            </.link>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
