class PostsController < ApplicationController
  def index
    @kimochis = Kimochi.all
  end
end
