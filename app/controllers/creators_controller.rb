class CreatorsController < ApplicationController
  def new
    redirect_to login_path unless login?
    redirect_to creator_path(current_creator) if current_creator
    @creator = Creator.new
  end

  def create
    @creator = Creator.new(creator_params(params))
    if @creator.save
      redirect_to @creator
    else
      render 'new'
    end
  end

  def show
    @creator = Creator.find(params[:id])
  end

  private

  def creator_params(params)
    params.require(:creator).permit(:user_id, :pen_name)
  end
end
