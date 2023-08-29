class Genre < ApplicationRecord
  has_many :impressions
  
  validates :name, presence: true
  
  def self.search_for(content, method)
    if method == "perfect"
      Genre.where(name: content)
    elsif method == "forward"
      Genre.where("name LIKE?",content+'%')
    elsif method == "backward"
      Genre.where("name LIKE?",'%'+content)
    elsif method == "partial"
      Genre.where("name LIKE?",'%'+content+'%')
    end
  end

end
