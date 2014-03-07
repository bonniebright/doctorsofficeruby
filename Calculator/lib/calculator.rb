def calculator(sentence)
  math = {"plus" => :+, "minus" => :-, "multiplied" => :*, "divided" => :/, "power" => :**}
  sentences = sentence.split("?")
  answer = []
  sentences.each do |sentence|
    words = sentence.split
    equations = []
    words.each do |word|
      if math.include? word
        equations << math[word]
      elsif /[0-9]/.match word 
        equations << word.to_f 
      end
    end
    answer.push(eval equations.join)  
  end
  answer.join(", ")     
end
