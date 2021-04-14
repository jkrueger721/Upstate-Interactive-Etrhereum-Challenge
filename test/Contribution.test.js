const { assert } = require("chai");

var Contribution = artifacts.require('./Contribution.sol');

contract("Contribution", async accounts => {
    it("should not be called with no value", async () => {
        let accessDenied = false
        try {
            await Contribution.donate({from: accounts[1]},{value:30});
        } catch (e) {
            accessDenied = true
        }
        assert.equal(accessDenied, true, "Function needs to be provide with value");
    
    });
});