def calculator(sentence)
  math = {"plus" => :+, "minus" => :-, "multiplied" => :*, "divided" => :/, "power" => :**}
  words = sentence.split
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


def sentences_calc(sentences)
  sentence_array = sentences.split("?")
  calcs = []
  if sentence_array.length == 1
    calculator(sentence[0])
  else
    sentence_array.each do |sent|
      calcs << calculator(sent)
    end
    calcs
  end
end
