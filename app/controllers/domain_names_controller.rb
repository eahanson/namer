class DomainNamesController < ApplicationController
  before_filter :load_list_and_suggestion

  def index
    @domain_names = DomainName.search(@suggestion.contents)
  end
end
