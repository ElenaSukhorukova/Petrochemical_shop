module Gender
  extend ActiveSupport::Concern

  VALID_GENDERS = ['Female', 'Male']

  included do 
    validates :gender, inclusion: { in: VALID_GENDERS }
  end
end