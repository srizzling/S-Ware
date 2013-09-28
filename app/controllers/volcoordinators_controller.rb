class VolcoordinatorsController < ApplicationController
  # GET /volcoordinators
  # GET /volcoordinators.json
  def index
    @volcoordinators = Volcoordinator.all
    @whiteboards = Whiteboard.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volcoordinators }
    end
  end

  # GET /volcoordinators/1
  # GET /volcoordinators/1.json
  def show
    @volcoordinator = Volcoordinator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volcoordinator }
    end
  end
  
  def showvolunteers
    @volunteers = Volunteer.all
    
    respond_to do |format|
      if params[:reviewtype] == "newvolunteers"
        format.html { redirect_to volcoordinator_path }
        format.json { render json: @volunteers }
      elsif params[:reviewtype] == "orientedvolunteers"
        format.html { redirect_to volcoordinator_orientedvolunteers_path }
        format.json { render json: @volunteers }
      else
        format.html # show.html.erb
        format.json { render json: @volcoordinator }
      end
    end
  end
  
  def newvolunteers
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volcoordinators }
    end
  end
  
  def orientedvolunteers
    @volunteers = Volunteer.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volcoordinators }
    end
  end
  
  def review
    @volunteer = Volunteer.find(params[:id])
    
    respond_to do |format|
      format.html 
      format.json { render json: @volunteer }
    end
  end
  
  def approve
    @volunteers = Volunteer.all
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      if params[:reviewtype] == "newvolunteers"
        if params[:option] == "Approve"
         #@volunteer.status = "Awaiting Orientation"
          format.html { redirect_to volcoordinator_newvolunteers_path, notice: "Approved #{@volunteer.firstname} #{@volunteer.lastname} as a volunteer. They are now: #{}" }
          format.json { render json: @volunteers }
          #format.json { render json: @volunteer, status: :created, location: @volunteer }
        elsif params[:option] == "Reject"
          #@volunteer.status = "Rejected"
	  format.html { redirect_to volcoordinator_newvolunteers_path, notice: "Rejected #{@volunteer.firstname} #{@volunteer.lastname} as a volunteer." }
          format.json { render json: @volunteers }
        end
      elsif params[:reviewtype] == "orientedvolunteers"
	if params[:option] == "Approve"
          #@volunteer.status = "Awaiting Orientation"
          format.html { redirect_to volcoordinator_orientedvolunteers_path, notice: "Approved #{@volunteer.firstname} #{@volunteer.lastname} as a volunteer. They are now: #{}" }
          format.json { render json: @volunteers }
          #format.json { render json: @volunteer, status: :created, location: @volunteer }
	elsif params[:option] == "Reject"
          #@volunteer.status = "Rejected"
	  format.html { redirect_to volcoordinator_orientedvolunteers_path, notice: "Rejected #{@volunteer.firstname} #{@volunteer.lastname} as a volunteer." }
          format.json { render json: @volunteers }
	end
      end
    end
  end

=begin
  # GET /volcoordinators/new
  # GET /volcoordinators/new.json
  def new
    @volcoordinator = Volcoordinator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volcoordinator }
    end
  end
=end

  # GET /volcoordinators/1/edit
  def edit
    @volcoordinator = Volcoordinator.find(params[:id])
  end

  # POST /volcoordinators
  # POST /volcoordinators.json
  def create
    @volcoordinator = Volcoordinator.new(params[:volcoordinator])

    respond_to do |format|
      if @volcoordinator.save
        format.html { redirect_to @volcoordinator, notice: 'Volcoordinator was successfully created.' }
        format.json { render json: @volcoordinator, status: :created, location: @volcoordinator }
      else
        format.html { render action: "new" }
        format.json { render json: @volcoordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volcoordinators/1
  # PUT /volcoordinators/1.json
  def update
    @volcoordinator = Volcoordinator.find(params[:id])

    respond_to do |format|
      if @volcoordinator.update_attributes(params[:volcoordinator])
        format.html { redirect_to @volcoordinator, notice: 'Volcoordinator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @volcoordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volcoordinators/1
  # DELETE /volcoordinators/1.json
  def destroy
    @volcoordinator = Volcoordinator.find(params[:id])
    @volcoordinator.destroy

    respond_to do |format|
      format.html { redirect_to volcoordinators_url }
      format.json { head :no_content }
    end
  end
end
