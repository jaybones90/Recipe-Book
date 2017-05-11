class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:tags)
  validates(:name, :presence => true)
  before_create(:capitalize)


  private
  def capitalize
    self.name = name.upcase
  end



end
