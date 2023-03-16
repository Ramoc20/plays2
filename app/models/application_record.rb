class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
class Player < ApplicationRecord
  # specify associations, validations, etc. here
end
