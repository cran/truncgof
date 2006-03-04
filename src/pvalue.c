#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>
#include <R_ext/Utils.h>

SEXP pvalue(SEXP list, SEXP fn, SEXP rho, SEXP TS, SEXP tol)
{
    void R_CheckUserInterrupt(void);

	R_len_t n = length(list);
	SEXP R_fcall, ans;
	double i, k = 0, z[2], val;
	
	PROTECT(R_fcall = lang2(fn, R_NilValue));
	PROTECT(ans = allocVector(REALSXP, 2));

	z[1] = 2;
	for(i = 0; i < n; i++)
	{
		SETCADR(R_fcall, VECTOR_ELT(list, i));
		val = REAL(eval(R_fcall, rho))[0];
		if (val > asReal(TS)) k++; 
		z[0] = z[1]; 
		z[1] = k/(i+1);
		if ((fabs(z[1]-z[0]) < asReal(tol)) && (fabs(z[1]-0.5) < 0.5)) 
			break;
	}

	REAL(ans)[0] = i;
	REAL(ans)[1] = z[1];

	UNPROTECT(2);
	return(ans);
}
