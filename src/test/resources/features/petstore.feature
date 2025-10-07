Feature: PetStore API tests (v2)

  Background:
    * url baseUrl
    * configure headers = { "Content-Type": "application/json" }
    * def pet = read('classpath:data/pets.json')
    * configure retry = { count: 5, interval: 2000 }


  Scenario: Add a new pet to the store
    Given path 'pet'
    And request pet
    When method post
    Then status 200
    And match response.id == pet.id
    And match response.status == 'available'

  Scenario: Retrieve the pet by ID
    Given path 'pet', pet.id
    When method get
    Then retry until status 200
    And match response.id == pet.id
    And match response.name == pet.name

  Scenario: Update pet name and status to "sold"
    * def updated =
    """
    {
      "id": #(pet.id),
      "name": #(pet.name + '-sold'),
      "status": "sold",
      "category": #(pet.category),
      "photoUrls": #(pet.photoUrls),
      "tags": #(pet.tags)
    }
    """
    Given path 'pet'
    And request updated
    When method put
    Then status 200
    And match response.id == pet.id
    And match response.status == 'sold'

  Scenario: Retrieve the pet by ID and Status
    Given path 'pet', pet.id
    When method get
    Then status 200
    And match response.id == pet.id
    And retry until response.name == pet.name + '-sold'
    And match response.status == 'sold'