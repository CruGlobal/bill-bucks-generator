require 'rails_helper'

RSpec.describe BuckWad, type: :model do
  describe '#bucks' do
    subject { wad.bucks }
    let(:for_message) { 'test message' }
    context 'with multiple bucks' do
      let(:wad) { BuckWad.new(for_message: for_message, count: 7) }
      it 'returns multiple bucks with count indicator' do
        expect(subject.count).to be 3
        expect(subject.map(&:for_message).uniq.count).to be 3
      end
    end

    context 'with one buck' do
      let(:wad) { BuckWad.new(for_message: for_message, count: 5) }
      it 'returns one bucks without count indicator' do
        expect(subject.count).to be 1
        expect(subject.first.for_message).to eq for_message
      end
    end
  end
end
