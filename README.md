# Title

## Learning Goals

* Wrap uses of `[]` from Step 2 into new method
* Create a "First-Order" method
* Ensure "First-Order Methods" use arguments to create flexibility

## Introduction

In the previous lab we used our knowledge of REPETITION and `Array` syntax to
answer the question: "***How many pieces of snacks are in this vending
machine?***"

But our code didn't take advantage of our ability to create _methods_ to help
our human brains understand what the code was doing. While the previous
implementation _worked_, it's not fun or easy to reason about. In this method
we'll follow step 3 of our process:

> 3. Wrap uses of `[]` from Step 2 into new methods
>   * Create simple methods with meaningful names ("First-Order Methods")
>   * Ensure "First-Order Methods" use arguments to create flexibility

## Wrap Uses of `[]` from Step 2 into new method

At the end of the previous lesson, our solution to calculate the number of
pieces of snacks in the vending machine looked like this:

```ruby
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US Mints", :pieces=>99}]]]


grand_piece_total = 0
row_index = 0
while row_index < vm.length do
  column_index = 0
  while column_index < vm[row_index].length do
    inner_len = vm[row_index][column_index].length
    inner_index = 0
    while inner_index < inner_len do
      # vm[row][column][spinner]
      # spinner is full of Hashes with keys :pieces and :name
      grand_piece_total += vm[row_index][column_index][inner_index][:pieces]
      inner_index += 1
    end
    column_index += 1
  end
  row_index += 1
end

p grand_piece_total #=> 1192
```

The question we should ask centers around the area where we introduced our
comments. A comment that documents our code is a "smell." If our code were
simple and understandable, would we need that comment?

One of the best ways to "document" some thinking is to put that thinking inside
of a method. Let's analyze this code and decide if we can create a name for
what this "thinking" is doing.

```ruby
# Invalid code, can't be pasted.
    inner_index = 0
    while inner_index < inner_len do
    # vm[row][column][spinner]
    # spinner is full of Hashes with keys :pieces and :name
    grand_piece_total += vm[row_index][column_index][inner_index][:pieces]
    inner_index += 1
    end
    column_index += 1
```

Our comment and code both agree, we're totalling up the pieces on a vending
machine "spinner." Well, why not invent a method called "calculate pieces on
spinner?"

Beginners are often staggered by this idea, that we can just add code that
makes our lives better. But ... Yes! We can!

We'll call this method `pieces_total_for_coordinate`. It will take as arguments
the NDS, the row coordinate, and the column coordinate and return the total
pieces on that spinner.

```ruby
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US Mints", :pieces=>99}]]]

def pieces_total_for_coordinate(nds, row_index, column_index)
  coordinate_total = 0
  inner_len = nds[row_index][column_index].length
  inner_index = 0
  while inner_index < inner_len do
    coordinate_total += nds[row_index][column_index][inner_index][:pieces]
    inner_index += 1
  end
  coordinate_total
end

grand_piece_total = 0
row_index = 0
while row_index < vm.length do
  column_index = 0
  while column_index < vm[row_index].length do
    grand_piece_total += pieces_total_for_coordinate(vm, row_index, column_index)
    column_index += 1
  end
  row_index += 1
end

p grand_piece_total #=> 1192
```

Take a look at that code. See how it's easier to read? We're iterating through
grid coordinates and, for each coordinate pair, we're asking some other bit of
thinking, we don't care what, to tell us how many pieces of snack are present
in the spinner.

This is the heart of programming: building small little methods that make it
easy for humans to reason about how we asked a computer to help us figure
something out. Programmers call this "managing complexity." To quote guru Brian
Kernighan:

> Controlling complexity is the essence of computer programming.

## Create a "First-Order" Method

We call `pieces_total_for_coordinate` a "First-Order Method." It wraps the
basic Ruby `Array` and REPETITION code in a meaningful name. It's much easier
for our human brains to say "iterate through the coordinates and, for each one,
sum up the pieces" than to think about all the `while` and `do` and `end`
....noise.

## Ensure "First-Order Methods" Use Arguments to Create Flexibility

It's worth taking a moment to consider the arguments to
`pieces_total_for_coordinate`. We didn't write `total_pieces_on_first_spinner`,
and `total_pieces_on_first_spinner`, and `total_pieces_on_first_spinner`, ...
and so on. We saw that the dimensions of our vending machine NDS might change
(more rows, `1,000`, `1,000,000`, `1,000,000,000` even!). As long as we can
simply increment integers (`row_index` and `column_index`, this method
***works***).

You might recall that the process of making methods that are flexible based on
arguments is called _abstraction_. We should endeavor to make our methods
appropriately _abstract_. We can make them too abstract and not abstract
enough. How to decide if you're in the sweet spot? Sadly, that takes experience
and flexibility.

Your guiding rule of thumb should be "can I understand this at 3 am on 3 hours
of sleep 3 weeks from now?" If you can honestly say, "Yes. This is the most
understanable I can do right now," then you're probably in a good. Asking a
peer, teacher, colleague, etc. for help, might be appropriate here.
More-experienced advisors love to help you go from working code that's muddled
to working code that's cleaner.

## Create (Another) First-Order Method

While we're at it, let's create another "First-Order Method" for what the main
_algorithm_ does. It returns "total pieces of snack in the vending machine.
Let's wrap that "thinking" in a human-friendly name.

```ruby
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US Mints", :pieces=>99}]]]

def pieces_total_for_coordinate(nds, row_index, column_index)
  coordinate_total = 0
  inner_len = nds[row_index][column_index].length
  inner_index = 0
  while inner_index < inner_len do
    total += nds[row_index][column_index][inner_index][:pieces]
    inner_index += 1
  end
  coordinate_total
end

def number_of_snacks_in_grid(nds)
  grand_piece_total = 0
  row_index = 0
  while row_index < nds.length do
    column_index = 0
    while column_index < nds[row_index].length do
      grand_piece_total += pieces_total_for_coordinate(nds, row_index, column_index)
      column_index += 1
    end
    row_index += 1
  end
end

p number_of_snacks_in_grid(vm) #=> 1192
```

## Lab

In the lab you're going to work with the directors NDS again and clean up your
implementation from the previous lesson. You're going to be prompted to create
a "First-order method" that will keep your code cleaner.

## Conclusion

While the _insight_ we discovered in this has remained the same from the last
lesson, you should find this code much easier to scan and understand. Wrapping
"working code" inside of methods that make the code easier to work with is a
vital step in code mastery.
