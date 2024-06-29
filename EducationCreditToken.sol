// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; //import ERC20 contract

contract EducationCreditToken is ERC20 {  //inherited from ERC20
    struct CourseCompletion {
        uint completionTimestamp;
        uint courseDurationHours;
        uint scorePercentage;
    }

    mapping(address => CourseCompletion[]) private studentCourses; //Stores arrays of CourseCompletion structs for each student address.

    event CreditsEarned(address indexed student, uint creditAmount); //used to log information on the blockchain
    event CreditsRedeemed(address indexed student, uint creditAmount, string courseName);

    constructor() ERC20("EducationCreditToken", "EDUTKN") { //Initializes the ERC20 token with the name "EducationCreditToken" and symbol "EDUTKN", and mints 1,000,000 tokens to the deployer's address.
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Mint initial tokens to contract deployer
    }

    function logCourseCompletion(uint durationHours, uint scorePercentage) external { //Logs course completion details
        require(durationHours > 0 && scorePercentage >= 0 && scorePercentage <= 100, "Invalid course completion parameters"); //ensures that certain conditions are met before executing further code, and reverts changes with an error message if the conditions are not satisfied.

        // Calculate credits earned based on course completion
        uint creditsEarned = 0;

        if (durationHours >= 10) {
            creditsEarned += 50;
        }
        if (scorePercentage >= 80) {
            creditsEarned += 100;
        }

        require(creditsEarned > 0, "No activities meet the criteria for earning credits");

        _mint(msg.sender, creditsEarned);
        emit CreditsEarned(msg.sender, creditsEarned);

        // Record the course completion
        studentCourses[msg.sender].push(CourseCompletion({
            completionTimestamp: block.timestamp,
            courseDurationHours: durationHours,
            scorePercentage: scorePercentage
        }));
    }

    function redeemCredits(uint creditAmount, string memory courseName) external { //Allows a student to redeem a specified amount
        require(balanceOf(msg.sender) >= creditAmount, "Low credit balance");
        _burn(msg.sender, creditAmount);
        emit CreditsRedeemed(msg.sender, creditAmount, courseName);
    }

    function getStudentCourses(address student) external view returns (CourseCompletion[] memory) { //Returns an array of CourseCompletion
        return studentCourses[student];
    }

    function transferCreditsTo(address to, uint creditAmount) public { //Transfers a specified amount of credits (tokens) from the caller's account to another address.
        transfer(to, creditAmount);
    }
}
