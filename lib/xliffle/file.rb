module Xliffle
  class File
    attr_reader :original, :strings, :source_locale, :target_locale, :headers, :datatype

    def initialize(original, source_locale, target_locale, options = {})
      @strings = []
      @headers = []
      @original = original
      @source_locale = source_locale
      @target_locale = target_locale
      @datatype = options[:datatype] || 'plaintext'
    end

    def string(id, source, target, options={})
      string = Xliffle::String.new(id, source, target, options)
      @strings << string
      string
    end

    def header(type, options = {})
      element = Xliffle::Header.create(type, options)
      @headers << element
      element
    end

    def to_xliff(xliff)
      xliff.file(original: @original, datatype: @datatype, 'source-language' => @source_locale, 'target-language' => @target_locale) do |file|
        if headers.any?
          file.header do |header|
            self.headers.each do |element|
              element.to_xliff(header)
            end
          end
        end

        file.body do |body|
          self.strings.each do |string|
            string.to_xliff(body)
          end
        end
      end
    end
  end
end
