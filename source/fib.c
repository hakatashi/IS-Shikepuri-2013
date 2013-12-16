#include <stdio.h>
#include <stdlib.h>

int fibr(int k) {	/* def fibr(k)       */
  if (k==0 || k==1) {	/*   if k==0 || k==1 */
    return 1;		/*     1             */
  }
  else {		/*   else            */
    return fibr(k-1) + 	/*     fibr(k-1) +   */
	   fibr(k-2);   /*     fibr(k-2)     */
  }			/*   end             */
}			/* end               */

int main(int argc, char** argv) {
  printf("%d\n", fibr(atoi(argv[1])));
}

/* version 1.1 */
/* see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/ */
