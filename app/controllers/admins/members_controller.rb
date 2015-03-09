module Admins
  class MembersController < BaseController
    def index
      @members = Member.all
    end

    def new
      @member = Member.new
    end

    def create
      @member = Member.new(member_params)
      if @member.save
        redirect_to action: 'index'
      else
        # TODO: add banner describing why form was invalid
        redirect_to action: 'new'
      end
    end

    def destroy
      Member.find_by(id: params[:id]).destroy
      redirect_to action: 'index'
    end

    private

    def member_params
      params.require(:member).permit(:last_name, :first_name, :email)
    end
  end
end
