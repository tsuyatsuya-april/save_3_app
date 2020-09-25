class CompanyRegistrationForm
  include ActiveModel::Model

  concerning :CompanyBuilder do
    def company
      @company ||= Company.new
    end
  end

  concerning :EmployeesBuilder do
    attr_reader :employees_attributes

    def employees
      @employees_attributes ||= Employee.new
    end

    def employees_attributes=(attributes)
      @employees_attributes = Employee.new(attributes)
    end
  end

  concerning :PresidentBuilder do
    attr_reader :president_attributes

    def president
      @president_attributes ||= president.new
    end

    def employees_attributes=(attributes)
      @president_attributes = President.new(attributes)
    end
  end

  attr_accessor :name, :address

  validate :validate_something

  def save
    # バリデーションに引っかかる場合は以降の処理には行かせずfalseをコントローラーに返します
    return false if invalid?

    company.assign_attributes(company_params)
    build_asscociations

    if company.save
      true
    else
      false
    end
  end

  private

  def company_params
    {
      name: name,
      address: address
    }
  end

  def build_asscociations
    company.employees << employees
    company.president = president
  end

  def validate_something
    # Do something
  end
end
