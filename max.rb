require 'csv'
require 'pry'
flex = CSV.read('flex.csv')
require 'tsort'

class Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node, []).each(&block)
  end
end

def reorder_sort(arr)
  my_groups = Hash.new { |hash, key| hash[key] = [] }
  arr.each do |head, tail|
    my_groups[head] << tail
  end

  my_groups.tsort.reverse
end

sorted = reorder_sort(flex)

def write(sorted)
  sorted_arrays = sorted.map { |element| [element] }
  CSV.open('sorted.csv', 'w') do |csv|
    sorted_arrays.each do |row|
      csv << row
    end
  end
end

write(sorted)