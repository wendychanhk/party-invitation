#!/usr/bin/env ruby
require_relative './lib/party_invitation'
require_relative './lib/customer_data_parser'
require_relative './lib/distance_calculator'

invitation = PartyInvitation.new('./data/customer-data.txt', 53.339428, -6.257664, 100, 'km')
invitation.output_selected_customers_list
