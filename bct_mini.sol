// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Medical_Record {
    struct Patient {
        int256 id;
        string name;
        string age;
        string weight;
        string height;
        string disease;
    }

    Patient[] Patients;

    function addPatient(
        int256 id,
        string memory name,
        string memory age,
        string memory weight,
        string memory height,
        string memory disease
    ) 
    public {
        Patient memory patient = Patient(
            id,
            name,
            age,
            weight,
            height,
            disease
        );
        Patients.push(patient);
    }

    function getPatient(int256 id) public view returns (
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        for (uint256 i = 0; i < Patients.length; i++) {
            Patient memory patient = Patients[i];
            if (patient.id == id) {
                return (
                    patient.name,
                    patient.age,
                    patient.weight,
                    patient.height,
                    patient.disease
                );
            }
        }
        return (
            "Name not Found",
            "Age not Found",
            "Weight not Found",
            "Height not Found",
            "Disease not Found"
          
        );
    }

    function getPatientCount() public view returns (uint256) {
        return Patients.length;
    }

    function getPatientById(uint256 index) public view returns (
        int256,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory
    ) {
        require(index < Patients.length, "Index out of bounds");
        Patient memory patient = Patients[index];
        return (
            patient.id,
            patient.name,
            patient.age,
            patient.weight,
            patient.height,
            patient.disease
        );
    }

    function displayAllPatients() public view returns (
        int256[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory
    ) {
        int256[] memory Ids = new int256[](Patients.length);
        string[] memory names = new string[](Patients.length);
         string[] memory ages = new string[](Patients.length);
        string[] memory weights = new string[](Patients.length);
        string[] memory heights = new string[](Patients.length);
        string[] memory diseases = new string[](Patients.length);
        for (uint256 i = 0; i < Patients.length; i++) {
            Ids[i] = Patients[i].id;
            names[i] = Patients[i].name;
            ages[i] = Patients[i].age;
            weights[i] = Patients[i].weight;
            heights[i] = Patients[i].height;
            diseases[i] = Patients[i].disease;
        }
        return (Ids, names,ages, weights, heights, diseases);
    }
}
