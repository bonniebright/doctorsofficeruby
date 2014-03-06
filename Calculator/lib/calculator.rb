def calculator(sentence)
  math = {"plus" => :+, "minus" => :-, "multiplied" => :*, "divided" => :/, "power" => :**}
  sentence_string = sentence.sub!(/[^a-zA-Z0-9_\s]/, "")
  words = sentence_string.split
  equations = []



  words.each do |word|
    if math.include? word
      equations << math[word]
    elsif /[0-9]/.match word 
      equations << word.to_f 
    end
  end

  answer = eval equations.join
  result = ""

  if answer == answer.to_i
    result = answer.to_i
  else
    result = answer
  end
  result     
end

