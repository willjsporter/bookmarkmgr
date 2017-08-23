require_relative '../models/link'


describe BookmarkManager do

  feature 'Viewing Links' do
    scenario "#has a list of links" do
      link = Link.create(url: 'makersacademy.com', title: "Makaz")
      visit '/links'
      expect(page.status_code).to eq 200

      # within 'ul#linklist' do
        expect(page).to have_content("Makaz")
      # end
      link.destroy
    end
  end


  feature 'creating links' do
    scenario 'has a form' do
      visit '/links/new'
      save_and_open_page
      expect(page).to have_field('title')
      expect(page).to have_field('url')
      expect(page).to have_selector('input[type=submit][value="Submit"]')
    end
  end

  end
