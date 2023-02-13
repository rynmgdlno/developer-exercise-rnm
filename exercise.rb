class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    punctuation = ["!", ".", ",", "?", ":", ";", "-"]
    marklared = str.split(" ").map do |word|
      if word.length > 4
        # if word ends with a punctuation mark, store it in punc:
        punc = punctuation.include?(word[-1]) ? word[-1] : ""
        if !!word[0].match(/\p{Upper}/)
          "Marklar#{punc}"
        else
          "marklar#{punc}"
        end
      else
        word
      end
    end
    result = marklared.join(" ")
    return result
  end

  # Fibonacci helper. Generates complete fib sequence to n values
  private_class_method def self.get_fibonacci(nth)
      a, b, sum = 0, 1, 0
      result = Array.new(1, 1)
      for x in 1...nth
        sum = a + b
        a = b
        b = sum
        result.push(sum)
      end
      return result
    end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    # generate complete fib sequence for n values
    fib = get_fibonacci(nth)

    # filtering out odd values
    fibEvenOnly = fib.filter { |val| val % 2 == 0 }

    # find and return sum of remaining (even) values
    result = fibEvenOnly.reduce(0) { |sum, val| sum + val }
    return result
  end
end
