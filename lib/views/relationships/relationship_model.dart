class RelationshipModel {
  final String category;
  final String type;
  final String name;
  final String gender;
  final String imageUrl;
  final int age;
  final String occupation;
  final double agreement;

  RelationshipModel({
    required this.category,
    required this.type,
    required this.name,
    required this.gender,
    required this.imageUrl,
    required this.age,
    required this.occupation,
    required this.agreement,
  });
}

// Mock Data List
final List<RelationshipModel> relationships = [
  RelationshipModel(
    category: 'Parents',
    type: 'Mother',
    name: 'Parker Slaughter',
    gender: 'Female',
    age: 49,
    imageUrl: 'assets/images/relationships/parker.png',
    agreement: 0.9,
    occupation: 'Receptionist at Binary Banking Corporation',
  ),
  RelationshipModel(
    category: 'Siblings',
    type: 'Brother',
    name: 'Sammy Grossweiner',
    gender: 'Male',
    age: 15,
    imageUrl: 'assets/images/relationships/sammy.png',
    agreement: 0.7,
    occupation: 'Teacher at green leaf school',
  ),
  RelationshipModel(
    category: 'Children',
    type: 'Son',
    name: 'Tom Riddle',
    gender: 'Male',
    age: 2,
    imageUrl: 'assets/images/relationships/tom.png',
    agreement: 0.7,
    occupation: 'None',
  ),
  RelationshipModel(
    category: 'Spouses',
    type: 'Wife',
    name: 'Max Mayfield',
    gender: 'Female',
    age: 39,
    imageUrl: 'assets/images/relationships/max.png',
    agreement: 0.8,
    occupation: 'Banker at royal wood Banking Corporation',
  ),
  RelationshipModel(
    category: 'Ex-Spouses',
    type: 'Ex Wife',
    name: 'Nancy Wheeler',
    gender: 'Female',
    age: 35,
    imageUrl: 'assets/images/relationships/nancy.png',
    agreement: 0.15,
    occupation: 'Baker at royal wood bakery house',
  ),
  RelationshipModel(
    category: 'Lovers',
    type: 'Girlfriend',
    name: 'Joyce Byers',
    gender: 'Female',
    age: 29,
    imageUrl: 'assets/images/relationships/joyce.png',
    agreement: 0.4,
    occupation: 'Teacher at royal wood high school ',
  ),
  RelationshipModel(
    category: 'Friends',
    type: 'Friend',
    name: 'Dustin Henderson',
    gender: 'Male',
    age: 35,
    imageUrl: 'assets/images/relationships/dustin.png',
    agreement: 0.9,
    occupation: 'Gym trainer at Fit Hawkins ',
  ),
];
