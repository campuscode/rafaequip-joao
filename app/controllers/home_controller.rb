class HomeController < ApplicationController
  def index
    @proposal = Proposal.new
  end
end
