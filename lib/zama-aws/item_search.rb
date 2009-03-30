module Zama

  module AWS
    
    class ItemSearch < Results
      include Enumerable

      def each
        @raw.search("//item").each do |item_raw|
          yield find_hook_by_key(:item).new(item_raw)
        end
      end
      
      def self.get(params,headers={})
        params["Operation"] = "ItemSearch"
        super(params,headers)
      end
    end

  end

end
