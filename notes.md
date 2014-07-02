# examples

## radar imaging
have a 512x512 matrix, most of whose entries are zero. a few nonzeros with real or complex entries. We do a (2d?) fourier transform on the signal and add noise.

- try to recover with inverse fft, get junk
- recover with tikinov regularization, still get junk
- recover with sparsity, should look great
- figure out the physics
- candes class?
- radar, fourier, complex tutorials?
- look at Candes' super resolution paper

## image deblurring
- have some motion blur kernel
- use iterative reweighting to recover edges very nicely
- shoudl work on cartoon images

## robust kalman filter
- add noise
- some percentage of observations are just totally off
- minimize 2-norm of state plus 1 norm of sparse errors
- <http://www.stanford.edu/~boyd/papers/pdf/rt_cvx_sig_proc.pdf>
- use anomoly detection to find interesting points: driver did something weird here!