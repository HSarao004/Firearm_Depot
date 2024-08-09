class StaticPagesController < ApplicationController
  def show
    @static_page = StaticPage.find_by(slug: params[:slug])
    return if @static_page

    render file: Rails.root.join("public/404.html").to_s, status: :not_found
  end
end
