% dz = dzstruct(At,K)
% **********  INTERNAL FUNCTION OF SEDUMI **********

% THE M-FILE VERSION OF THIS FUNCTION IS HERE ONLY AS ILLUSTRATION.
% SEE THE C-SOURCE FOR THE MEX-VERSION.

 %  
 %   This file is part of SeDuMi
 %   Copyright (C) 1998 Jos F. Sturm
 %   CRL, McMaster University, Canada.
 %   Supported by the Netherlands Organization for Scientific Research (NWO).
 % 
 %   This program is free software; you can redistribute it and/or modify
 %   it under the terms of the GNU General Public License as published by
 %   the Free Software Foundation; either version 2 of the License, or
 %   (at your option) any later version.
 % 
 %   This program is distributed in the hope that it will be useful,
 %   but WITHOUT ANY WARRANTY; without even the implied warranty of
 %   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 %   GNU General Public License for more details.
 % 
 %   You should have received a copy of the GNU General Public License
 %   along with this program; if not, write to the Free Software
 %   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 %
function dz = dzstruct(At,K)

error('At OS prompt, type "make" to create SeDuMi mex-files.')

