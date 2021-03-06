class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to todolist_path(list.id)
  end

  def index
    @list = List.all
  end

  def show
    @list = List.find_by(id: params[:id])
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    list = List.find_by(id: params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)

  end

  def destroy
    list = List.find_by(id: params[:id])
    list.destroy
    redirect_to("/todolists")
  end





  private

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
