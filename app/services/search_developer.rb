class SearchDeveloper
  ATTRIBUTES = {
    search_dl: :search_developer_language,
    search_pl: :search_programming_language
  }
  # byebug
  def initialize( params = {})
    @params = params
  end

  def call
    @developers = Developer.all.joins(:languages, :programming_languages)
    @params.except(:controller, :action).keys.each do |key|
      next unless @params[key].present?
      @developers = @developers.send(ATTRIBUTES[key.to_sym], @params[key])
    end
    @developers.distinct
  end
    
end