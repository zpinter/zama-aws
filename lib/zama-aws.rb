require 'rubygems'

gem 'why-hpricot'
gem 'rest-client'

require 'hpricot'
require 'rest_client'

require 'zama-aws/results'
require 'zama-aws/item_lookup'
require 'zama-aws/item_search'

module Zama

  module AWS
    SERVICE_URLS = {:us => "http://webservices.amazon.com/onca/xml?Service=AWSECommerceService",
      :uk => "http://webservices.amazon.co.uk/onca/xml?Service=AWSECommerceService",
      :ca => "http://webservices.amazon.ca/onca/xml?Service=AWSECommerceService",
      :de => "http://webservices.amazon.de/onca/xml?Service=AWSECommerceService",
      :jp => "http://webservices.amazon.co.jp/onca/xml?Service=AWSECommerceService",
      :fr => "http://webservices.amazon.fr/onca/xml?Service=AWSECommerceService"
    }

    def self.setup(opts)
      @@opts = {
        :Version => "2009-01-06"
      }.merge(opts)
    end
    
    def self.opts; @@opts; end;
    
  end

end
