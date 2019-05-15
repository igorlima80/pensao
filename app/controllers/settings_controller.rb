class SettingsController < Admin::ApplicationController
  load_and_authorize_resource

  # GET /settings
  def index
    @settings = Setting.all
  end

  # GET /settings/1
  def show
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_to @setting, notice: 'Setting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /settings/1
  def update
    if @setting.update(setting_params)
      redirect_to @setting, notice: 'Setting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /settings/1
  def destroy
    @setting.destroy
    redirect_to settings_url, notice: 'Setting was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def setting_params
      params.require(:setting).permit(:percentage_of_administration, :percentage_of_franchisee, 
                     :percentage_of_property, :max_of_installments, 
                     :days_for_reserve_refund, :days_of_ticket_validity, :card_cost_percentage, 
                     :percentage_of_installments, :max_of_installments_without_percentage)
    end
end
