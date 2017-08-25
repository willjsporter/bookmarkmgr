

  feature 'Adding tags to links' do
    scenario "User adds a tag" do
      Link.create(url: 'makersacademy.com', title: "Makaz")
      visit '/'
      click_button('Create new tag')
      # save_and_open_page
      fill_in("title",with: "Makaz")
      fill_in("tagname",with: 'Coding')
      click_button('Submit')
      expect(page.status_code).to eq 200
      # within 'ul#linklist' do
        expect(page).to have_content("Coding")
      # end
    end
  end
