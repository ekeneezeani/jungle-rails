describe("product page", ()=>{

  beforeEach(() => {
    cy.visit('http://localhost:3000')
   
  })

  it("User is able to add to cart", ()=>{
    // cy.get(".products button").first()
    // .click()

    cy.get("#navbarSupportedContent .fa")

    cy.contains("My Cart (0)")

    cy.get(".btn").first()
    .click({force: true})

    cy.contains("My Cart (1)")
    
  })

})