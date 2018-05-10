import processing.serial.*;
Serial myPort;

int val;


float sensor1 = 0;
float sensor2 = 0;
float sensor3 = 0;

void setupSerial() {
  printArray(Serial.list());
  try {
    String portName = Serial.list()[1];
    myPort = new Serial(this, portName, 9600);  //115200
    println("connected to -->  " +portName);
    myPort.bufferUntil(','); //enables to split the data via a comma which is set in teh arduino code
  } 
  catch (Exception e) {
    println("no device connection found");
  }
}




void serialEvent(Serial myPort) {

  String inString = myPort.readStringUntil(',');
  // split the string into multiple strings
  // where there is a delimter":"

  // println(inString); //data line coming in

  String items[] = split(inString, ':');
  // if there was more than one string after the split
  if (items.length > 1) {
    String label = trim(items[0]);
    // remove the ',' off the end
    String val = split(items[1], ',')[0];

    // check what the label was and update the appropriate variable
    if (label.equals("S1")) {
      println("looks like sensor 1 was   "+val);
      sensor1 = float(val);
      if (sensor1>200) {
        player1.loc.x=217.6;
      }
    } 
    // check what the label was and update the appropriate variable
    if (label.equals("S2")) {
      println("looks like sensor 2 was   "+val);
      sensor2 = float(val);
      if (sensor2>200) {
        player1.loc.x=640;
      }
    } 

    if (label.equals("S3")) {
      println("looks like sensor 3 was   "+val);
      sensor3 = float(val);
      if (sensor3>200) {
        player1.loc.x=1062.4;
      }
    }
  }
  
}