# typed: false
require 'rails_helper'

RSpec.describe BucksController, type: :controller do
  describe '#new' do
    it 'loads successfully' do
      get :new

      expect(response.status).to eq 200
    end
  end
end
