require './setup.rb'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome,args: ['--incognito']
driver.navigate.to '###'

wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
wait.until { driver.find_elements(css: '#genre_view > ul') }

display_ul_script = '
var uls = document.querySelectorAll("#genre_view > ul");
for(var i = 0; i < uls.length; i++) {
  uls[i].style.display = "block";
}
'

link_elements = driver.find_elements(css: '#genre_view a.evfd')

link_elements.length.times do |i|
  if i > 0
    driver.find_element(link: 'すべてのジャンル').click
    sleep(1)
  end

  # click big genre and display contents
  driver.execute_script display_ul_script
  link = driver.find_elements(css: '#genre_view a.evfd')[i]
  link_text = link.text
  link.click
  sleep(1)

  # get first page link
  Link.create(
    link: driver.current_url,
    category_name: link_text
  )

  # get page link from 2 to end
  driver.find_elements

end

driver.quit
