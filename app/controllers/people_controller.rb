class PeopleController < ApplicationController
  before_filter :require_admin
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    if request.xhr?
      @people = []
      all_people = Person.where("lower(first_name) like ? OR lower(last_name) like ?","%#{params[:q].downcase}%", "%#{params[:q].downcase}%")
      all_people.each do |people|
        @people << {id: people.id,rwu_id: people.rwu_id , user_name: "#{people.first_name} #{people.last_name}", nickname: people.nickname, middle_name: people.middle_name, suffix: people.suffix, title: people.title, first_name: people.first_name,last_name: people.last_name}
      end
      render :json=> @people
    else
      @people = Person.all.order(:last_name).order(:first_name).order(:middle_name)
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:rwu_id, 
                                     :first_name, 
                                     :nickname,
                                     :middle_name,
                                     :last_name, 
                                     :suffix, 
                                     :image_url,
                                     :title,
                                     :image_url)
    end
end
