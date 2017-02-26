class ItemsController < ApplicationController
	  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to @item
  	else
  		render 'new'
  	end
  end

  def show
  	@item = Item.find(params[:id])
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
	
end

end
