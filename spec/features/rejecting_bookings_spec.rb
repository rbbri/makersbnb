# feature 'rejecting a booking' do
#   scenario 'once a booking is confirmed other bookings for same date are denied' do
#     visit '/'
#     signup1
#     list_devon
#     click_button 'LOGOUT'
#     visit '/'
#     signup2
#     request_devon
#     click_button 'LOGOUT'
#     visit '/'
#     signup3
#     request_devon
#     click_button 'LOGOUT'
#     signin1
#     click_button 'REQUESTS'
#     within('form#confirm_deny_user2') do
#       click_button 'Confirm'
#     end
#     click_button 'LOGOUT'
#     signin2
#     click_button 'REQUESTS'
#     within('div.request') do
#       expect(page).to have_content 'Confirmed'
#     end
#     click_button 'LOGOUT'
#     signin3
#     click_button 'REQUESTS'
#     within('div.request') do
#       expect(page).to have_content 'Rejected'
#     end
#   end
# end
