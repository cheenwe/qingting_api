module QingtingApi
  # Message service: methods that are used to manage messages
  module Base::Info

    def self.included(base)
      base.send :extend, ClassMethods
    end

    # Class methods
    module ClassMethods

      def find_by_cid(cmode, cid)
        Request.get "#{cmode}", cid: cid
      end



    end
  end
end
