int switch_func(int i) {
     int res = 0;
     switch (i) {
     case 0:
          res = 7;
          break;
     case 1:
          res = 2;
          break;
     case 2:
          res = 9;
          break;
     case 3:
          res = 12;
     default:
          res = i - 2;
     }

     return res;
}
