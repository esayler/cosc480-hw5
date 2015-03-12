Feature: Update existing product
  As the toy store manager,
  so that I keep my inventory information up to date,
  I want to be able to update toy information.

  Background: the toy story has several products
    Given these Products:
      | name         |    description     | price | 
      | slinky       | silvery and shiny  |  3.49 | 
      | fluffy bunny | fluffy and lovable | 17.50 |            
      | ball         | rubbery and round  | 13.49 | 

  Scenario: Create a new product without specific image
    Given I am on the products page
    When I press "fluffy bunny"
    Then I should see "fluffy and lovable"
    And I should see "17.5"
    And I should see the image "/images/medium/noimg.png"
    When I press "Edit product"
    And I fill in "Description" with "less fluffy than you'd think"
    And I fill in "product_minimum_age_appropriate" with "4"
    And I fill in "Price" with "999.95"
    And I attach the file "bunny.jpg" to "Image"
    And I press "Update product"
    Then I should see "less fluffy than you'd think"
    And I should see "4"
    And I should see "999.95"
    And I should see the image "bunny.jpg"
