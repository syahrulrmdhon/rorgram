class PostController < ApplicationController
  def create
  end

  def store
    # upload image to cloudinary
    @image = Cloudinary::Uploader.upload(params[:media])
    # create a new post object and save to db
    @post = Post.new({:caption => params[:caption], :media => @image['secure_url']})

    if @post.save
      # broadcasting posts using pusher
      Pusher.trigger('posts-channel','new-post', {
        id: @post.id,
        caption: @post.caption,
        media: @post.media
      })
    end 

    redirect_to('/')
  end
end
