# EducationCreditToken
# Description
This contract, EducationCreditToken, facilitates earning and redeeming credits based on educational course completions. Students can log their course completions and earn credits based on the duration of the course and their score percentage. These credits can later be redeemed for educational services or rewards. The contract also provides functions to view logged course completions and transfer credits between students.

# Key details

1) Implements the EducationCreditToken ERC20 token, which has the symbol EDUTKN.
2) Keeps track of the completion of student courses and grants credits according to length and percentage of pass.
3) Features for viewing student courses, transferring credits, redeeming credits, and logging course completions.

# Activity Tracking:
keeps track of students' course completions and computes credits for an ERC20 token contract called EducationCreditToken based on the length of the course and the percentage of passing grades.

# Working

1. Token Initialization : - Mints one million tokens for the contract deployer and initialises an ERC20 token called `EducationCreditToken} with symbol {EDUTKN}.

2. Course Completion Logging: - Offers a function called `logCourseCompletion} where students can record their completions of courses along with parameters like the number of hours completed and the percentage of points earned.

3. Credits computation: - Determines credits obtained by applying the following criteria for course completion: 50 credits for courses with ten hours or more, and 100 credits for scores over 80%.

4. Credit Minting: - Emits the {CreditsEarned} event and mints credits to the student's account upon successful completion of the course.

5. Credit Redemption: This feature enables students to burn tokens and emit a `CreditsRedeemed} event with the course name in order to redeem credits using the redeemCredits function.

6. Course History Retrieval: - Each student's course completion history can be retrieved using the getStudentCourses function.

7. Transfer of Credit: Allows credits to be transferred between students by using the transferCreditsTo method, which inherits token transfers from ERC20.

# Beginning the process
You can use the online Solidity IDE Remix to run this programme. Visit the Remix website at https://remix.ethereum.org/ to get started.

1) Open the Remix IDE web page.
2) Click the "+" icon in the left-hand sidebar to start a new file.
3) Import ERC20 from openzeppelin using version ~0.8.0.
4) Implement the HealthwellnessToken agreement.
5) Call health activity first, providing parameters such as calories burned and the steps taken to document activities.
6) Burn tokens with reedem tokens. following this call, use trasfer to move the token to a different address.
7) To obtain user actions, execute the logged activity method after this step.
8) Next, review the transaction specifics.
9) Use the.sol extension when saving the file.

Select the "Solidity Compiler" tab from the sidebar on the left to begin compiling the code. Click the "Compile Healthwellness.sol" button after ensuring that the "Compiler" option is set to "0.8.0" (or another compatible version).Selecting the "Deploy & Run Transactions" tab from the left-hand sidebar will allow you to deploy the contract after the code has been compiled. You are able to communicate with the contract when it is deployed.

# Examination

To make sure the code is functioning properly, compile it and run transactions to confirm functionality.

# Writer 
@Savreena Kaushal

# Licence 
The licence for this "EducationCreditToken" is under the Mit licence.


