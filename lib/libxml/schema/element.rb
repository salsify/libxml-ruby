# encoding: UTF-8

module LibXML
  module XML
    class Schema::Element
      def required?
        !@min || !@min.zero?
      end

      def array?
        @max && @max > 1
      end

      def elements
        type.elements
      end

      def min_occurs
        @min
      end

      def max_occurs
        @max
      end
    end
  end
end
