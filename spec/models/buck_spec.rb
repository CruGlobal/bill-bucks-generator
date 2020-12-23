require 'rails_helper'

RSpec.describe Buck, type: :model do
  describe '#fit_text' do
    context 'with non-wrapping text' do
      let(:text) { "hello\r\nmy\r\nname \r\nis\r\n\r\nshelby" }
      it 'returns original text' do
        expect(Buck.new.fit_text(text, 510)).to eq text
      end
    end

    context 'with wrapping text' do
      let(:text) { 'this is a really long line of text that should wrap.' }
      let(:wrapped_text) do
        "this is a really long line of text that should\nwrap."
      end
      it 'returns wrapped text' do
        expect(Buck.new.fit_text(text, 510)).to eq wrapped_text
      end
    end

    context 'with wrapping and new lines' do
      let(:text) do
        "this is a really long line of text that should wrap.\r\n\r\n- Bill"
      end
      let(:wrapped_text) do
        "this is a really long line of text that should\nwrap.\r\n\r\n- Bill"
      end
      it 'returns wrapped text' do
        expect(Buck.new.fit_text(text, 510)).to eq wrapped_text
      end
    end
  end
end
