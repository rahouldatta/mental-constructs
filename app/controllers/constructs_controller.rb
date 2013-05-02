class ConstructsController < ApplicationController
  before_filter :authenticate_thinker!

  layout 'thinker'

  def show
    @construct = Construct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @construct }
    end
  end

  # GET /constructs/new
  # GET /constructs/new.json
  def new
    @construct = Construct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @construct }
    end
  end

  # GET /constructs/1/edit
  def edit
    @construct = Construct.find(params[:id])
  end

  # POST /constructs
  # POST /constructs.json
  def create
    @construct = Construct.new(params[:construct])
    @construct.thinker_id = current_thinker.id
    if params[:construct][:dossier_id].eql? "Select Dossier"
      @construct.dossier_id = nil
    else
      @construct.dossier_id = Dossier.find_by_dossier_name(params[:construct][:dossier_id]).id rescue nil
    end
    respond_to do |format|
      if @construct.save
        format.html { redirect_to thinker_path(current_thinker), notice: 'Construct was successfully created.' }
        format.json { render json: @construct, status: :created, location: @construct }
      else
        format.html { render action: "new" }
        format.json { render json: @construct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /constructs/1
  # PUT /constructs/1.json
  def update
    @construct = Construct.find(params[:id])
    @construct.dossier_id = nil if params[:construct][:dossier_id].eql? "Select Dossier"
    respond_to do |format|
      if @construct.update_attributes(params[:construct])
        format.html { redirect_to construct_path(@construct), notice: 'Construct was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @construct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constructs/1
  # DELETE /constructs/1.json
  def destroy
    @construct = Construct.find(params[:id])
    @construct.destroy

    respond_to do |format|
      format.html { redirect_to thinker_path(current_thinker) }
      format.json { head :no_content }
    end
  end

  def share_construct
    @construct = Construct.find(params[:id])
    @construct.exhibit_construct
    @construct.update_attributes(:share => true)
  end
end
