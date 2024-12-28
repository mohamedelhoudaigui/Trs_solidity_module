// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ILog.sol";

abstract contract Log is ILog
{

	mapping (uint => Tour_res)	id_to_tour;
	Tour_res[]					Tournaments;

	constructor() ILog()
	{

	}
}