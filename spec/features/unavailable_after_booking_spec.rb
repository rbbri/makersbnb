# feature "dates show as unavailable after booking" do
#   scenario "users cannot book unavailable dates" do
#     visit '/'
#     signup1
#     list_devon
#     click_button 'LOGOUT'
#     signup2
#     request_devon
#     click_button 'LOGOUT'
#     signin1
#     click_button 'REQUESTS'
#     within('td#requests_received') do
#       click_button 'Confirm'
#     end
#     click_button 'LOGOUT'
#     signup3
#     click_link 'Devon'
#     find('#start_date').click
#     save_and_open_page
#     expect(page).to have_content("14")
#     #EXPECT 2018-11-12 - 2018-11-13 to be greyed out - HOW????
#   end
# end
