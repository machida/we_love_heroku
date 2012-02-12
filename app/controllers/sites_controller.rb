class SitesController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy]
  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.order('id DESC').page(params[:page]).per(25)
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new
    @site.url = 'http://'
    @site.creator = current_user.name if user_signed_in?
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = current_user.sites.find(params[:id])
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])
    @site.user_id = current_user.id if user_signed_in?
    respond_to do |format|
      if @site.save
        url = (user_signed_in?)? current_user_path : @site
        format.html { redirect_to url, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = current_user.sites.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = current_user.sites.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url, :notice => t('sites.destroy.completed') }
      format.json { head :no_content }
    end
  end
end
