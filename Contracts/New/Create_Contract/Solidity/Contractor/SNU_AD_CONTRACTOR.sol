// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
// Start of script
/* SNU Ad system
* Blockchain ad contractor
* Solidity edition
*/
// Note: I am inexperienced with Solidity, and most of this source code was taken from Wikipedia: https://en.wikipedia.org/w/index.php?title=Solidity&oldid=1079655592
// Contracts
contract sampleAd {
	// A contract for a sample ad to be generated and added to the SNU Ad network blockchain
	address public minter;
	mapping (address => uint) public balances;

	// Events allow clients to react to specific
	// contract changes you declare
	event Sent(address from, address to, uint amount);

	// Constructor code is only run when the contract
	// is created
	constructor() {
		minter = msg.sender;
	}

	// Sends an amount of newly created coins to an address
	// Can only be called by the contract creator
	function mint(address receiver, uint amount) public {
		require(msg.sender == minter);
		balances[receiver] += amount;
	}

	// Errors allow you to provide information about
	// why an operation failed. They are returned
	// to the caller of the function.
	error InsufficientBalance(uint requested, uint available);

	// Sends an amount of existing coins
	// from any caller to an address
	function send(address receiver, uint amount) public {
	if (amount > balances[msg.sender])
		revert InsufficientBalance({
			requested: amount,
			available: balances[msg.sender]
	});

	balances[msg.sender] -= amount;
	balances[receiver] += amount;
	emit Sent(msg.sender, receiver, amount);
}}}
// Main
return sampleAd();
break;

// File info
// File type: Solidity source file (*.sol)
// File version: 1 (2022, Thursday, April 7th at 3:07 pm PST)
// Line count (including blank lines and compiler line): 60

// End of script
