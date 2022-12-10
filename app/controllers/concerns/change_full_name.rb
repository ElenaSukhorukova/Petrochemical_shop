module ChangeFullName
  extend ActiveSupport::Concern

  def change_full_name(model)
    if %w[Supplier Client OurCompany].include?(model.class.to_s)
      director = model.full_name_director.split(' ').map(&:capitalize).join(' ')
      model.update(full_name_director: director)
    else
      contact = model.full_name.split(' ').map(&:capitalize).join(' ')
      model.update(full_name: contact)
    end
  end
end