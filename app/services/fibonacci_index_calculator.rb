class FibonacciIndexCalculator
  def initialize(index)
    @index = index
  end

  def call
    @index = Integer(@index)

    raise ArgumentError if @index < 0

    return { value: 0 } if @index == 0
    return { value: 1 } if @index == 1

    sequence = [0, 1]
    position = 2

    while sequence[@index].nil?

      sequence << sequence[position - 1] + sequence[position - 2]
      position += 1
    end

    { value: sequence[@index] }

  rescue ArgumentError
    { error: 'invalid input' }
  end
end