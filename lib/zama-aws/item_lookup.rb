module Zama
  
  module AWS
  
    class ItemLookup < Results

      def self.get(params,headers={})
        params["Operation"] = "ItemSearch"
        super(params,headers)
      end      
      
    end

  end

end
