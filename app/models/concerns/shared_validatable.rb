module SharedValidatable
  extend ActiveSupport::Concern

  included do
    validates_presence_of :email
    validates_uniqueness_of :email
    validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  end
end