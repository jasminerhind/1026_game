#include <CapacitiveSensor.h>
CapacitiveSensor ap = CapacitiveSensor(3, 2);
CapacitiveSensor bp = CapacitiveSensor(5, 4);
CapacitiveSensor cp = CapacitiveSensor(7, 6);

void setup() {
  // put your setup code here, to run once:
  pinMode(11, OUTPUT);


  pinMode(12, OUTPUT);

  pinMode(13, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  long touch = ap.capacitiveSensor(30);
  long touch2 = bp.capacitiveSensor(30);
  long touch3 = cp.capacitiveSensor(30);
  // Serial.println (touch2), (touch3);

  //  if (touch > 500) {
  //    digitalWrite(11, HIGH);
  //  }
  //  else {
  //    digitalWrite(11, LOW);
  //  }
  //
  //
  //  if (touch2 > 500) {
  //    digitalWrite(12, HIGH);
  //  }
  //  else {
  //    digitalWrite(12, LOW);
  //  }
  //
  //
  //  if (touch3 > 500) {
  //    digitalWrite(13, HIGH);
  //  }
  //  else {
  //    digitalWrite(13, LOW);
  //  }


  Serial.print("S1:");
  Serial.print(touch);
  Serial.print(",");

  Serial.print("S2:");
  Serial.print(touch2);
  Serial.print(",");

  Serial.print("S3:");
  Serial.print(touch3);
  Serial.print(",");

}


