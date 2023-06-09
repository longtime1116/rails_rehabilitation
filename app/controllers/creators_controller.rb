class CreatorsController < ApplicationController
  before_action :verify_qualified_creator, only: :show

  def new
    redirect_to login_path unless logged_in?
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

  def verify_qualified_creator
    redirect_to(root_url) unless params[:id] == current_creator.id.to_s
  end
end
