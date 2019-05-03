class MainModel < ApplicationRecord
  after_commit :register_log, on :update

  def register_log
    binding.pry
  end
end
