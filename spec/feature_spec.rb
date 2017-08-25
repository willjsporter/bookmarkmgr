require_relative '../models/link'



describe BookmarkManager do

  feature 'Viewing Links' do
    scenario "#has a list of links" do
      Link.create(url: 'makersacademy.com', title: "Makaz")
      visit '/links'
      expect(page.status_code).to eq 200
      # within 'ul#linklist' do
        expect(page).to have_content("Makaz")
      # end
    end
  end


  feature 'creating links' do
    before do
      visit '/links/new'
    end

    scenario 'has a form' do
      expect(page).to have_field('title')
      expect(page).to have_field('url')
      expect(page).to have_selector('input[type=submit][value="Submit"]')
    end

    scenario 'links go to database' do
      expect(Link).to receive(:create).with(title: "BBCtest3", url: "http://bbc.co.uk")
      fill_in('title',with: 'BBCtest3')
      fill_in('url',with: "http://bbc.co.uk")
      fill_in('tags',with: "website!!!")
      click_button('Submit')
    end
  end

  feature 'creating tags' do

    scenario 'adding a link + tag through our page' do
      visit '/links/new'
      fill_in('title',with: 'BBCtest3')
      fill_in('url',with: "http://bbc.co.uk")
      fill_in('tags',with: "useful test website")
      click_button('Submit')
      expect(page).to have_content("useful test website")
    end
  end
end
