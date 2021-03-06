describe Solargraph::Pin::Attribute do
  it "is a kind of attribute/property" do
    source = Solargraph::Source.load_string(%(
      class Foo
        attr_reader :bar
      end
    ))
    pin = source.attribute_pins.first
    expect(pin).not_to be_nil
    expect(pin.kind).to eq(Solargraph::Pin::ATTRIBUTE)
    expect(pin.completion_item_kind).to eq(Solargraph::LanguageServer::CompletionItemKinds::PROPERTY)
    expect(pin.symbol_kind).to eq(Solargraph::LanguageServer::SymbolKinds::PROPERTY)
  end
end
