using Base.Test
using agl_aglfn

@test size(agl_aglfn.agl()) == (4281, 2)
@test size(agl_aglfn.aglfn()) == (586, 3)
@test size(agl_aglfn.zapfdingbats()) == (201, 2)
