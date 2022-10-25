describe("product page", ()=>{

  beforeEach(() => {
    cy.visit('http://localhost:3000')
   
  })

  it("Should give details of the product", ()=>{
    cy.get(".products article").first()
    .click()

    cy.contains("Scented Blade")
    
  })

})