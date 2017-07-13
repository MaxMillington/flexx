require 'csv'
require 'pry'
# flex = CSV.read('flex.csv')
require 'tsort'
require 'rake'
include Rake::DSL

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


# customs_cleared, departed_destination_port
# undergoing_usda_exam, customs_cleared
#
# CSV.foreach('flex.csv') do |row|
#   binding.pry
# end

# arrived_destination_port, customs_cleared
# customs_cleared, departed_destination_port
# sent_delivery_order_to_trucker, trucker_confirmed_delivery_order
# arrived_destination_port, undergoing_usda_exam
# arrived_destination_port, undergoing_fda_hold
# trucker_confirmed_delivery_order, delivery_scheduled
# undergoing_usda_exam, customs_cleared
# undergoing_fda_hold, customs_cleared
# customs_cleared, delivery_scheduled
# delivery_scheduled, departed_destination_port

# sent_delivery_order_to_trucker,
# arrived_destination_port
# undergoing_usda_exam,
# undergoing_fda_hold,
# trucker_confirmed_delivery_order
# customs_cleared
# delivery_scheduled
# departed_destination_port