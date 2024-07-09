class StaticPagesController < ApplicationController
  def show
    @static_page = StaticPage.find_by!(slug: params[:slug])
  end
end
