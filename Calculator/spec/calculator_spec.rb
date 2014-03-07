require('rspec')
require('calculator')

describe ('calculator') do
  it("adds two numbers from a sentance") do
    calculator('What is 5 plus 3?').should(eql(8))
  end
  it("subtracts two numbers in a sentence") do
    calculator('what is 6 minus 1?').should(eql(5))
  end
  it("multiplies two numbers in a sentence") do
    calculator('what is 5 multiplied by 3?').should(eql(15))
  end
  it("divides two numbers in a sentence") do
    calculator('what is 6 divided by 2?').should(eql(3))
  end
  it("divides two numbers in a sentence") do
    calculator('what is 5 divided by 2?').should(eql(2.5))
  end
  it("calculates the power of one number to another") do
    calculator('what is 4 to power 3?').should(eql(64))
  end
  it("calculates multiple equations in sentence") do
    calculator('What is 4 plus 6 divided by 2?').should(eql(7))
  end
  it("should calculate multiple sentences") do
    calculator("What is 2 plus 3? What is 7 divided by 4?").should(eql([5, 1.75]))
  end
end

# describe('sentences_calc') do
#   it("should calculate multiple sentences") do
#     sentences_calc("What is 2 plus 3? What is 7 divided by 4?").should(eql([5, 1.75]))
#   end
# end
