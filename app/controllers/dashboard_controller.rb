class DashboardController < ApplicationController
  def root
    render :json => {message: "Welcome to my-real-trello API, enjoy and have fun testing this, for more information about the requests here: https://documenter.getpostman.com/view/6224077/SW14UGku"}
  end
end
