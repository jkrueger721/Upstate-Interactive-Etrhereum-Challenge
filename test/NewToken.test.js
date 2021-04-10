const { assert } = require("chai");

var NewToken = artifacts.require('./NewToken.sol');

contract("NewToken", async accounts => {
    it("should not be able to be called in between _startTime and _endTime", async () => {
        let accessDenied = false
        try {
            await NewToken.payEth({from: accounts[3]}, {value:3});
        } catch (e) {
            accessDenied = true
        }
        assert.equal(accessDenied, true, "Function not restricted to start and end time ");
    });
});