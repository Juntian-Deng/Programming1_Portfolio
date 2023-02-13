// Juntian Deng | Nov 2022

Button b1;
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0";
char op = ' ';
float l, r, result;
boolean left = true;


void setup() {
  size(400, 650);
  numButtons[0] = new Button(115, 590, 140, 60, '0');
  numButtons[1] = new Button(75, 520, 60, 60, '1');
  numButtons[2] = new Button(155, 520, 60, 60, '2');
  numButtons[3] = new Button(235, 520, 60, 60, '3');
  numButtons[4] = new Button(75, 450, 60, 60, '4');
  numButtons[5] = new Button(155, 450, 60, 60, '5');
  numButtons[6] = new Button(235, 450, 60, 60, '6');
  numButtons[7] = new Button(75, 380, 60, 60, '7');
  numButtons[8] = new Button(155, 380, 60, 60, '8');
  numButtons[9] = new Button(235, 380, 60, 60, '9');
  opButtons[0] = new Button(235, 590, 60, 60, '.');
  opButtons[1] = new Button(315, 590, 60, 60, '=');
  opButtons[2] = new Button(315, 520, 60, 60, '+');
  opButtons[3] = new Button(315, 450, 60, 60, '-');
  opButtons[4] = new Button(315, 380, 60, 60, '×');
  opButtons[5] = new Button(315, 310, 60, 60, '÷');
  opButtons[6] = new Button(75, 310, 60, 60, 'C');
  opButtons[7] = new Button(155, 310, 60, 60, '±');
  opButtons[8] = new Button(235, 310, 60, 60, 'L');
  opButtons[9] = new Button(95, 240, 100, 60, '√');
  opButtons[10] = new Button(205, 240, 80, 60, '²');
  opButtons[11] = new Button(305, 240, 80, 60, '^');
}


void draw() {
  background(80);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" +key);
  println("keyCode:" +keyCode);
  if (keyCode == 49 || keyCode ==97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode ==98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode ==99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode ==100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode ==101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode ==102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode ==103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode ==104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode ==105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 47 ||keyCode == 111) {
    handleEvent("/", false);
  } else if (keyCode == 61) {
    handleEvent("=", false);
  } else if (keyCode == 106) {
    handleEvent("*", false);
  } else if (keyCode == 46 || keyCode ==110) {
    handleEvent(".", false);
  } else if (keyCode == 67) {
    handleEvent("c", false);
  }
}



void handleEvent(String val, boolean num) {
  if (num) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else if (dVal.length()<18) {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    op = ' ';
    l = 0;
    r = 0;
    result = 0;
    left = true;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (val.equals("-")) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (val.equals("*")) {
    op = '×';
    left = false;
    dVal = "0";
  } else if (val.equals("/")) {
    op = '÷';
    left = false;
    dVal = "0";
  } else if (val.equals("=")) {
    performCalculation();
  }
}

void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length()<18) {
      handleEvent(str(numButtons[i].val), true);
      //if (dVal.equals("0.0")) {
      //  dVal = str(numButtons[i].val);
      //} else {
      //  dVal += str(numButtons[i].val);
      //}
      //if (left) {
      //  l = float(dVal);
      //} else {
      //  r = float(dVal);
      //}
    }
  }
  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '×') {
      handleEvent("*", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("/", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left == true) {
        l=l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(l);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'L') {
      if (left) {
        l = log(l);
        dVal = str(l);
      } else {
        r = log(l);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '²') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(l);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '^') {
      op = '^';
      left = false;
      dVal = "0";
    }
  }
  println("l:" + l + " r" + r + " op: " + op + " Left:" + left + " Result:" + result);
}
void updateDisplay() {
  fill(127);
  rect(195, 150, 300, 100);
  fill(255);
  textAlign(RIGHT);

  // Render scaling text
  if (dVal.length()<8) {
    textSize(30);
  } else if (dVal.length()<10) {
    textSize(24);
  } else if (dVal.length()<12) {
    textSize(20);
  } else if (dVal.length()<14) {
    textSize(17);
  } else if (dVal.length()<16) {
    textSize(15);
  } else if (dVal.length()<19) {
    textSize(13);
  }
  text(dVal, width-70, 150);
}

void performCalculation() {
  if (op == '+') {
    result = l+r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '×') {
    result = l*r;
  } else if (op == '÷') {
    result = l/r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  dVal = str(result);
  l = result;
  left = true;
}
