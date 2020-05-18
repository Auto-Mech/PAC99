# PAC99

Generates NASA polynomials from thermochemical parameters.

### Requirements

While not strictly required, PAC99 makes use of ThermP output by default. In addition, ThermP makes use of output from the MESS program by default.

The user may format thermochemical data from some other program to match those in the examples directory. Of course, we encourage the use of ThermP and MESS to calculate the input thermochemical data. 

The source code and installation instructions for ThermP can be found at <https://github.com/Auto-Mech/ThermP>.  
The source code and installation instructions for MESS can be found at <https://github.com/Auto-Mech/MESS>.

See below for alternative means of obtaining PAC99 alongside both ThermP and MESS.

### Direct Installation using Conda

The most direct way to install the code is through the conda package manager.
If you have conda installed,  
(1) activate an environment in you wish to use to install PAC99, and  
(2) run the install command:
```
conda install -c auto-mech pac99
```

If you do not have a preferred Conda environment set up, an empty environment with no packages can be created and activated with the following commands
```
conda create --name myenv
conda activate myenv
```
where `myenv` should be replaced with your preferred name for the environment.

Alternatively, we also recommend building our own pre-set Auto-Mech environment, which includes PAC99, ThermP, MESS and all their dependencies. This environment can be created and activated with the commands:
```
conda env create auto-mech/amech-env
conda activate amech-env
```

If your Conda commands are not functioning, you may need to iniliatize Conda via the command
```
. /path/to/conda.sh
```
which places Conda executables in your PATH. The specific location of conda.sh depends on the Conda install.

If you do not have Conda, it can be installed using the shell script
`debug/install-conda.sh`.


### Building from source using Conda environment for dependencies

To build the code from source for development or debugging purposes, first
create a conda environment with the necessary dependencies as follows:
```
conda env create -f environment.yml
```
wich will create the `pac99-env` environment.
You can then activate the environment and build the code as follows:
```
conda activate pac99-env
bash debug/build.sh
```
To put the PAC99 executables in your PATH, you can then run
```
. debug/fake-install.sh
```
Note that the above command does not **permanently** alter your PATH, it only affects PATH for the current login session.


### Building from source without Conda

Run build.sh, which uses cmake to compile PAC99:
```
bash build.sh
```

Note that the results of the `make install` in build.sh will depend on your system setup.

### Notice
       
We are currently using a version of PAC called PAC99.  Some input features will 
be a little different than those described in the manual, NASA RP-1271, 1992, 
available from the website: 

         http://www.grc.nasa.gov/WWW/CEAWeb/ 

Also atomic weights, fundamental constants, and some of the examples have been 
updated.  Please let us know if you have any difficulties.

The FORTRAN source and data are ASCII files in our anonymous FTP server available 
at the following internet URL:

         ftp://ftp.grc.nasa.gov/users/aemc/pac/
         
The files you should have downloaded are:

    	readme.pac
    	pac99.f
		new.groups
		EFdata.i97
		exp.i97
		exp.o97
		exp.c97
		exp.e97

The root names of these files are referred to as prefixes. File names have 
extensions (suffixes) defined as follows: 

		Fortran source programs - .f
		Input files - .i97
		General output listing with tables - .o97
		Coefficients in latest thermo data format - .c97
		Element data used in calculating the Heats of Formation and LogK - .e97

The ".e97" file will be used only for elements and then only if the option is 
called for in the ".i97" file.   Coefficients output ".c97" is also an option.

GENERAL INFORMATION TO GET STARTED:

1)  Compile the fortran program pac99.f.  Note that compilers are freely available 
    from the internet.
2)  Type in the name of the executable.  PAC99 will ask for the name of the 
    input prefix.
3)  The first input file should the EFdata.i97.  PAC99 will make a binary file 
    unf.EFdata to be used for the Heats of Formation and LogK calculations in the 
    tables.
4)  The file new.groups must be available for the group additivity option.  It is 
    not a binary file.
5)  Run the sample problems exp.i97 and check the output files.

To get thermodynamic properties of individual species for the NASA Glenn 
coefficients database or to download subsets of this data, go to the following 
URL and see "about ThermoBuild" for details.

           http://cea.grc.nasa.gov/

If you have any comments or questions, contact Bonnie at Bonnie.J.McBride@nasa.gov
