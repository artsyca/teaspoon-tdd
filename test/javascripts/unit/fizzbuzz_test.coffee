###*
 * Testing the FizzBuzz function.
 * @see http://codereview.stackexchange.com/questions/9749/ways-to-improve-my-coding-test-fizzbuzz-solution-for-a-tdd-role
###
module "FizzBuzz Unit Test",

  ###*
   * Setup is run before every test.
  ###
  setup: ->
    @f = new FizzBuzz() 

  ###*
   * Teardown is run after every test.
  ###
  teardown: ->
    delete @f

test "This test should always pass", (assert) ->
  assert.ok true, "This should be true"
  assert.ok !false, "This should also pass"

test "FizzBuzz should exist and be instantiatable", (assert) ->
  assert.ok FizzBuzz? and new FizzBuzz(), "FizzBuzz should exist"

test "FizzBuzz returns an array 100 elements", (assert) ->
  assert.equal @f.getResults().length , 100, "Array length should be 100, not #{@f.getResults().length}"

test "Multiples of 3 start with Fizz", (assert) ->
  results = @f.getResults()
  for i in [3..100] by 3
    assert.ok results[i - 1].match(/^Fizz/)?, "All multiples of 3 should start with \"Fizz\""

test "Multiples of 5 end with Buzz", (assert) ->
  results = @f.getResults()
  for i in [5..100] by 5
    assert.ok results[i - 1].match(/Buzz$/)?, "All multiples of 5 should end with \"Buzz\""

test "Multiples of 3 and 5 are 'FizzBuzz'", (assert) ->
  results = @f.getResults()
  for i in [15..100] by 15
    assert.ok results[i - 1].match(/^FizzBuzz$/)?, "All multiples of 15 should be with \"FizzBuzz\""

test "Other numbers return their own value", (assert) ->
  results = @f.getResults()
  for i in [0...100] by 1
    val = i + 1
    unless val%3 == 0 or val%5 == 0
      assert.ok results[i] == "#{val}", "results[#{i}] should be #{val}"


test "1000 Fizz and Buzz and FizzBuzz numbers are returned correctly", (assert) ->

  for i in [0..1000]
    randomnumber= 3 * Math.floor(Math.random()*1000)
    assert.ok @f.getResult(randomnumber).match(/^Fizz/)?, "Multiples of 3 have Fizz"
    randomnumber= 5 * Math.floor(Math.random()*1000)
    assert.ok @f.getResult(randomnumber).match(/Buzz$/)?,  "Multiples of 5 have Fizz"
    randomnumber= 15 * Math.floor(Math.random()*1000)
    assert.ok @f.getResult(randomnumber).match(/^FizzBuzz$/)?,  "Multiples of 15 have FizzBuzz"



asyncTest "asynchronous test: 2 seconds later!", (assert) ->
  expect 1
  setTimeout (->
    assert.ok true, "Passed and ready to resume!"
    start()
  ), 2000


asyncTest "asynchronous test: 1 second later!", (assert) ->
  expect 1
  setTimeout (->
    assert.ok true, "Passed and ready to resume!"
    start()
  ), 1000



