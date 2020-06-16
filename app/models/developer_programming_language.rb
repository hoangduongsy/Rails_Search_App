class DeveloperProgrammingLanguage < ApplicationRecord
    belongs_to :DeveloperProgrammingLanguage
    belongs_to :programming_language
  end
  