pragma solidity 0.5.1;

contract MyContract {
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;

    address owner;



    //Every account and smart contract on the Ethereum blockchain has an address and can send and 
    //receive Ether to and from this address. Usually, to store this address and address
    // related details, address datatype is used.




//msg is a global variable in solidityin which he info comes(metadata)
    modifier onlyOwner() {
        require(msg.sender == owner);  //this must be true otherwise throw error
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() public {
        owner = msg.sender;
    }

    function addPerson(
        string memory _firstName,
        string memory _lastName
    )
        public
        onlyOwner
    {
        incrementCount()
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}