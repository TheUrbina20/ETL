class LogsController < ApplicationController
  def index
    @logs = Log.using(:dwh_t).all
  end
end
