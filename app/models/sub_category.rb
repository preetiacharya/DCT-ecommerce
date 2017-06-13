class SubCategory < ActiveRecord::Base
  belongs_to :category

  has_many :products

  validates_presence_of :name, :category_id
  validates_uniqueness_of :name
  validates_numericality_of :category_id, minimum: 1

  def formatted_name
    "#{self.id} - #{self.name}"
    #This is used to bring value on each page.
  end
end
