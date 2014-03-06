def calculator(sentence)
  numbers = sentence.scan(/\d/).to_a
  num1 = numbers[0].to_i
  num2 = numbers[1].to_i
  result = 0

  if sentence.include? "minus"
      result += num1 - num2
  elsif sentence.include? "plus"
    result += num1 + num2
  elsif sentence.include? "multiplied"
    result += num1 * num2
  elsif sentence.include? "divided"
    if num1 % num2 == 0
      result += num1 / num2
    else
      result += num1.to_f / num2
    end
    result
  elsif sentence.include? "power"
    result += num1 ** num2
  end  
  result
end

