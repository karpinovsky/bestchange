# frozen_string_literal: true

module Bestchange
  class Configuration
    def dir
      @dir || Bestchange::DIRECTORY
    end

    def timeout
      @timeout || Bestchange::TIMEOUT
    end

    attr_writer :dir, :timeout
  end
end
