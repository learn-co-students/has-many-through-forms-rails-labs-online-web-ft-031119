class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, reject_if: proc{|attributes|
    attributes.all? do |key,value|
      if value.is_a? ActionController::Parameters
        value.all? {|nested_key, nested_value| nested_key == '_destroy' || nested_value.blank?}
      else
        key == '_destory' || value.blank?
      end
    end
  }

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end


end
