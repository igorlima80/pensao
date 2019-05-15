class Api::CitiesController < Api::ApplicationController
  # load_and_authorize_resource

  def find
    params[:q] = {} unless params[:q]
    params[:q][:s] = 'name asc' unless params[:q][:s]
    params[:q][:name_cont] = params[:description] if params[:description]
    @q = City.ransack(params[:q])
    @cities = @q.result(distinct: true)
      .select(:id, :name, :latitude, :longitude)
      .page(params[:page])
    render json: {
      success: @cities.any?,
      message: "#{@cities.size} cidades encontradas",
      collection: @cities
    }
  end
end
