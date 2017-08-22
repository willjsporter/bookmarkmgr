require 'capybara'

feature 'Viewing Links' do

  scenario "#has a list of links" do
    link = Link.create(url: 'makersacademy.com', name: "Makaz")
    visit '/links'
    expect(page.status).to eq "200"
    #this is to check the page loads fine (regardless of content)
    within 'ul#linklist' do
      expect(page).to have_content("Makaz")
    end


  end

end
