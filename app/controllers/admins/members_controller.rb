module Admins
  class MembersController < BaseController
    def index
      @members = Member.all
    end

    def show
      @member = Member.find(params[:id])
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

    def edit
      @member = Member.find(params[:id])
    end

    def update
      @member = Member.find(params[:id])
      if @member.update_attributes(member_params)
        redirect_to action: 'index'
      else
        render 'edit'
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
