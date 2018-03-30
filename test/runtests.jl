@static if VERSION >= v"0.7-"
    using DelimitedFiles
    using Pkg
    using Test
else
    using Base.Test    
end

using AdobeGlyphList

@test size(AdobeGlyphList.agl()) == (4281, 2)
@test size(AdobeGlyphList.aglfn()) == (586, 3)
@test size(AdobeGlyphList.zapfdingbats()) == (201, 2)
