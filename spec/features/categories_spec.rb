require 'rails_helper'

RSpec.describe 'category index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Emmanuel', email: 'epaltechs@gmail.com', password: '543210')
    @category = Category.create(name: 'hello', icon: 'icon',
                                user_id: @user.id)
    @expense = Expense.create(name: 'expense', amount: 4,
                              user_id: @user.id, category_id: @category.id)
    visit new_user_session_path
    fill_in 'Email', with: 'epaltechs@gmail.com'
    fill_in 'Password', with: '543210'
    click_button 'Log in'
    visit categories_path
  end
  describe 'tests for view categories#index' do
    it 'categories title' do
      expect(page).to have_content 'Categories'
    end

    it 'see a name of category' do
      expect(page).to have_content 'Hello'
    end

    it 'see the total amount' do
      expect(page).to have_content '$4'
    end
  end
end
