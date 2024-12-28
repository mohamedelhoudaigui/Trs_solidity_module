// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// interface to log tournament results in the block chain
interface ILog {

	struct	Match
	{
		uint	match_id;
		uint	p_one_score;
		uint	p_two_score;
		uint	timestamps;
		string	player_one;
		string	player_two;
		string	winner;
	}

	struct	Tour_res
	{
		uint	tor_id;
		Match[]	matches;
		string	tor_winner;
		uint	time_end;
	}

	event		TournamentAdded(uint indexed tor_id, uint indexed time_end);

	function	AddTournament(string memory tor_winner, uint time_end) external;
	function	AddMatch(uint tor_id,
						uint match_id, 
						uint p_one_score,
						uint p_two_score,
						uint timestamps,
						string memory player_one,
						string memory player_two,
						string memory winner) external;

	function GetTournament(uint tor_id) external view
	returns (
		string memory	tor_winner,
		Match[] memory	matches,
		uint			time_end
	);
}