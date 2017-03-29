class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def new
    @story =  Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to story_path(@story), notice: "Story was successfully posted"
    else
      @errors = @story.errors.full_messages
      render :new
    end
  end

  def show
    @story = Story.find_by(id: params[:id])
  end

  private
    def story_params
      params.require(:story).permit(:title, :content)
    end

end
