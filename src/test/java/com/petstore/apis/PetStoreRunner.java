package com.petstore.apis;

import com.intuit.karate.junit5.Karate;

public class PetStoreRunner {

    @Karate.Test
    Karate runAll() {
        return Karate.run("classpath:features/petstore.feature");
    }
}
