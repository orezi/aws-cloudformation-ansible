Feature: Setup S3 bucket and AWS Architecture

  Scenario: Setup Boto
    When I install boto
    Then it should be successful

  Scenario: Setup AWS Account
    When I setup aws account
    Then it should be successful

  Scenario: Setup S3 bucket
    When I create S3 bucket
    Then it should be successful

  Scenario: Create Static website
    When I upload static files to website
    Then it should be successful

  Scenario: Setup s3 bucket for hosting
    When I setup s3 bucket for hosting
    Then it should be successful

  Scenario: Compile Cloudformation template
    When I compile cloudformation template with jinja
    Then it should be successful

  Scenario: Launch cloudformation template
    When I launch cloudformation template
    Then it should be successful
    And cloudformation stack should be in state: complete
  
  Scenario: Create Machine Image
    When I create AMI
    Then it should be successful
    And ami should exist