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
          <a href="#" phx-click="like" phx-target={@myself} class="column">
            <i class="far fa-heart"></i> {@post.likes_count}
          </a>
        </div>
        <div class="column">
          <a href="#" phx-click="repost" phx-target={@myself} class="column">
            <i class="far fa-star"></i> {@post.reposts_count}
          </a>
        </div>
        <div class="flex flex-row gap-4">
          <div class="column">
            <.link patch={~p"/posts/#{@post.id}/edit"}><i class="far fa-edit"></i> Edit</.link>
          </div>

          <div class="column">
            <.link phx-click="delete" phx-value-id={@post.id} href="#" data-confirm="Are you sure?">
              <i class="far fa-trash-alt"></i> Delete
            </.link>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("like", _, socket) do
    Chirp.Timeline.increment_likes(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("repost", _, socket) do
    Chirp.Timeline.increment_reposts(socket.assigns.post)
    {:noreply, socket}
  end
end
