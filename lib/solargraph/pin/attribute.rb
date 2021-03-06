module Solargraph
  module Pin
    class Attribute < Base
      # @return [Symbol] :reader or :writer
      attr_reader :access

      # @return [Symbol] :class or :instance
      attr_reader :scope

      def initialize location, namespace, name, comments, access, scope
        super(location, namespace, name, comments)
        @access = access
        @scope = scope
      end

      def kind
        Solargraph::Pin::ATTRIBUTE
      end

      def completion_item_kind
        Solargraph::LanguageServer::CompletionItemKinds::PROPERTY
      end

      def symbol_kind
        Solargraph::LanguageServer::SymbolKinds::PROPERTY
      end

      def path
        @path ||= namespace + (scope == :instance ? '#' : '.') + name
      end

      def return_complex_types
        if @return_complex_types.nil?
          @return_complex_types = []
          tag = docstring.tag(:return)
          @return_complex_types.concat ComplexType.parse(*tag.types) unless tag.nil?
        end
        @return_complex_types
      end

      def visibility
        # @todo Check attribute visibility
        :public
      end

      def parameters
        # Since attributes are generally equivalent to methods, treat
        # them as methods without parameters
        []
      end

      def parameter_names
        []
      end
    end
  end
end
