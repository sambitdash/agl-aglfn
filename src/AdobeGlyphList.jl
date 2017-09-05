module AdobeGlyphList

export  aglfn,
        agl,
        zapfdingbats

struct ThisModule end

load_file(filename) = readdlm(filename, ';', String, '\n')

"""
```
    aglfn() -> Matrix{Any}
```
    Returns the mapping of glyph code to unicode character code for new fonts.
"""
function aglfn()
    path = joinpath(Pkg.dir("AdobeGlyphList"), "aglfn.txt")
    a = load_file(path)
    b = similar(a, Any)
    b[:,2:3] .= @view a[:,2:3]
    b[:,1] = map(x->Char(parse(UInt16, x, 16)), @view a[:,1])
    return b
end

"""
```
    agl() -> Matrix{Any}
```
    Returns the mapping of glyph code to unicode character code.
"""
function agl()
    path = joinpath(Pkg.dir("AdobeGlyphList"), "glyphlist.txt")
    a = load_file(path)
    b = similar(a, Any)
    b[:,1] .= @view a[:,1]
    b[:,2] .= map(@view a[:,2]) do x
        y = split(x, ' ')[1]
        return Char(parse(UInt16, y, 16))
    end
    return b
end

"""
```
    zapfdingbats() -> Matrix{Any}
```
    Returns the mapping of glyph code to unicode character code.
"""
function zapfdingbats()
    path = joinpath(Pkg.dir("AdobeGlyphList"),"zapfdingbats.txt")
    a = load_file(path)
    b = similar(a, Any)
    b[:,1] .= @view a[:,1]
    b[:,2] .= map(x->Char(parse(UInt16, x, 16)),@view a[:,2])
    return b
end

end
