describe("Visit Home", () => {
  it("should navigate to home", () => {
    cy.visit("/");
  })
  it("should have 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
