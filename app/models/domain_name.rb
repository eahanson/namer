class DomainName
  include ActiveModel::Model

  attr_accessor :name, :availability

  def self.search(term)
    Domainr.search(term).results.map do |result|
      new(name: result.subdomain + result.path, availability: result.availability.to_sym)
    end
  end

  def available?
    availability == :available
  end
end
