require 'csv'
require 'pry'
flex = CSV.read('flex.csv')
require 'tsort'

class Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

def flex_sort(arr)
  stuff = arr.map do |head, *tail|
    {head => tail}
  end
  stuff.reduce(&:merge).tsort.reverse
end

sorted = flex_sort(flex)

def write(sorted)
  sorted_arrays = sorted.map { |element| [element] }
  CSV.open('sorted.csv', 'w') do |csv|
    sorted_arrays.each do |row|
      csv << row
    end
  end
end

write(sorted)