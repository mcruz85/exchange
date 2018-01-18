require 'rails_helper'

RSpec.describe "Exchange Currency Process", :type => :feature do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '10'
    end

    #save_and_open_page
    result = page.find_field('result').value
    reseult = result.to_f

    #expect(result.is_a? Numeric).to eql(true)
    #expect(value != 0 || quantity == 0).to eql(true)

  end

end
