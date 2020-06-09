class DeveloperSerializer < ActiveModel::Serializer
  attributes :id, :email, :languages, :programming_languages
  has_many :languages
  has_many :programming_languages
  def languages
    languages = object.languages.pluck(:code).join(", ")
  end
  def programming_languages
    programming_languages = object.programming_languages.pluck(:name).join(", ")
  end
  
end
