require_relative 'spec_helper'

describe CR::Day do
  describe '#==' do
    let(:d) do
      described_class.new(
        date: Date.today,
        season: CR::Seasons::ORDINARY,
        season_week: 1,
        celebrations: [CR::Celebration.new]
      )
    end

    describe 'same content' do
      let(:d2) do
        described_class.new(
          date: Date.today,
          season: CR::Seasons::ORDINARY,
          season_week: 1,
          celebrations: [CR::Celebration.new]
        )
      end

      it 'is equal' do
        expect(d).to eq d2
      end
    end

    describe 'different content' do
      let(:d2) do
        described_class.new(
          date: Date.today,
          season: CR::Seasons::LENT,
          season_week: 1,
          celebrations: [CR::Celebration.new]
        )
      end

      it 'is different' do
        expect(d).not_to eq d2
      end
    end

    describe 'different celebrations' do
      let(:d2) do
        described_class.new(
          date: Date.today,
          season: CR::Seasons::ORDINARY,
          season_week: 1,
          celebrations: [CR::Celebration.new('another celebration')]
        )
      end

      it 'is different' do
        expect(d).not_to eq d2
      end
    end
  end
end