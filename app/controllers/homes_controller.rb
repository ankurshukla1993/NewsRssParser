class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes
  # GET /homes.json
  def index
    #@homes = Home.all
    @top_stories = TimesOfIndiaParser.top_story_parsing
    @india_top_stories = TimesOfIndiaParser.india_top_stories
    @world_top_stories = TimesOfIndiaParser.world_top_stories
    @nri_top_stories = TimesOfIndiaParser.nri_top_stories
    @business_top_stories = TimesOfIndiaParser.business_top_stories
    @cricket_top_stories = TimesOfIndiaParser.cricket_top_stories
    @sports_top_stories = TimesOfIndiaParser.sports_top_stories
    @health_top_stories = TimesOfIndiaParser.health_top_stories
    @science_top_stories = TimesOfIndiaParser.science_top_stories
    @environment_top_stories = TimesOfIndiaParser.environment_top_stories
    @tech_top_stories = TimesOfIndiaParser.tech_top_stories
    @education_top_stories = TimesOfIndiaParser.education_top_stories
    @sundaytoi_top_stories = TimesOfIndiaParser.sundaytoi_top_stories
    @opinion_top_stories = TimesOfIndiaParser.opinion_top_stories
    @entertainment_top_stories = TimesOfIndiaParser.entertainment_top_stories
    @lifeandstyle_top_stories = TimesOfIndiaParser.lifeandstyle_top_stories
    @mostread_top_stories = TimesOfIndiaParser.mostread_top_stories
    @mostshared_top_stories = TimesOfIndiaParser.mostshared_top_stories
    @mostcommented_top_stories = TimesOfIndiaParser.mostcommented_top_stories
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render action: 'show', status: :created, location: @home }
      else
        format.html { render action: 'new' }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params[:home]
    end
end
