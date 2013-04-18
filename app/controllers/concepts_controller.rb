class ConceptsController < ApplicationController
  before_filter :authenticate_thinker!

  layout 'thinker'

  def show
    @concept = Concept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concept }
    end
  end

  def new
    @concept = Concept.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @concept }
    end
  end

  def edit
    @concept = Concept.find(params[:id])
  end

  def create
    @concept = Concept.new(params[:concept])
    @concept.thinker_id = current_thinker.id
    respond_to do |format|
      if @concept.save
        format.html { redirect_to thinker_path(current_thinker), notice: 'Concept was successfully created.' }
        format.json { render json: @concept, status: :created, location: @concept }
      else
        format.html { render action: "new" }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @concept = Concept.find(params[:id])

    respond_to do |format|
      if @concept.update_attributes(params[:concept])
        format.html { redirect_to thinker_path(current_thinker), notice: 'Concept was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy

    respond_to do |format|
      format.html { redirect_to thinker_path(current_thinker) }
      format.json { head :no_content }
    end
  end
end
