class DevelopersController < ApplicationController
  
  def index
    # byebug
    @developers = SearchDeveloper.new(params).call.preload(:languages, :programming_languages)
    render json: @developers
    # if params[:search_dl].present? && pagrams[:search_pl].present?
    #   l1 = Developer.search_programming_language(params[:search_pl])
    #   l2 = Developer.search_developer_language(params[:search_dl])
    #   @developers = l1.merge(l2)
    # elsif params[:search_pl].present?
    #   @developers = Developer.search_programming_language(params[:search_pl])
    # elsif params[:search_dl].present?
    #   @developers = Developer.search_developer_language(params[:search_dl])
    # else
    #   @developers = Developer.all
    # end
  end
  
  def show
    @developer = Developer.find(params[:id])
  end
end