@api @search @stability @DS-498 @DS-673
Feature: Search
  Benefit: In order to find specific content
  Role: As a LU
  Goal/desire: I want to search the site for content

  Scenario: Successfully search content
    Given "event" content:
      | title              | body               |
      | Event first        | Description one    |
      | Event second       | Description two    |
    And "topic" content:
      | title              | body               |
      | Topic first        | Description three  |
      | Topic second       | Description four  |
    And I am logged in as an "authenticated user"
    #@TODO: Change "search/content" to the homepage when search block will be in the header
    And I am on "search/content"
    When I fill in the following:
      | Search the entire website | first |
    And I press "Search"
    And I should see "Search Content" in the ".page-title" element
    And I should see "Event first" in the "Main content"
    And I should see "Topic first"
    And I should not see "Event second"
    # Scenario: Successfully filter search results
    When I select "topic" from "Content type"
    And I press "Filter" in the "Sidebar second"
    And I should see "Topic first"
    And I should not see "Event first"