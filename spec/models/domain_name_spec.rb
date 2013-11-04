require 'spec_helper'

describe DomainName do
  describe '#search' do
    it 'searches domainr' do
      results = {
        'query' => 'elephant',
        'results' => [
          {
            'domain' => 'elephant.com',
            'host' => '',
            'subdomain' => 'elephant.com',
            'path' => '',
            'availability' => 'taken',
            'register_url' => 'https://domai.nr/elephant.com/register'
          },
          {
            'domain' => 'elephant.net',
            'host' => '',
            'subdomain' => 'elephant.net',
            'path' => '',
            'availability' => 'taken',
            'register_url' => 'https://domai.nr/elephant.net/register'
          },
          {
            'domain' => 'elephant.org',
            'host' => '',
            'subdomain' => 'elephant.org',
            'path' => '',
            'availability' => 'taken',
            'register_url' => 'https://domai.nr/elephant.org/register'
          },
          {
            'domain' => 'elephant.co',
            'host' => '',
            'subdomain' => 'elephant.co',
            'path' => '',
            'availability' => 'taken',
            'register_url' => 'https://domai.nr/elephant.co/register'
          },
          {
            'domain' => 'elephant.io',
            'host' => '',
            'subdomain' => 'elephant.io',
            'path' => '',
            'availability' => 'taken',
            'register_url' => 'https://domai.nr/elephant.io/register'
          },
          {
            'domain' => 'elephant.me',
            'host' => '',
            'subdomain' => 'elephant.me',
            'path' => '',
            'availability' => 'taken',
            'register_url' => 'https://domai.nr/elephant.me/register'
          },
          {
            'domain' => 'elephant.info',
            'host' => '',
            'subdomain' => 'elephant.info',
            'path' => '',
            'availability' => 'maybe',
            'register_url' => 'https://domai.nr/elephant.info/register'
          },
          {
            'domain' => 'ele.ph',
            'host' => '',
            'subdomain' => 'ele.ph',
            'path' => '/ant',
            'availability' => 'maybe',
            'register_url' => 'https://domai.nr/ele.ph/register'
          },
          {
            'domain' => 'eleph.an',
            'host' => '',
            'subdomain' => 'eleph.an',
            'path' => '/t',
            'availability' => 'unavailable',
            'register_url' => 'https://domai.nr/eleph.an/register'
          }
        ]
      }

      Domainr.should_receive(:search).with('elephant').and_return(Hashie::Mash.new(results))

      domain_names = DomainName.search('elephant')
      expect(domain_names.size).to eq 9
    end
  end

  describe '#available?' do
    it { DomainName.new(availability: :available).should be_available }
    it { DomainName.new(availability: :taken).should_not be_available }
    it { DomainName.new(availability: :tld).should_not be_available }
    it { DomainName.new(availability: :unknown).should_not be_available }
  end
end
