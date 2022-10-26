describe("product page", ()=>{

  beforeEach(() => {
    cy.visit('http://localhost:3000')
   
  })

  it("Should navigate to product detail page", ()=>{
    cy.get(".products article").first()
    .click()

    cy.contains("Scented Blade")
    
  })

})