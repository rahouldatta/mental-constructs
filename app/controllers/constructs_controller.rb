class ConstructsController < ApplicationController
  before_filter :authenticate_thinker!
  before_filter :load

  layout 'thinker'

  def load
    @construct_dossiers = current_thinker.treatment_construct_dossiers.order("dossier_quality DESC")

  end

  def show
    @construct = Construct.find(params[:id])
    @thinking_hat = @construct.thinking_hat
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @construct }
    end
  end

  #def new
  #  @construct = Construct.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @construct }
  #  end
  #end

  def edit
    @construct = Construct.find(params[:id])
    @thinking_hat = @construct.thinking_hat
  end

  #def create
  #  @construct = Construct.new(params[:construct])
  #  @construct.thinker_id = current_thinker.id
  #  @construct.dossier_id = current_thinker.treatment_construct_dossiers.find_by_dossier_name(params[:construct][:dossier_id]).id unless params[:construct][:dossier_id].eql?("Select Dossier")
  #  respond_to do |format|
  #    if @construct.save
  #      format.html { redirect_to thinker_path(current_thinker), notice: 'Construct was successfully created.' }
  #      format.json { render json: @construct, status: :created, location: @construct }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @construct.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def update
    @construct = Construct.find(params[:id])
    @construct.dossier_id = nil if params[:construct][:dossier_id].eql? "Select Dossier"
    respond_to do |format|
      if @construct.update_attributes(params[:construct])
        format.html { redirect_to edit_construct_path(@construct), notice: 'Construct was successfully updated.' }
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
    thinker_path(current_thinker)
  end

    #============================== Thinking Hat Methods ==============================
  def record_black_hat_thought

  end

  def record_white_hat_thought
    c = Construct.find(params[:construct_id])
    t = c.thinking_hat
    t.update_attributes(:white_hat => t.white_hat << params[:flash])
    @thinking_hat = c.thinking_hat
    @construct = Construct.find(params[:construct_id])
  end

  def record_red_hat_thought

  end

  def record_green_hat_thought

  end

  def record_yellow_hat_thought

  end

end
