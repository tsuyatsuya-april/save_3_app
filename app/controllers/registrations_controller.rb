class RegistrationsController < ApplicationController
  def new
    @company_registration_form = CompanyRegistrationForm.new
  end

  def create
    @company_registration_form = CompanyRegistrationForm.new(company_registration_form_params)

    if @company_registration_form.save
      # 成功
    else
      # 失敗
    end
  end

  private

  def company_registration_form_params
    params.require(:company_registration_form_params).permit(
      :name,
      :address,
      employees_attributes: [:first_name, :last_name, :job_type],
      president_attributes: [:first_name, :last_name]
    )
  end
end
