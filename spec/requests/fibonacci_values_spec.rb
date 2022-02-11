require 'rails_helper'

RSpec.describe "FibonacciValues", type: :request do
  describe "GET /fibonacci_values" do
    it "returns 'ok' status" do
      get fibonacci_values_path('0')
      expect(response).to have_http_status(200)
    end

    it "returns the appropiate value" do
      get fibonacci_values_path('8')
      expect(JSON.parse(response.body)).to eq({ 'value' => 21 })
    end

    it "returns an error JSON when request is a negative number" do
      get fibonacci_values_path('-1')
      expect(JSON.parse(response.body)).to eq({ 'error' => 'invalid input' })
    end

    it "returns an error JSON when request is not a number" do
      get fibonacci_values_path('one')
      expect(JSON.parse(response.body)).to eq({ 'error' => 'invalid input' })
    end

    it "returns an error JSON when request includes a big index" do
      get fibonacci_values_path('1001')
      expect(JSON.parse(response.body)).to eq({ 'error' => 'invalid input' })
    end
  end
end
