/// <reference types="cypress" />

describe("Verify Browser Stack Home Page", () => {
  beforeEach(() => {
    cy.visit("https://www.browserstack.com/");
  })
  it("Verify Browserstack logo is visible", () => {
    cy.get("#logo").should("be.visible");
  })

  it("Verify Header is present", () => {
    cy.get("h1").should('exist').and('contain.text', 'App & Browser Testing Made Easy');
  })

  it("Verify Product menu are present", () => {
    cy.get("#product-menu-toggle").first().should("be.exist");

    cy.get("#developers-menu-toggle").first().should("be.exist");

    cy.get("#developers-menu-toggle").first().should("be.exist");
  })

  it("Verify menu Links are present", () => {
    cy.get("a[title='Pricing']").first().should("be.exist");

    cy.get("a[title='Sign In']").first().should("be.exist");

    cy.get("a[title='Live for Teams']").first().should("be.exist");
  });
});
