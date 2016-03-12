class PagesController < ApplicationController
  def show
      @stat = ActiveRecord::Base.connection.execute("select staty()")
  end
end
