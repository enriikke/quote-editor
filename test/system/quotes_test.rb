require 'application_system_test_case'

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end

  test 'creating a new quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'New quote'
    assert_selector 'h1', text: 'New Quote'

    fill_in 'Name', with: 'Test Quote'
    click_on 'Create quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Test Quote'
  end

  test 'showing a quote' do
    visit quotes_path
    click_link @quote.name

    assert_selector 'h1', text: @quote.name
  end

  test 'updating a quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'Edit', match: :first
    assert_selector 'h1', text: 'Edit Quote'

    fill_in 'Name', with: 'Updated Quote'
    click_on 'Update quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Updated Quote'
  end

  test 'destroying a quote' do
    visit quotes_path
    assert_text @quote.name

    click_on 'Delete', match: :first
    assert_no_text @quote.name
  end
end
