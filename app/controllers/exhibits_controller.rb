class ExhibitsController < ApplicationController
  before_filter :authenticate_thinker!

  layout 'exhibit'

  def index

  end

  def show

  end

end
