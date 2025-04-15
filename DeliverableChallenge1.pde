/*------------------------------------------------------------------------------------------
Author: Alexandre Borut, student number 2210576
See README.txt file for more information about the code.
--------------------------------------------------------------------------------------------*/
import processing.pdf.*;
//Variables
//For tree structure
int treeLayers;
Branches Tree1;
PVector BasePosition;

//For Leaves
int LeafVerts;
LeafContour2 Leaf1, Leaf2, Leaf3;


void setup(){
  size(1000,1000, PDF, "DeliverableChallenge1V2.pdf");
  
  background(0);
  
  //Setup for Tree1
  treeLayers = 12;
  BasePosition = new PVector(600, 1000);
  Tree1 = new Branches(BasePosition, treeLayers);
  
  //Setup for Leaves
  LeafVerts = 150;
  PVector baseLeaf1 = new PVector(100,100);
  PVector positionLeaf1 = new PVector(200, 400);
  Leaf1 = new LeafContour2(positionLeaf1, baseLeaf1, LeafVerts);
  Leaf2= new LeafContour2(positionLeaf1, baseLeaf1, LeafVerts);
  Leaf2.originTranslate(0,-180);
  Leaf2.leafScale(2);
  Leaf2.originRotation(-PI/6);
  Leaf3 = new LeafContour2(positionLeaf1, baseLeaf1, LeafVerts);
  Leaf3.originTranslate(110,-20);
  Leaf3.leafScale(0.6);
}

void draw(){
  
  stroke(#FF0324, 80);
  strokeWeight(10);
  Tree1.display();
  strokeWeight(2);
  stroke(#14C62A, 50);
  Leaf1.display();
  Leaf2.display();
  Leaf3.display();
  
  println("Done");
  exit();
}
