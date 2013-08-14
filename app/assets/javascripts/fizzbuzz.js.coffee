class window.FizzBuzz

  getResult: (x) ->

    if (x%3 == 0)
      result = "Fizz"
    if (x%5 == 0)
      result += "Buzz"

    result || "#{x}"

  getResults: (n = 100)->
    results = [] 
    for i in [1..n] by 1
      results.push @getResult(i)
    results