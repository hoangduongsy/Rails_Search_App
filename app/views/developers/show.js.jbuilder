json.(@developer, :id, :email)
json.programming_languages @developer.programming_languages, :id, :name
json.languages @developer.languages, :id, :code
