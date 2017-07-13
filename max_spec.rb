require 'rspec/autorun'
require_relative 'max'
require 'pry'

describe 'sorting csv things' do
  context 'when given a two line file' do
    flex = [['customs_cleared', 'departed_destination_port'], ['undergoing_usda_exam', 'customs_cleared']]
    it 'sorts two lines' do
      expect(flex_sort(flex)).to eq(%w(undergoing_usda_exam customs_cleared departed_destination_port))
    end
  end
  context 'when given a three line file' do
    flex = [
        ['departed_destination_port'],
        ['customs_cleared', 'departed_destination_port'],
        ['undergoing_usda_exam', 'customs_cleared'],
        ['arrived_destination_port', 'undergoing_usda_exam']
    ]
    it 'sorts three lines' do
      expect(flex_sort(flex)).to eq(%w(arrived_destination_port undergoing_usda_exam customs_cleared departed_destination_port))
    end
  end
end

# customs_cleared, departed_destination_port
# undergoing_usda_exam, customs_cleared

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

