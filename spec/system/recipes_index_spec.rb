require "rails_helper"

RSpec.describe "List of recipes", :type => :system do
  before do
    driven_by(:rack_test)
  end

  context 'showing the recipes list' do
    before do
      VCR.insert_cassette "list_recipes"
      visit recipes_path
    end

    after do
      VCR.eject_cassette
    end

    it 'shows the total of 4 recipes' do
      expect(page).to have_text('Total recipes: 4')
    end

    it 'shows the White Cheddar Grilled Cheese with Cherry Preserves & Basil recipe' do
      expect(page).to have_text('Cheddar Grilled Cheese with Cherry Preserves & Basil')
    end

    it 'shows the calories for the White Cheddar recipe' do
      expect(page).to have_text('788')
    end
  end
end
