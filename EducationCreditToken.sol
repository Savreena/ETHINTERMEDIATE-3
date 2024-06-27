// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract EducationCreditToken is ERC20 {
    struct CourseCompletion {
        uint completionTimestamp;
        uint courseDurationHours;
        uint scorePercentage;
    }

    mapping(address => CourseCompletion[]) private studentCourses;

    event CreditsEarned(address indexed student, uint creditAmount);
    event CreditsRedeemed(address indexed student, uint creditAmount, string courseName);

    constructor() ERC20("EducationCreditToken", "EDUTKN") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Mint initial tokens to contract deployer
    }

    function logCourseCompletion(uint durationHours, uint scorePercentage) external {
        require(durationHours > 0 && scorePercentage >= 0 && scorePercentage <= 100, "Invalid course completion parameters");

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

    function redeemCredits(uint creditAmount, string memory courseName) external {
        require(balanceOf(msg.sender) >= creditAmount, "Low credit balance");
        _burn(msg.sender, creditAmount);
        emit CreditsRedeemed(msg.sender, creditAmount, courseName);
    }

    function getStudentCourses(address student) external view returns (CourseCompletion[] memory) {
        return studentCourses[student];
    }

    function transferCreditsTo(address to, uint creditAmount) public {
        transfer(to, creditAmount);
    }
}
