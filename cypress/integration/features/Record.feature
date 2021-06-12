@Record 
Feature: Test Castor Study Records E2E

Scenario Outline: Being logged in and creating a new record
Given I am logged in into Castor EDC website
And I start a new record

@HappyScenario
 Scenario:  Complete the study to 100% progress 1
 And I complete all the survey sections
 Then I will verify that the survey is 100% complete and all sections are marked as complete

@HappyScenario
Scenario:  Complete the study to 100% progress 2
And I complete all the survey sections
 And I randomize the study
 And I add an unscheduled visit for the patient
 And I add a lab test for the patient
 And I add a "user missing" cog function to "Patient gender" field
 And I add a "SDV" cog function to "Year of birth" field
 Then I will verify that the survey is 100% complete and all sections are marked as complete

@NegativeScenario
 Scenario: Add consent of the patient as No
 And I go to Study Inclusion Section
And I mark "Informed consent signed" field as "No"
Then I will find and error stating that the user cannot proceed with data entry for this study

@NegativeScenario
 Scenario: Patient has previously participated in clinical trials
And I mark "Patient has previously participated in clinical trials" field as "Yes"
Then I will find and error stating that the user cannot proceed data entry for this study
 
 @NegativeScenario
 Scenario: Patient is less than 18 or more than 60 years old
 And I go to Study Inclusion Section
And I mark "patient older than 18 and younger than 60" field as "No"
Then I will find and error stating that the user cannot proceed data entry for this study
 