# frozen_string_literal: true

RSpec.describe ValidateMod97 do
  def app
    ValidateMod97
  end

  describe 'index page' do
    before :each do
      get '/'
    end

    it 'contains welcome message' do
      expect(last_response.body).to include('Welcome to mod 97 calculator/validator')
    end

    it 'contains link to validate' do
      expect(last_response.body).to include('/validate')
    end

    it 'contains link to calculate' do
      expect(last_response.body).to include('/calculate')
    end
  end
end
