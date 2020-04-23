defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  def render(assigns) do
    ~L"""
      <div id="post-<%= @post.id %>" class="post">
        <div class="row">
          <div class="column column-10">
            <div class="post-avatar"></div>
          </div>
          <div class="column column-90 post-body">
            <b><%= @post.username %></b>
            <br />
            <%= @post.body %>
          </div>
        </div>
        <div class="row">
          <div class="column">
            <i class="far fa-heart"></i><%= @post.likes_count %>
          </div>
          <div class="column">
            <i class="fas fa-retweet"></i><%= @post.reposts_count %>
          </div>
          <div class="column">
            <%= live_patch "Edit", to: Routes.post_index_path(@socket, :edit, @post) %>
            <i class="far fa-edit"></i>
            <%= link "Delete", to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure?"] %>
            <i class="fas fa-trash"></i>
          </div>
        </div>
      </div>
    """
  end
end
