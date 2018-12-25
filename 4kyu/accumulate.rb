module Enumerable
  def accumulate(*args, &block)
    prc = (args.size < 2 && block ? block : args.pop).to_proc
    acc = args.empty? ? first : args.first
    drop(1 - args.size).each {|el| acc = prc.call(acc,el)}
    acc
  end
end


# Test.describe "Fixed tests" do
#   Test.it "Simple arrays" do
#     longest = %w{ cat sheep bear }.accumulate {|memo, word| memo.length > word.length ? memo : word}
#     Test.assert_equals(longest, "sheep")

#     numbers = (1..5).to_a
#     Test.assert_equals(numbers.accumulate([]) { |a, i| a.push(i) && a }, [1,2,3,4,5])
#     Test.assert_equals(numbers.accumulate(:+), 15)
#     Test.assert_equals(numbers.accumulate(&:+), 15)
#     Test.assert_equals(numbers.accumulate(1, :+), 16)
#     Test.assert_equals(numbers.accumulate(0) { |a, i| a + i }, 15)

#     hash = {1 => true, 2 => true, 3 => true, 4 => true, 5 => true}
#     Test.assert_equals((1..5).accumulate({}) { |a, i| (a[i] = true) and a }, hash)
#   end

#   Test.it "Ranges" do
#     Test.assert_equals((5..10).accumulate(:+), 45)
#     Test.assert_equals((5..10).accumulate(&:+), 45)
#     Test.assert_equals((5..10).accumulate { |sum, n| sum + n }, 45)

#     Test.assert_equals((5..10).accumulate(1, :*), 151200)
#     Test.assert_equals((5..10).accumulate(1) { |p, n| p * n }, 151200)
#   end

#   Test.it "Should chain with other enumerators" do
#     Test.assert_equals((5..10).each.with_index.accumulate(0) { |sum, (n, i)| sum + n*i }, 130)
#     Test.assert_equals((5..10).each_with_index.accumulate(100) { |sum, (n, i)| sum + n*i }, 230)
#     Test.assert_equals([1,7,4,0,2,6,3,5].each_with_object("eCwrdsao").accumulate("") { |acc, (n, s)| acc + s[n] }, "Codewars")
#   end

#   Test.it "Edge cases" do
#     Test.assert_equals((5..10).accumulate {}, nil)
#     Test.assert_equals((5..10).accumulate() {}, nil)
#     Test.assert_equals((5..10).accumulate(:+) {}, nil)
#     Test.assert_equals((5..10).accumulate(1, :*) {}, 151200)
#     Test.assert_equals((5..10).accumulate(1, :*) {|sum, n| sum + n }, 151200)
#     Test.assert_equals((5..10).accumulate(1, :*) {raise Error}, 151200)
#     Test.assert_equals((5..10).accumulate {1}, 1)
#   end

#   Test.it "Errors" do
#     Test.expect_error { (5..10).accumulate }
#     Test.expect_error { (5..10).accumulate(1) {raise Error} }
#     Test.expect_error { (5..10).accumulate(0) }
#     Test.expect_error { (5..10).accumulate(0, nil) }
#     Test.expect_error { (5..10).accumulate(0, nil) {} }
#     Test.expect_error { (5..10).accumulate(nil, :+) }
#     Test.expect_error { (5..10).accumulate(1, :+, :*) }
#     Test.expect_error { (5..10).accumulate(1, :+, :*) {} }
#     Test.expect_error { (5..10).accumulate(1, nil) {|sum, n| sum + n } }
#     Test.expect_error { (5..10).accumulate(:*) {|sum, n| sum + n } }
#   end
# end


module Enumerable
  def accumulate(*args, &blk)
    prc = (args.length < 2 && blk ? blk : args.pop).to_proc
    raise ArgumentError unless args.length <= 1
    acc = args.length > 0 ? args.first : first
    drop(args.length > 0 ? 0 : 1).each { |el| acc = prc.call(acc, el) }
    acc
  end
end
