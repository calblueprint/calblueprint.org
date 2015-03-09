module Admins
  class MembersController < BaseController
    def index
      @members = Member.all
    end

    def destroy
      Member.find_by(id: params[:id]).destroy
      redirect_to action: 'index'
    end
  end
end
