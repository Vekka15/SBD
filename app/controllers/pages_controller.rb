class PagesController < ApplicationController
  def show
      @stat = ActiveRecord::Base.connection.execute("select test_function()")
  end
end
