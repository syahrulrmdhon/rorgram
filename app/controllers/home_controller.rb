class HomeController < ApplicationController
  /before_filter :authorize,only: [:index]/
  def index
    @posts = Post.all.order("created_at DESC")
  end
end
