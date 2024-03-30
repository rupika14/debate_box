// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TopicManager {
    // Struct to represent a debate topic
    struct Topic {
        address creator; // Address of the topic creator
        string title;    // Title of the topic
        string description; // Description of the topic
        uint256 creationTime; // Timestamp of topic creation
        bool active;     // Flag indicating whether the topic is active
    }

    // Mapping to store topics
    mapping(uint256 => Topic) public topics;
    uint256 public totalTopics;

    // Event to log topic creation
    event TopicCreated(uint256 indexed topicId, address indexed creator, string title, string description, uint256 creationTime);

    // Modifier to check if the sender is the creator of the topic
    modifier onlyTopicCreator(uint256 _topicId) {
        require(msg.sender == topics[_topicId].creator, "Only the topic creator can perform this action");
        _;
    }

    // Function to create a new topic
    function createTopic(string memory _title, string memory _description) external {
        require(bytes(_title).length > 0, "Title cannot be empty");
        require(bytes(_description).length > 0, "Description cannot be empty");

        uint256 topicId = totalTopics++;
        topics[topicId] = Topic({
            creator: msg.sender,
            title: _title,
            description: _description,
            creationTime: block.timestamp,
            active: true
        });

        emit TopicCreated(topicId, msg.sender, _title, _description, block.timestamp);
    }

    // Function to update a topic
    function updateTopic(uint256 _topicId, string memory _title, string memory _description) external onlyTopicCreator(_topicId) {
        require(bytes(_title).length > 0, "Title cannot be empty");
        require(bytes(_description).length > 0, "Description cannot be empty");

        topics[_topicId].title = _title;
        topics[_topicId].description = _description;
    }

    // Function to deactivate a topic
    function deactivateTopic(uint256 _topicId) external onlyTopicCreator(_topicId) {
        topics[_topicId].active = false;
    }
}
