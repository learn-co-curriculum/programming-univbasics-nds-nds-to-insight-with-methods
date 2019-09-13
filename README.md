# Title

## Learning Goals

- Wrap uses of `[]` from Step 2 into new method

## Introduction

In the previous lab we used our knowledge of REPETITION and `Array` syntaxto
answer the question: "***How many pieces of snacks are in this vending
machine?***"

But our code didn't take advantage of our ability to create _methods_ to help
our human brains understand what the code was doing. While the previous
implementation _worked_, it's not fun or easy to reason about. In this method
we'll follow step 3 of our process:

3. Wrap uses of `[]` from Step 2 into new methods
  * Create simple methods with meaningful names ("First-Order Methods")
  * Ensure "First-Order Methods" use arguments to create flexibility

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
comments. Our comments are a hint that our human brains are finding the
implementation complex. What's happening in these lines ***in human terms***?

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

This _algorithm_'s purpose is to "total pieces of snack at a coordinate." We
should create a ***method*** that wraps up that _algorithm_ meaningfully. We'll
create a method that totals up the number of pieces on a spinner. We'll call
this method `pieces_total_for_coordinate`. It will take as arguments the NDS, the
row coordinate, and the column coordinate.

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

Take a look at that code, see how it's easier to read. We're iterating through
grid coordinates and, for each coordinate pair, we're asking something else, we
don't care what, to tell us how many pieces of snack are present.

This is the heart of programming: building small little methods that make it
easy for humans to reason about how we asked a computer to help us figure
something out.

We call `pieces_total_for_coordinate` a "First-Order Method." It wraps the raw
Array and REPETITION code with a meaningful name. It's much easier for our
human brains to say "iterate through the coordinates and, for each one, sum up
the pieces" than to think about all the `while` and `do` and `end` noise.

While we're at it, let's create another "First-Order Method" for what the main
_algorithm_ does. It returns "total pieces of snack in the vending machine.
Let's wrap that understanding in a human-friendly name.

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

In the lab you're going to work with the directors database again to try to
clean up your implementation  from the previous lesson. You're going to be
prompted to create a "First-order method" that will keep your code cleaner and
leaner.

## Conclusion

While the _insight_ we discovered in this has remained the same from the last
lesson, you should find this code much easier to scan and understand. Wrapping
"working code" inside of methods that make the code easier to work with is a
vital step in code mastery.
