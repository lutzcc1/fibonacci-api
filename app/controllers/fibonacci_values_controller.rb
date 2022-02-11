class FibonacciValuesController < ApplicationController
  def show
    value = FibonacciIndexCalculator.new(params[:index]).call
    render json: value.to_json
  end
end
