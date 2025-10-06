function fn() {
    var config = {};
    config.baseUrl = 'https://petstore.swagger.io/v2';
    karate.configure('connectTimeout', 15000);
    karate.configure('readTimeout', 15000);
    return config;
}
