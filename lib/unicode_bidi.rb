# frozen_string_literal: true

require_relative "unicode_bidi/version"
require_relative "unicode_bidi/unicode_bidi"

module UnicodeBidi
  class Error < StandardError; end

  def self.bidi(text)
    text.split("\n").map { |line| UnicodeBidi.bidi_inner(line) }.join("\n")
  end
end
