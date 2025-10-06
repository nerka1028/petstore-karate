Feature: PetStore API tests (v2)

  Background:
    * url baseUrl
    * def id = 752
    * def pet =
    """
    {
      "id": #(id),
      "name": "karenTest",
      "status": "available",
      "category": { "id": 0, "name": "Dogs" },
      "photoUrls": [],
      "tags": []
    }
    """

  Scenario: Add a new pet to the store
    Given path 'pet'
    And request pet
    When method post
    Then status 200
    And match response.id == id
    And match response.status == 'available'

  Scenario: Retrieve the pet by ID
    Given path 'pet', id
    When method get
    Then status 200
    And match response.id == id
    And match response.name == 'karenTest'

  Scenario: Update pet name and status to "sold"
    * def updated =
    """
    {
      "id": #(id),
      "name": "karenTest-sold",
      "status": "sold",
      "category": { "id": 1, "name": "Dogs" },
      "photoUrls": [],
      "tags": []
    }
    """
    Given path 'pet'
    And request updated
    When method put
    Then status 200
    And match response.id == id
    And match response.status == 'sold'

  Scenario: Retrieve the pet by ID and Status
    Given path 'pet', id
    When method get
    Then status 200
    And match response.id == id
    And match response.name == 'karenTest-sold'
    And match response.status == 'sold'




