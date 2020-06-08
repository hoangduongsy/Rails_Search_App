class Developer < ApplicationRecord
    has_many :developer_programming_languages
    has_many :developer_languages
    has_many :programming_languages, through: :developer_programming_languages
    has_many :languages, through: :developer_languages
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    STR_REGEX = /\s/

    validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 100 },
                      format: { with: VALID_EMAIL_REGEX }

    def self.search_programming_language(search_pl)
      mul_search_pl = search_pl.downcase.gsub(/,/, " ").split(STR_REGEX)
      joins(:programming_languages).where("LOWER(programming_languages.name) IN (?)", mul_search_pl)
    end
  
    def self.search_developer_language(search_dl)
      mul_search_dl = search_dl.downcase.gsub(/,/, " ").split(STR_REGEX)
      Developer.joins(:languages).where(" LOWER(languages.code) IN (?)", mul_search_dl)
    end
  end