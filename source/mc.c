#include <stdio.h>	
#include <stdlib.h>	

double montecarlo(int n) {/*def montecarlo(n)	 */
  int m, i;	
  double x, y;  
  m = 0;		  /*  m=0	         */
  for (i=1; i<=n; i++) {  /*  for i in 1..n	 */
    x = drand48();        /*    x = rand()	 */
    y = drand48();        /*    y = rand()	 */
    if (x*x + y*y < 1.0) {/*    if x*x + y*y <1.0*/
      m = m + 1;	  /*      m = m + 1	 */
    }			  /*    end		 */
  }			  /*  end		 */
  return m*1.0/n;	  /*  m*1.0/n		 */
}			  /*end			 */

int main(int argc, char** argv) {
  srand48(time(NULL));
  printf("%f\n", 4*montecarlo(1000000));
}

/* version 1.2 */
/* see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/ */
