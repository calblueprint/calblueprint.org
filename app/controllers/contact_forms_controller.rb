class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new contact_form_params
    if @contact_form.save
      flash[:success] = t 'contact_forms.create.success'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :subject, :message)
  end
end
