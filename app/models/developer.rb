class Developer < ApplicationRecord
    has_many :developer_programming_languages
    has_many :developer_languages
    has_many :programming_languages, through: :developer_programming_languages
    has_many :languages, through: :developer_languages
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 100 },
                      format: { with: VALID_EMAIL_REGEX }
    
    def language
      self.languages.pluck(:code).join(",")
    end

    def programming_language
      self.programming_languages.pluck(:name).join(",")
    end
  end