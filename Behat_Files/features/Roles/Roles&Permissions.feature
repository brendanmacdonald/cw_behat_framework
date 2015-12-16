Feature: Helper Feature
  In order to test the Roles and Responsibilities
  As a variety of users
  I need to verify the Drupal CMS permission settings

  Rules:
  The security permissions for the following users will be verified:
  - Anonymous User
  - Administrator
  - TBC

#########################################################################################
###   ANONYMOUS USER
#########################################################################################

  @roles @api @regression @smoke
  Scenario: Verify Anonymous User access to the homepage
    Given I am not logged in
    Then I check the HTTP response code is 200 for '/'

  @roles @api @regression
  Scenario: Verify Anonymous User access to /user/login
    Given I am not logged in
    Then I check the HTTP response code is 200 for '/user/login'

  @roles @api @regression
  Scenario: Verify Anonymous User access to /node/add
    Given I am not logged in
    Then I check the HTTP response code is 403 for '/node/add'

  @roles @api @regression
  Scenario: Verify Anonymous User access to /admin
    Given I am not logged in
    Then I check the HTTP response code is 403 for '/admin'

  @roles @api @regression
  Scenario: Verify Anonymous User access /user/logout
    Given I am not logged in
    Then I check the HTTP response code is 403 for '/user/logout'


#########################################################################################
###   ADMINISTRATOR
#########################################################################################

  @roles @api @regression
  Scenario: Verify Administrator access to /node/add
    Given I am logged in as a user with the administrator role
    And I am on "/node/add"
    Then the response status code should be 200

  @roles @api @regression
  Scenario: Verify Administrator access to /admin
    Given I am logged in as a user with the administrator role
    And I am on "/admin"
    Then the response status code should be 200

  @roles @api @regression
  Scenario: Verify Administrator access /user/logout
    Given I am logged in as a user with the administrator role
    And I am on "/user/logout"
    Then the response status code should be 200