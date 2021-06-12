import LoginPage from "../../pages/loginPage/loginPage";
import StudyPage from "../../pages/studyPage/studyPage";
import StudyInclusionPage from "../../pages/studyInclusionPage/studyInclusionPage";
import CommonPage from "../../pages/commonPage/commonPage";

const loginPage = new LoginPage();
const studyPage = new StudyPage();
const studyInclusionPage = new StudyInclusionPage();
const commonPage = new CommonPage();

Given("I am logged in into Castor EDC website", () => {
  loginPage.loginWithValidCredentials();
});
Then("I start a new record", () => {
  studyPage.startNewRecord();
});

And("I complete all the survey sections", () => {
  commonPage.completeSurvey();
});

Then(
  "I will verify that the survey is 100% complete and all sections are marked as complete",
  () => {
    studyPage.verifyProgressIs100();
  }
);
And("I go to Study Inclusion Section", () => {
  studyInclusionPage.visit();
});

And("I mark {string} field as {string}", (field, choice) => {
  studyInclusionPage.markFieldWithChoice(field, choice);
});
