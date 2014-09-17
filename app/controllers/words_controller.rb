class WordsController < ApplicationController
  before_action :render_layout_if_html

  def index
    @words = Words.all
    render json: @words
  end

  def create
    render json: Words.create(params.require(:words).permit(:name, :description))
  end

  private
    def render_layout_if_html
      if request.format.symbol == :html
        render "layouts/application"
      end
    end
end
