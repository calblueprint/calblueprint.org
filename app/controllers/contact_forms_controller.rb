class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new contact_form_params
    if @contact_form.save
      SendContactFormEmail.execute @contact_form
      redirect_to root_path, flash: { success: t("contact_forms.create.success") }
    else
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :subject, :message)
  end
end
