class ItemsController < ApplicationController
before_action :find_item, only: [:show]

	  def new
      redirect_to root_path if !logged_in?
  	@item  = current_user.items.build
  end

  def create
    @item  = current_user.items.build(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def show
  	
  end

  def edit
  end

  def index
  	@item = Item.all
  end

private 

def item_params
	params.require(:item).permit(:name, :description, :image)
end

def find_item
	@item = Item.find(params[:id])
end

end
