def fizzbuzz(size)
  (1..size).each do |num|
    result = ''
    result << 'Fizz' if num % 3 == 0
    result << 'Buzz' if num % 5 == 0
    result = num.to_s if result == ''
    yield result
  end
end
