pragma solidity ^0.4.25;

contract Election {

    //Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //Store Candidate
    //Fetch Candidate
    mapping(uint => Candidate) public candidates;
    //Store Candidates Count
    uint public candidatesCount;


    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        //후보자의 득표수를 업데이트 하기 위함
        candidates[_candidateId].voteCount ++;

    }// 공개적으로 설정하여 외부에서도 접근 가능하도록 함
}