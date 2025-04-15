class LeafContour2 {
  
  //declare attributes/fields here
  PVector[] LeafVertices;
  PVector rootVector;
  int N;
  Float angleStep;
  PVector origin;
  
  
  //define constructor
  LeafContour2(PVector position, PVector root, int n){
    rootVector = root.copy();
    N = n;
    angleStep = PI/N;
    origin = new PVector();
    origin = position.copy();
    LeafVertices = new PVector[2*N+1];
    //put base vector in at n+1 th position
    LeafVertices[N] = root.copy();
    //define array of first half of leaf
    for(int i=0; i<N; i++){
      float  mVert = rootVector.mag()/N*i;//here goes the scaling of successive vertices
      LeafVertices[i] = root.copy();
      LeafVertices[i].setMag(mVert);
      LeafVertices[i].rotate(i*angleStep-PI);
      //For second half
      LeafVertices[N+1+i] = root.copy();
      LeafVertices[N+1+i].setMag(mVert);
      LeafVertices[N+1+i].rotate(PI-i*angleStep);
    }
    /* At this point, we have a list of vertices corresponding to the root vector
    set at the origin, for drawing purposes, we will have to translate this array*/
    for(PVector vertex: LeafVertices){
      vertex.add(position);
    }
  }
  
  void display(){
    for(PVector vertex: LeafVertices){
      line(origin.x,origin.y,vertex.x,vertex.y);
    }
  }
  
  void originTranslate(float x, float y){
    origin.add(x,y);
    for(PVector vertex: LeafVertices){
      vertex.add(x,y);
    }
  }
  void leafScale(float R){
    for(PVector vertex: LeafVertices){
      vertex.sub(origin);
      vertex.setMag(vertex.mag()*R);
      vertex.add(origin);
    }
  }
  
  void pointRotation(float theta, PVector rotPoint){
    originRotation(theta);
    PVector v1;
    v1 = rotPoint.sub(origin);
    PVector v2;
    v2 = v1.rotate(theta);
    v1 = v1.add(v2);
    originTranslate(v1.x, v1.y);
  }
  void originRotation(float theta){
    for(PVector component: LeafVertices){
      component.sub(origin);
      component.rotate(theta);
      component.add(origin);
    }
  }
  
}
