class PagesController < ApplicationController
  def index
  end

  def dishes
    @menu = Menu.where("active = ?", true)[0]
    @dishes = MenuItem.where("menu_id = ?", @menu.id)
  end
end
