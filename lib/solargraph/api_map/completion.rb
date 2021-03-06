module Solargraph
  class ApiMap
    # The result of a completion request containing the pins that describe
    # completion options and the range to be replaced.
    #
    class Completion
      # @return [Array<Solargraph::Pin::Base>]
      attr_reader :pins

      # @return [Solargraph::Source::Range]
      attr_reader :range

      def initialize pins, range
        @pins = pins
        @range = range
      end
    end
  end
end
