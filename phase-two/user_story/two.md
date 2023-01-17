# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

```ruby
is_correct_grammar = grammar_check(sentence)

sentence is combined with multiple words and maybe punctuations.
is_correct_grammar is a boolean showing if the sentence is correct in grammar.
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

grammar_check('I am a boy.') => true
grammar_check('i am a boy') => false
grammar_check('I am a boy') => false
grammar_check('I am a boy?') => true

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
