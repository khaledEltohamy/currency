class CurrencyConverterDummyResponse {
 static Map<String ,dynamic> getSuccess()=> {
    "success": true,
    "terms": "https://currencylayer.com/terms",
    "privacy": "https://currencylayer.com/privacy",
    "query": {
        "from": "USD",
        "to": "EUR",
        "amount": 10
    },
    "info": {
        "timestamp": 1727566744,
        "quote": 0.895404
    },
    "result": 8.95404
};
}