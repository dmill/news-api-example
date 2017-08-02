class NewsSourcesController < ApplicationController

  def create
    p params
    p ")))))))))))))))))))))))))))))"
    @source = NewsSource.new(news_source_params)

    if @source.save
      render json: @source, status: 201
    else
      render json: { errors: @source.errors }, status: 422
    end
  end

  private

  def news_source_params
    params.require(:news_source).permit(:source_code, :name)
  end
end
