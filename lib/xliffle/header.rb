module Xliffle
  class Header

    def self.create(type, options = {})
      # TODO: make this work outside of Rails
      "Xliffle::Headers::#{type.to_s.camelcase}".constantize.new(options)
    end

    def initialize(options={})
    end

    def type
      self.class.name.split('::').last.underscore.gsub('_', '-')
    end

    def to_xliff(xliff)
      xliff.tag!(type, { priority: @priority }, @note)
    end

  end
end
