require_relative '../models/link'

feature 'Viewing Links' do

  scenario "#has a list of links" do
    Link.create(url: 'makersacademy.com', title: "Makaz")
    visit '/links'
    expect(page.status_code).to eq 200
    save_and_open_page
    #this is to check the page loads fine (regardless of content)
    # within 'ul#linklist' do
      expect(page).to have_content("Makaz")
    # end
  end
end
