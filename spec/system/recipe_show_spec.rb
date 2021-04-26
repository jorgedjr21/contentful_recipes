# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show a recipe', type: :system do
  let(:recipe) { Recipe.first }
  before do
    driven_by(:rack_test)
  end

  context 'showing a recipe' do

    before do
      VCR.insert_cassette 'show_recipe'
      visit recipe_path(recipe.id)
    end

    after do
      VCR.eject_cassette
    end

    it 'show the recipe information' do
      expect(page).to have_text(recipe.description)
    end

    it 'must have only one tag' do
      within '.card' do
        expect(page).to have_selector('span', count: 1)
      end
    end
  end

  context 'when recipe don\'t have tag' do
    let(:recipe) { Recipe.find('5jy9hcMeEgQ4maKGqIOYW6') }

    before do
      VCR.insert_cassette 'show_recipe_specific'
      visit recipe_path(recipe.id)
    end

    after do
      VCR.eject_cassette
    end


    it 'must show no tag' do
      within '.card' do
        expect(page).to have_selector('span', count: 0)
      end
    end
  end
end
