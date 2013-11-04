require 'spec_helper'

describe DomainNamesController do
  describe '#index' do
    it 'lists domain names that match the suggestion' do
      DomainName.
        should_receive(:search).
        with('elephant').
        and_return([DomainName.new(name: 'ele.ph/ant', availability: :maybe), DomainName.new(name: 'elephant.me', availability:  :taken)])

      suggestion = mom.suggestion contents: 'elephant'

      get :index, list_id: suggestion.list.to_param, suggestion_id: suggestion.to_param

      found = assigns(:domain_names)
      expect(found.size).to eq 2

      expect(found.first.name).to eq 'ele.ph/ant'
      expect(found.first.availability).to eq :maybe

      expect(found.last.name).to eq 'elephant.me'
      expect(found.last.availability).to eq :taken
    end
  end
end
