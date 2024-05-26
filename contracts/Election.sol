pragma solidity ^0.4.25;

contract Election {

    //Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //Store accounts that have voted
    mapping(address => bool) public voters;
    //Store Candidate
    //Fetch Candidate
    mapping(uint => Candidate) public candidates;
    //Store Candidates Count
    uint public candidatesCount;

    event votedEvent(
        uint indexed _candidateId
    );


    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        //조건) 투표한 적이 없어야 됨
        require(!voters[msg.sender]);//초기 상태가 부울값이 false여야 함
        //조건) 유효한 후보자에게 투표하고 있는지
        require(_candidateId > 0 && _candidateId <= candidatesCount);//후보자의 id는 후보자의 수보다 작거나 같음
        //유권자가 투표했음을 기록
        voters[msg.sender] = true;

        //후보자의 득표수를 업데이트 하기 위함
        candidates[_candidateId].voteCount ++;

        votedEvent(_candidateId);//이벤트 트리거

    }// 공개적으로 설정하여 외부에서도 접근 가능하도록 함
}