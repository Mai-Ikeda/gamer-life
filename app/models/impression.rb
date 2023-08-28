class Impression < ApplicationRecord
  belongs_to :customer
  belongs_to :genre,optional: true
  has_many :comments, dependent: :destroy
  
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true


  def self.search_for(content, method)
    if method == "perfect"
      Impression.where(title: content)
    elsif method == "forward"
      Impression.where("title LIKE?",content+'%')
    elsif method == "backward"
      Impression.where("title LIKE?",'%'+content)
    elsif method == "partial"
      Impression.where("title LIKE?",'%'+content+'%')
    end
  end
  
  enum status: { published: 0, draft: 1 }
  
end
