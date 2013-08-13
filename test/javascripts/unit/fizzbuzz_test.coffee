###*
 * Testing the FizzBuzz function.
 * @see http://codereview.stackexchange.com/questions/9749/ways-to-improve-my-coding-test-fizzbuzz-solution-for-a-tdd-role
###
module "FizzBuzz Unit Test",

  ###*
   * Setup is run before every test.
  ###
  setup: ->

  ###*
   * Teardown is run after every test.
  ###
  teardown: ->

test "FizzBuzz should exist and be instantiatable", ->
  ok FizzBuzz? and new FizzBuzz(), "FizzBuzz should exist"

test "FizzBuzz returns an array 100 elements", ->
  f = new FizzBuzz();
  ok f.getResults().length == 100, "Array length should be 100"

test "Multiples of 3 start with Fizz", ->
  f = new FizzBuzz()
  results = f.getResults()
  for i in [3...100] by 3
    ok results[i - 1].match(/^Fizz/)?, "All multiples of 3 should start with \"Fizz\""

test "Multiples of 5 end with Buzz", ->
  f = new FizzBuzz()
  results = f.getResults()
  for i in [5...100] by 5
    ok results[i - 1].match(/Buzz$/)?, "All multiples of 5 should end with \"Buzz\""

test "Multiples of 3 and 5 are 'FizzBuzz'", ->
  f = new FizzBuzz()
  results = f.getResults()
  for i in [15...100] by 15
    ok results[i - 1].match(/^FizzBuzz$/)?, "All multiples of 15 should be with \"FizzBuzz\""



  