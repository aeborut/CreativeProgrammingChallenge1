class AdjList{
  int layers; //not including root
  ArrayList<ArrayList<Integer>> nodes;
  
  AdjList(int n){
    layers = n;
    nodes = new ArrayList<ArrayList<Integer>>();
    
    int layerCount = 0; //counts layers
    int indexCount = 0; //counts nodes--> indices
    int nodesInLayer = 0; //counts nodes in current layer
    nodes.add(new ArrayList<Integer>()); //creates first entry for root
    int firstNodeInLayer = 1; //use to keep track of index of first node per layer
    for(int iter=0; iter<int(random(2,4));iter++){//randomly add 2 or 3 children
      indexCount++; //keeps incrementing to reflect total number of nodes
      nodes.get(0).add(indexCount);//add child node
      nodesInLayer++; // resets with each new layer
      nodes.add(new ArrayList<Integer>());
      nodes.get(indexCount).add(0); //2nd layer elements assigned parent (root)
    }//created root
    layerCount++;
    while (layerCount<n){
      int tempLC = nodesInLayer;
      nodesInLayer = 0; //reset for next layer
      int currentNode = firstNodeInLayer;//start at first node in layer
      firstNodeInLayer = indexCount +1;//reset for next layer
      
      for(int i = 0; i<tempLC; i++){ //iterate over entries in layer
        
        for(int iter=0; iter<int(random(2,4));iter++){//add children to each node
          indexCount++;
          nodes.get(currentNode).add(indexCount);//specify children in parent node
          nodes.add(new ArrayList<Integer>());//create children nodes
          nodes.get(indexCount).add(currentNode);//specify parent in children node
          nodesInLayer++;//update number of nodes in next layer
        }//end of creating children for currentNode
        currentNode++; //move on to the next node
      }//end of elements within currentNode
      layerCount++; //update current layer count
    }//end of layer
  }//end of constructor
  
  
}
