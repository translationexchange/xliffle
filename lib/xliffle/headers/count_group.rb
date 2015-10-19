module Xliffle
  module Headers
    class CountGroup

      attr_reader :name, :counts

      def initialize(options={})
        @name = options[:name] || 'count'
        @counts = []
      end

      def add_count(type, value)
        @counts << {
          type: type,
          value: value
        }
      end

      def to_xliff(xliff)
        xliff.tag!('count-group', {name: @name}) do |header|
          self.counts.each do |element|
            header.tag!('count', {'count-type': element[:type]}, element[:value])
          end
        end
      end

    end
  end
end
