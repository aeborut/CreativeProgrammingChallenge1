class Branches{
  //variables
  PVector[] branchList;
  PVector origin;
  AdjList adjacencies;
  float rootMag = 100;//define distance from origin to root node


  //constructor
  Branches(PVector a, int b){
    adjacencies = new AdjList(b);
    origin = new PVector();
    origin = a.copy();
    //PVector root = new PVector(0.0,-rootMag);
    branchList = new PVector[adjacencies.nodes.size()];
    branchList[0] = new PVector(0.0,-rootMag); // root vector goes straight up
    
    for(int i=1; i<adjacencies.nodes.size(); i++){
      int parent = adjacencies.nodes.get(i).get(0); //get index of parent node
      branchList[i]= branchList[parent].copy(); //copy parent vector
      branchList[i].setMag(0.75*branchList[parent].mag()); //resize vector appropriately
      branchList[i].rotate(random(-PI/2, PI/2)); // randomly rotate the vector
    }//end of for loop
  //at this point we have a list of vectors defined from the origin
  //iterating through and adding children to parents will create a drawable tree
    branchList[0].add(origin);
    for(int i=1; i<adjacencies.nodes.size(); i++){
      branchList[i].add(branchList[adjacencies.nodes.get(i).get(0)]);
    }//end of for loop
    //print(branchList[3].x);
  }//end of constructor

  void display(){
    line(origin.x, origin.y, branchList[0].x, branchList[0].y);
      for(int i=1; i<adjacencies.nodes.size(); i++){
        line(branchList[i].x, branchList[i].y, branchList[adjacencies.nodes.get(i).get(0)].x, branchList[adjacencies.nodes.get(i).get(0)].y);
      }//end of for loop
  }//end of display
  

}//end of class
