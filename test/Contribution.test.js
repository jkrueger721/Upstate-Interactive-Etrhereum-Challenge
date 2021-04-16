const { assert } = require("chai");

var Contribution = artifacts.require('./Contribution.sol');
const name = "NewToken";
const symbol = "NTK";
const decimal = 10;
contract("Contribution", async accounts => {
    it("should not be called outside timeframe", async () => {
        let accessDenied = false
        const instance = Contribution.new(5555, 6565,name,symbol,decimal);
        try {
            await instance.donate({from: accounts[1], value:30});
        } catch (e) {
            accessDenied = true
        }
        assert.equal(accessDenied, true, "should not be called outside timeframe");
    
    });
    it("should be able to donate to owner address", async () => {
        const instance = await Contribution.new(-2000,65656,name,symbol,decimal);
        
        let accessDenied = false
        try {
            await instance.donate({from:accounts[2],value: 300000} );
        } catch (e) {
            accessDenied = true
        }
        assert.equal(accessDenied, false, "should be able to donate to owner address");
    });
    it("contributor amount should equal donation", async () => {
        const instance = await Contribution.new(-2000,65656,name,symbol,decimal);
        await instance.donate({from:accounts[2],value: 300} );
        const amount = await instance.getContributorTokenBalance(accounts[2]);
        assert.equal(amount,300000, "contributor amount not updating correctly");
        // const tokenSupply = await instance.getTokenTotalSupply();
        // console.log({tokenSupply});
        // const amount = await instance.getContributorAmount(accounts[2]);
        //console.log(amount);
    });
});