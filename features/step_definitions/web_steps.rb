#TODO: and I should see $17.50 and I should see $999.95

Given(/^these Products:$/i) do |table|
  table.hashes.each do |fhash|
    if fhash.has_key? "minage"
      fhash["minimum_age_appropriate"] = fhash.delete("minage")
    end
    if fhash.has_key? "maxage"
      fhash["maximum_age_appropriate"] = fhash.delete("maxage")
    end
    Product.create!(fhash)
  end
end

Given (/^(?:|I )am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When (/^(?:|I )fill in the following:$/) do |fields|
  fields.rows_hash.each do |name, value|
    fill_in name, with: value
  end
end

Then (/^I should be on the products page$/) do
  expect(page).to have_content("All products")
end

And (/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

And (/^I should see that "(.*?)" has a price of "(.*?)"$/) do |name, price|
  names = []
  all(".productname").each { |n| names << n.text }
  prices = []
  all(".price").each { |p| prices << p.text }
  expect(names.index(name)).to eq(prices.index(price))
end

And (/^I should see that "(.*?)" has an image "(.*?)"$/) do |name, path|
  names = []
  all(".productname").each { |n| names << n.text }
  images = []
  all("img").each { |i| images << i['src'] }
  expect(images[names.index(name)]).to match(/.*#{path}.*/)
end

When (/^I attach the file "(.*?)" to "(.*?)"$/) do |arg1, arg2|
  attach_file('Image', arg1)
end

When (/^I go to the products page$/) do
  visit(products_path)
end

And (/^I fill in "(.*?)" with "(.*?)"$/i) do |label, input|
  if label =~ /minimum age/i
    page.fill_in 'filter[min_age]', with: input
  elsif label =~ /maximum price/i
    page.fill_in 'filter[max_price]', with: input
  else
    page.fill_in label, with: input
  end
end

When (/^I press "(.*?)"$/) do |thing|
  click_on(thing)
end

Then (/^I should not see "(.*?)"$/) do |thing|
  expect(page).to have_no_content(thing)
end

Then (/^I should see product price in sorted order$/) do
  prices = []
  all(".price").each { |n| prices << n.text }
  prices.map! { |price| price[1..-1].to_f }
  expect(prices).to eq(prices.sort)
end

Then (/^I should see product name in sorted order$/) do
  names = []
  all(".product_name").each { |name| names << name.text }
  expect(names).to eq(names.sort)
end

Then (/^I should see the image "(.*?)"$/) do |path|
  expect(all('img').first['src']).to match(/#{path}/)
  #images[names.index(name)].should match(/.*#{path}.*/)
end
