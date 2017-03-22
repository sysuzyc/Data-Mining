This is the Matlab (protected) program of SVStream for testing only.
Created by Chang-Dong Wang with Sun Yat-sen University

This program is tested on several 32 bit Matlab such as Matlab 7.8.0 (R2009a) and 7.12.0.635 (R2011a).
running Windows XP professional operating system.
You are suggested to use a 32 bit Matlab with version higher than R2009a running Windows XP for testing. Thank you.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Usage:

Open the only .m file, namely, SVStream_Demo.m, to test SVStream.

Both two synthetic data streams used in the SVStream paper, i.e., reference 1, 
are contained in the directory Datasets, which are Ring_Ball and Smileface_TwoMoons. 
The other two real streams are too large to be contained in the supplementary file, 
which however can be easily downloaded as described in the paper.

For each dataset, their default parameters, as well as the analyzed ranges of parameters (named as ¡°Test_***s¡±), are listed. 

For testing the performance of SVStream on one specific parameter, 
you can use different values listed for this parameter, 
while fixing the other five parameters as their default values.

For instance, when testing the kernel parameter q on Ring_Ball, you should:
1. set the other five parameters to the default values, i.e.,
Options.M=100; 
Options.eta=1; 
Options.delta=0.6; 
Options.zeta=2; 
Options.C=0.25;
2. set the kernel parameter q to the different values listed for it, i.e., Test_qs=7:13;
3. Run SVStream_Demo on the Matlab.

Moreover, there is another field of Options, namely, Options.PlotResults, which works only for 2-D data streams.
If you want to plot the results in figure, set Options.PlotResults=1; otherwise, set Options.PlotResults=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

References:
1. Wang et al., SVStream: A Support Vector Based Algorithm for Clustering Data Streams, Submitted to IEEE TKDE.
2. http://www.stanford.edu/~dgleich/programs/matlab_bgl
3. Stprtool: http://cmp.felk.cvut.cz/cmp/software/stprtool/