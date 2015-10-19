require 'xliffle/creator'
require 'xliffle/file'
require 'xliffle/string'
require 'xliffle/note'
require 'xliffle/header'
require 'xliffle/headers/count_group'

module Xliffle
  def self.new
    Xliffle::Creator.new
  end
end
