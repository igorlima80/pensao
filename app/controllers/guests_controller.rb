class GuestsController < Admin::ApplicationController
  load_and_authorize_resource

  # GET /guests
  def index
    @q = Guest.ransack(params[:q])
    @guests = @q.result.joins(:user).page(params[:page]).per 10
  end

  # GET /guests/1
  def show
  end

  # GET /guests/new
  def new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      redirect_to @guest, notice: 'Guest was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /guests/1
  def update
    if @guest.update(guest_params)
      redirect_to @guest, notice: 'Guest was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /guests/1
  def destroy
    @guest.destroy
    redirect_to guests_url, notice: 'Guest was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def guest_params
      params.require(:guest).permit(:name, :email, :phone_number, :geolocation, :address, :address_number, :cep, :city_id, :image)
    end
end
