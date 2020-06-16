class SearchDeveloper
  attr_accessor :developers

  def initialize( params = {})
    @params = params
    self.developers = Developer.all.joins(:languages, :programming_languages)
  end

  def call
    @developers = Developer.all
    @params.slice(:search_dl, :search_pl).each do |key, value|
      next unless value.present?
      case  key.to_s
      when  'search_dl'
        @developers = search_developer_language(value)
      when 'search_pl'
        @developers = search_programming_language(value)
      end
    end
    @developers.distinct
  end
private

  # def search_programming_language(search_pl)
  #   mul_search_pl = search_pl.downcase.gsub(/,/, '').split(/\s/)
  #   @developers.joins(:programming_languages).where('LOWER(programming_languages.name) IN (?)', mul_search_pl)
  # end

  def search_programming_language(search_pl)
    mul_search_dl = search_dl.downcase.gsub(/,/, '').split(/\s/)
    plang_id = ProgrammingLanguage.joins(:developer_programming_languages)
                                  .where('LOWER(programming_languages.name) IN (?)', mul_search_pl)
                                  .pluck(:developer_id)
    @developers.where(id: plang_id)
  end
  # def search_developer_language(search_dl)
  #   mul_search_dl = search_dl.downcase.gsub(/,/, '').split(/\s/)
  #   @developers.joins(:languages).where('LOWER(languages.code) IN (?)', mul_search_dl)
  # end

  def search_developer_language(search_dl)
    mul_search_dl = search_dl.downcase.gsub(/,/, '').split(/\s/)
    lang_id = Language.joins(:developer_languages)
                      .where('LOWER(languages.code) IN (?)', mul_search_dl)
                      .pluck(:developer_id)
    @developers.where(id: [lang_id])
  end
end