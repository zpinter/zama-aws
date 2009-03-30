module Zama
  
  module AWS
  
    class Results

      def initialize(xml)
        @raw = Hpricot.XML(xml)
      end

      def self.prepare_url(params)
        params = Zama::AWS.opts.merge({
                         :country => :us
                       }).merge(params)

        country = params.delete(:country) || :us
        main_url = SERVICE_URLS[country]

        qs = ""
        params.each do |k,v|
          next unless v
          v = v.join(",") if v.is_a?(Array)
          qs << "&#{k}=#{URI.encode(v.to_s)}"
        end
        url = "#{main_url}#{qs}"
        puts "Zama::AWS querying: #{url}"
        url
      end

      def self.get(params,headers={})
        self.new(RestClient.get(prepare_url(params),headers))
      end

      def self.post(params,payload,headers={})
        self.new(RestClient.post(prepare_url(params),payload,headers))        
      end

    end    
    
  end

end
