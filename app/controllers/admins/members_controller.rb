module Admins
  class MembersController < BaseController
    def index
      @members = Member.all
    end
  end
end
