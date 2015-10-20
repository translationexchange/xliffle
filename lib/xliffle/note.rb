module Xliffle
  class Note
    attr_reader :note, :priority, :lang, :from

    def initialize(note, options={})
      @note = note
      @priority = options[:priority] || 2
      @lang = options[:lang]
      @from = options[:from]
    end

    def to_xliff(xliff)
      xliff.tag!('note', { priority: @priority }, @note)
    end
  end
end
