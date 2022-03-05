pragma solidity 0.5.1;


//We'll create a new modifier called onlyWhileOpen that will check that the current time on the
// blockchain is past a time that we specify. 
contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;

    uint256 startTime;

    modifier onlyWhileOpen() {
        require(block.timestamp >= startTime);
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() public {
        startTime = 1645955130; // Update this value
    }

    function addPerson(
        string memory _firstName,
        string memory _lastName
    )
        public
        onlyWhileOpen
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}