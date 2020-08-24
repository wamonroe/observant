class PageMonitorsController < ApplicationController
  before_action :set_page_monitor, only: [:show, :edit, :update, :destroy]

  # GET /page_monitors
  def index
    @page_monitors = PageMonitor.all
  end

  # GET /page_monitors/1
  def show
  end

  # GET /page_monitors/new
  def new
    @page_monitor = PageMonitor.new
  end

  # GET /page_monitors/1/edit
  def edit
  end

  # POST /page_monitors
  def create
    @page_monitor = PageMonitor.new(permitted_params)

    respond_to do |format|
      if @page_monitor.save
        format.html { redirect_to @page_monitor, notice: 'PageMonitor was successfully created.' }
        format.json { render :show, status: :created, location: @page_monitor }
      else
        format.html { render :new }
        format.json { render json: @page_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_monitors/1
  def update
    respond_to do |format|
      if @page_monitor.update(permitted_params)
        format.html { redirect_to @page_monitor, notice: 'PageMonitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_monitor }
      else
        format.html { render :edit }
        format.json { render json: @page_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_monitors/1
  def destroy
    @page_monitor.destroy
    respond_to do |format|
      format.html { redirect_to page_monitors_url, notice: 'PageMonitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview
    @preview = Observe::Scraper.call(permitted_params)
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_page_monitor
    @page_monitor = PageMonitor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def permitted_params
    params.require(:page_monitor).permit(:url, :name, :enabled, :frequency, selections: [])
  end
end
